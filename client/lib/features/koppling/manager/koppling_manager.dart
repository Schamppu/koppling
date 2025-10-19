import 'dart:async';
import 'package:client/features/koppling/classes/koppling_state.dart';
import 'package:client/features/koppling/classes/koppling.dart' as k;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'koppling_manager.g.dart';

KopplingManager get koppling => KopplingManager();

class KopplingManager {
  KopplingManager._privateConstructor();

  static final KopplingManager _instance =
      KopplingManager._privateConstructor();
  KopplingState state = KopplingState(
    words: [],
    selectedWords: [],
    completedWords: [],
    misses: 0,
  );
  StreamController<KopplingState> stream =
      StreamController<KopplingState>.broadcast();

  factory KopplingManager() {
    return _instance;
  }

  Future<void> init(WidgetRef ref) async {
    ref.read(kopplingProvider.notifier).init(state);
  }

  void update(KopplingState newState) {
    state = newState;
    stream.add(state);
  }

  k.Koppling get toKoppling {
    print('Words IDs: ${state.gameKoppling!.words.map((e) => e.id).toList()}');
    print(
      'Completed Words IDs: ${state.completedWords.map((e) => e.id).toList()}',
    );
    return k.Koppling(
      id: state.gameKoppling!.id,
      words: state.completedWords.map((words) => words.id).toList(),
      createdAt: state.gameKoppling!.createdAt,
      misses: state.misses,
      completed: state.gameKoppling!.completed,
      solved: state.gameKoppling!.solved,
      correctGroups: state.completedWords.map((words) => words.id).toList(),
    );
  }
}

@Riverpod(keepAlive: true)
class Koppling extends _$Koppling {
  @override
  KopplingState build() {
    return KopplingManager().state;
  }

  void init(KopplingState initialState) {
    state = initialState;
    koppling.stream.stream.listen((state) => update(state));
  }

  void update(KopplingState newState) {
    state = newState;
  }
}
