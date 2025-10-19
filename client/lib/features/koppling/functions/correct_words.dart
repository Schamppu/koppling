import 'package:client/features/koppling/manager/koppling_manager.dart';
import 'package:client/features/words/classes/words.dart';

Future<void> correctWords({required Words words}) async {
  /// The words were correct - reorganize the words so that they move to the top and get locked
  final correctWords = List<Words>.from(koppling.state.completedWords);
  final wordList = List<Word>.from(koppling.state.words);
  int index = correctWords.length * 4;
  for (final word in words.words) {
    wordList.removeWhere((w) => w.word == word.word);
    wordList.insert(index, word);
  }
  correctWords.add(words);
  koppling.update(
    koppling.state.copyWith(
      words: wordList,
      completedWords: correctWords,
      selectedWords: [],
    ),
  );
}
