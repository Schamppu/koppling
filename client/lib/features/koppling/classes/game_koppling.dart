import 'package:client/features/words/classes/words.dart';
import 'package:dart_mappable/dart_mappable.dart';
part 'game_koppling.mapper.dart';

@MappableClass()
class GameKoppling with GameKopplingMappable {
  GameKoppling({
    required this.id,
    required this.words,
    required this.createdAt,
  });

  final int id;
  final List<Words> words;
  final DateTime createdAt;
}
