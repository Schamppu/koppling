import 'package:client/features/koppling/classes/game_koppling.dart';
import 'package:client/features/koppling/manager/koppling_manager.dart';
import 'package:client/features/navigation/router/router.dart';

Future<void> selectKoppling({required GameKoppling gameKoppling}) async {
  final words = gameKoppling.words.expand((w) => w.words).toList();
  words.shuffle();
  koppling.update(
    koppling.state.copyWith(
      words: words,
      misses: 0,
      selectedWords: [],
      completedWords: [],
    ),
  );
  router.push('/koppling', extra: gameKoppling);
}
