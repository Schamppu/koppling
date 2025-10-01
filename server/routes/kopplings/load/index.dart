import 'dart:math';

import 'package:dart_frog/dart_frog.dart';
import 'package:server/features/content_manager/content_manager.dart';

/// Loads the Kopplings from the ContentManager and sends them over to the Client
Response onRequest(RequestContext context) {
  final page = context.request.url.queryParameters['page'];
  final pageSize = context.request.url.queryParameters['pageSize'];
  int start =
      (int.tryParse(page ?? '0') ?? 0) * (int.tryParse(pageSize ?? '10') ?? 10);
  int end = start + (int.tryParse(pageSize ?? '10') ?? 10);
  final allKopplings = content.kopplings.length;
  if (start >= allKopplings) {
    start = max(0, allKopplings - (int.tryParse(pageSize ?? '10') ?? 10));
  }
  if (end > allKopplings) {
    end = allKopplings;
  }
  final kopplings = content.kopplings.getRange(start, end);
  final wordIds = kopplings.map((e) => e.words).expand((e) => e).toSet();
  final wordsForKoppling =
      content.words.where((e) => wordIds.contains(e.id)).toList();
  print(
      'Loaded words for kopplings: ${wordsForKoppling.length}, ids: $wordIds');
  return Response.json(
    body: {
      'kopplings': kopplings.map((e) => e.toJson()).toList(),
      'words': wordsForKoppling.map((e) => e.toJson()).toList(),
      'total': allKopplings,
      'page': int.tryParse(page ?? '0') ?? 0,
      'pageSize': int.tryParse(pageSize ?? '10') ?? 10,
    },
  );
}
