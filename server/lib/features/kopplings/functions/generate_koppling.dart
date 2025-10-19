import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:server/features/content_manager/content_manager.dart';
import 'package:server/features/kopplings/koppling.dart';

/// Generates a new koppling.
Future<void> generateKoppling() async {
  final largestId = content.kopplings.isEmpty
      ? 0
      : content.kopplings.map((k) => k.id).reduce((a, b) => a > b ? a : b);
  final wordsLength = content.words.length;
  final words = List<int>.generate(4, (index) => Random().nextInt(wordsLength));
  final newKoppling = Koppling(
    id: largestId + 1,
    words: words,
    createdAt: DateTime.now(),
  );
  content.kopplings.add(newKoppling);
  print('Generated new koppling with id ${newKoppling.id}');
  await saveKopplings();
}

/// Saves kopplings to data/kopplings.json
Future<void> saveKopplings() async {
  final kopplingsFile = File('data/kopplings.json');
  final kopplingList =
      content.kopplings.map((k) => k.toMap()).toList(growable: false);
  final kopplingJson = const JsonEncoder.withIndent('  ').convert(kopplingList);
  await kopplingsFile.writeAsString(kopplingJson);
  print('Saved ${content.kopplings.length} kopplings to data/kopplings.json');
}
