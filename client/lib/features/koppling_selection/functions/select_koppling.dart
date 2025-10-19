import 'package:client/features/koppling/classes/game_koppling.dart';
import 'package:client/features/koppling/manager/koppling_manager.dart';
import 'package:client/features/navigation/router/router.dart';
import 'package:client/features/words/classes/words.dart';

Future<void> selectKoppling({required GameKoppling gameKoppling}) async {
  final words = gameKoppling.words.expand((w) => w.words).toList();
  words.shuffle();
  // Map the completed ones
  final completedWords = gameKoppling.words
      .where((w) => gameKoppling.correctGroups.contains(w.id))
      .toList();
  // Put the completed ones at the start of the list
  final List<Word> wordList = [];
  for (final group in completedWords) {
    wordList.addAll(group.words);
    for (final word in group.words) {
      words.removeWhere((w) => w.word == word.word);
    }
  }
  wordList.addAll(words);
  koppling.update(
    koppling.state.copyWith(
      gameKoppling: gameKoppling,
      words: wordList,
      misses: gameKoppling.misses,
      selectedWords: [],
      completedWords: completedWords,
      id: koppling.state.id + 1,
    ),
  );
  router.push('/koppling', extra: gameKoppling);
}
