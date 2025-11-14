import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

// [A02 Cryptographic Failures]
// Using this interceptor for the HTTP client will enable AES256 encryption.
// The application isn't using this normally, but if I were to fix this problem,
// I would add it to the HTTP client.
const _keyStr = 'my-32-length-secret-key-yup-1234'; // 32 bytes
final _key = encrypt.Key.fromUtf8(_keyStr);
// Use a NON-zero IV in production; rotate per request. For demo:
final _iv = encrypt.IV.fromLength(16);
final _aes = encrypt.Encrypter(
  encrypt.AES(_key, mode: encrypt.AESMode.cbc),
); // PKCS7

class CryptoInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Only encrypt bodies (GET has no body)
    if (options.data != null && options.method != 'GET') {
      final plainJson = _normalizeToJsonString(options.data);
      final encrypted = _aes.encrypt(plainJson, iv: _iv).bytes;
      options.data = Uint8List.fromList(encrypted);
      options.responseType = ResponseType.bytes;
      options.headers['Content-Type'] = 'application/octet-stream';
      options.headers['Accept'] = 'application/octet-stream';
      options.headers['X-Encrypted'] = '1';
      options.headers['X-IV'] = base64Encode(_iv.bytes);
    } else {
      options.responseType = ResponseType.bytes;
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // If server returned bytes, try to decrypt; otherwise pass through
    if (response.data is List<int> || response.data is Uint8List) {
      final bytes = response.data is Uint8List
          ? response.data as Uint8List
          : Uint8List.fromList(response.data as List<int>);

      try {
        // Decrypt -> UTF8 -> maybe JSON
        final decrypted = _aes.decryptBytes(encrypt.Encrypted(bytes), iv: _iv);
        final text = utf8.decode(decrypted);

        // If it looks like JSON, parse; else keep as string
        final dynamic parsed = _looksLikeJson(text) ? json.decode(text) : text;

        handler.next(response..data = parsed);
        return;
      } catch (e) {
        // Not encrypted / wrong endpoint -> try to interpret as text
        try {
          final json = jsonDecode(utf8.decode(bytes));
          handler.next(response..data = json);
          return;
        } catch (_) {
          // Leave as bytes if all else fails
          handler.next(response);
          return;
        }
      }
    }

    handler.next(response);
  }

  String _normalizeToJsonString(dynamic data) {
    if (data == null) return 'null';
    if (data is String) return data;
    if (data is List<int>) return utf8.decode(data);
    if (data is FormData) {
      // If you truly need multipart + encryption, serialize fields/files yourself.
      final map = {
        'fields': {for (final f in data.fields) f.key: f.value},
      };
      return json.encode(map);
    }
    return json.encode(data);
  }

  bool _looksLikeJson(String s) {
    final t = s.trimLeft();
    return t.startsWith('{') ||
        t.startsWith('[') ||
        t == 'null' ||
        t == 'true' ||
        t == 'false' ||
        num.tryParse(t) != null;
  }
}
