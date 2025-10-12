import 'dart:async';
import 'package:client/features/koppling/classes/koppling_state.dart';
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

  void init(WidgetRef ref) {
    ref.read(kopplingProvider.notifier).init(state);
  }

  void update(KopplingState newState) {
    state = newState;
    stream.add(state);
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
