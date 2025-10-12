import 'dart:math';

import 'package:dart_frog/dart_frog.dart';
import 'package:server/db/database.dart';
import 'package:server/features/content_manager/content_manager.dart';
import 'package:server/features/kopplings/koppling.dart';

/// Loads the Kopplings from the ContentManager and sends them over to the Client
Future<Response> onRequest(RequestContext context) async {
  final user = context.request.url.queryParameters['user'];
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
  final List<Koppling> actualKopplings = [];
  final List<Koppling> kopplings =
      content.kopplings.getRange(start, end).toList();
  final wordIds = kopplings.map((e) => e.words).expand((e) => e).toSet();
  final wordsForKoppling =
      content.words.where((e) => wordIds.contains(e.id)).toList();
  for (final k in kopplings) {
    // Fetch if the user has done this koppling
    final relation = await managers.userKopplingsTable
        .filter((f) => f.user.username.equals(user))
        .filter((f) => f.koppling.id.equals(k.id))
        .getSingleOrNull();
    if (relation != null) {
      final koppling = await managers.kopplingsTable
          .filter((f) => f.id.equals(k.id))
          .getSingleOrNull();
      final correctGroups = koppling != null
          ? (koppling.correctGroups
              .split(',')
              .map(int.tryParse)
              .whereType<int>()
              .toList())
          : <int>[];
      if (koppling != null) {
        actualKopplings.add(
          Koppling(
            id: k.id,
            words: k.words,
            createdAt: k.createdAt,
            misses: koppling.misses,
            completed: koppling.completed,
            solved: koppling.solved,
            correctGroups: correctGroups,
          ),
        );
        continue;
      }
    }
    actualKopplings.add(k);
  }

  return Response.json(
    body: {
      'kopplings': actualKopplings.map((e) => e.toJson()).toList(),
      'words': wordsForKoppling.map((e) => e.toJson()).toList(),
      'total': allKopplings,
      'page': int.tryParse(page ?? '0') ?? 0,
      'pageSize': int.tryParse(pageSize ?? '10') ?? 10,
    },
  );
}
