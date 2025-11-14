import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dart_frog/dart_frog.dart';
import 'package:encrypt/encrypt.dart' as enc;

// [A02 Cryptographic Failures] Encryption is currently disabled.
// Setting this true would enable .
const enableCrypto = false;
const _keyStr = 'my-32-length-secret-key-yup-1234';

Handler middleware(Handler handler) {
  return handler.use(_cors).use(_crypto);
}

Handler _cors(Handler handler) {
  return (context) async {
    if (context.request.method == HttpMethod.options) {
      return Response(
        statusCode: HttpStatus.noContent,
        headers: _corsHeaders,
      );
    }
    final response = await handler(context);
    return response.copyWith(
      headers: {
        ...response.headers,
        ..._corsHeaders,
      },
    );
  };
}

const _corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  // [A01 Broken Access Control] Here, we should instead specify the origin and
  // methods we want to allow properly, like:
  // 'Access-Control-Allow-Origin': 'https://koppling.app',
  'Access-Control-Allow-Methods': 'GET, POST, PUT, PATCH, DELETE, OPTIONS',
  'Access-Control-Allow-Headers':
      'Origin, Content-Type, X-Auth-Token, X-Encrypted, X-IV',
};

class _DecryptedPayload {
  _DecryptedPayload(this.text, this.json, this.wasEncrypted, this.ivB64);
  final String text;
  final dynamic json;
  final bool wasEncrypted;
  final String? ivB64;
}

Handler _crypto(Handler handler) {
  return (context) async {
    if (!enableCrypto) {
      return handler(context);
    }

    final req = context.request;
    if (req.method == HttpMethod.options) {
      return handler(context);
    }

    final wantsEncryption =
        (req.headers['X-Encrypted'] ?? req.headers['x-encrypted']) == '1';

    _DecryptedPayload? decrypted;

    if (wantsEncryption && req.method != HttpMethod.get) {
      final ivHeader = req.headers['X-IV'] ?? req.headers['x-iv'];
      if (ivHeader == null || ivHeader.isEmpty) {
        return Response.json(
          statusCode: HttpStatus.badRequest,
          body: {'error': 'Missing X-IV header.'},
        );
      }

      enc.IV iv;
      try {
        iv = enc.IV(base64Decode(ivHeader));
      } catch (_) {
        return Response.json(
          statusCode: HttpStatus.badRequest,
          body: {'error': 'Invalid X-IV header.'},
        );
      }
      if (iv.bytes.length != 16) {
        return Response.json(
          statusCode: HttpStatus.badRequest,
          body: {'error': 'IV must be 16 bytes.'},
        );
      }

      final key = enc.Key.fromUtf8(_keyStr);
      final aes = enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc));

      final cipherBytes = await _readRequestBytes(req);

      Uint8List plain;
      try {
        plain = Uint8List.fromList(
          aes.decryptBytes(enc.Encrypted(cipherBytes), iv: iv),
        );
      } catch (_) {
        return Response.json(
          statusCode: HttpStatus.badRequest,
          body: {'error': 'Decryption failed'},
        );
      }

      final text = utf8.decode(plain);
      dynamic parsed;
      try {
        parsed = jsonDecode(text);
      } catch (_) {
        parsed = null;
      }

      decrypted = _DecryptedPayload(text, parsed, true, ivHeader);
    }

    final nextCtx = decrypted == null
        ? context
        : context.provide<_DecryptedPayload>(() => decrypted!);

    final res = await handler(nextCtx);

    if (!(decrypted?.wasEncrypted ?? false)) {
      return res;
    }

    final ivHeader = decrypted!.ivB64!;
    final key = enc.Key.fromUtf8(_keyStr);
    final aes = enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc));
    final iv = enc.IV(base64Decode(ivHeader));

    final plainText = await _stringifyBody(res.body);

    final cipher = aes.encrypt(plainText, iv: iv);

    return Response.bytes(
      statusCode: res.statusCode,
      headers: {
        ...res.headers,
        'Content-Type': 'application/octet-stream',
        'X-Encrypted': '1',
        'X-IV': ivHeader,
      },
      body: cipher.bytes,
    );
  };
}

Future<Uint8List> _readRequestBytes(Request req) async {
  try {
    final stream = req.bytes();
    final chunks = await stream.toList(); // List<List<int>>
    final flat = <int>[];
    for (final c in chunks) {
      flat.addAll(c);
    }
    return Uint8List.fromList(flat);
  } catch (_) {
    final s = await req.body();
    try {
      return Uint8List.fromList(base64Decode(s));
    } catch (_) {
      return Uint8List.fromList(utf8.encode(s));
    }
  }
}

// Coerce any response body shape into a String for encryption.
Future<String> _stringifyBody(dynamic body) async {
  if (body == null) return '';
  if (body is String) return body;
  if (body is Uint8List) return utf8.decode(body);
  if (body is List<int>) return utf8.decode(body);
  if (body is Future) {
    final v = await body;
    return _stringifyBody(v);
  }
  if (body is Function) {
    // ignore: avoid_dynamic_calls
    final v = body();
    return _stringifyBody(v);
  }
  // Map/List/num/bool/etc.
  return jsonEncode(body);
}

Future<String> decryptedBody(RequestContext context) async {
  try {
    final d = context.read<_DecryptedPayload>();
    return d.text;
  } catch (_) {
    // not provided → fall back to normal request.body()
    return context.request.body();
  }
}

Future<dynamic> decryptedJson(RequestContext context) async {
  try {
    final d = context.read<_DecryptedPayload>();
    if (d.json != null) return d.json;
  } catch (_) {
    // ignore, just fall back
  }
  return context.request.json();
}
