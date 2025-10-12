import 'package:client/features/koppling/classes/game_koppling.dart';
import 'package:client/features/words/classes/words.dart';
import 'package:dart_mappable/dart_mappable.dart';
part 'koppling_state.mapper.dart';

@MappableClass()
class KopplingState with KopplingStateMappable {
  KopplingState({
    this.gameKoppling,
    required this.words,
    required this.selectedWords,
    required this.completedWords,
    required this.misses,
  });
  GameKoppling? gameKoppling;
  List<Word> words;
  List<Word> selectedWords;
  List<Words> completedWords;
  int misses;
}
