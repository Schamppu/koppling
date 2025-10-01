import 'dart:async';

import 'package:client/features/authentication/classes/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_manager.g.dart';

AuthManager get auth => AuthManager();

class AuthManager {
  AuthManager._privateConstructor();

  static final AuthManager _instance = AuthManager._privateConstructor();
  AuthState state = AuthState();
  StreamController<AuthState> stream = StreamController<AuthState>.broadcast();

  factory AuthManager() {
    return _instance;
  }

  void init(WidgetRef ref) {
    ref.read(authProvider.notifier).init(state);
  }

  void update(AuthState newState) {
    state = newState;
    stream.add(state);
  }
}

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  AuthState build() {
    return AuthState();
  }

  void init(AuthState initialState) {
    state = initialState;
    auth.stream.stream.listen((state) => update(state));
  }

  void update(AuthState newState) {
    state = newState;
  }
}
