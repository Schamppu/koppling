import 'dart:convert';
import 'dart:io';

import 'package:server/features/kopplings/koppling.dart';
import 'package:server/features/words/words.dart';

ContentManager get content => ContentManager();

/// Router for Koppling
class ContentManager {
  factory ContentManager() {
    return _instance;
  }
  ContentManager._privateConstructor();

  static final ContentManager _instance = ContentManager._privateConstructor();
  final List<Koppling> kopplings = [];
  final List<Words> words = [];

  Future<void> init() async {
    // Empty the lists first
    kopplings.clear();
    words.clear();
    // Load the file content from data/kopplings.json
    // and parse it into a list of Koppling objects
    final kopplingsFile = File('data/kopplings.json');
    final kopplingContent = await kopplingsFile.readAsString();
    final dynamic kopplingData = jsonDecode(kopplingContent);
    final wordsFile = File('data/words.json');
    final wordsContent = await wordsFile.readAsString();
    final dynamic wordsData = jsonDecode(wordsContent);
    if (kopplingData is List) {
      for (final item in kopplingData) {
        if (item is Map<String, dynamic>) {
          final koppling = KopplingMapper.fromMap(item);
          kopplings.add(koppling);
        }
      }
    }
    if (wordsData is List) {
      for (final item in wordsData) {
        if (item is Map<String, dynamic>) {
          final w = WordsMapper.fromMap(item);
          words.add(w);
        }
      }
    }
    print('ContentManager initialized');
  }
}
