import 'dart:async';

import 'package:client/db/storage_manager.dart';
import 'package:client/features/authentication/classes/auth_state.dart';
import 'package:client/features/navigation/router/router.dart';
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

  Future<void> init(WidgetRef ref) async {
    ref.read(authProvider.notifier).init(state);
    try {
      final savedState = await storage.load(
        key: 'authState',
        fromJson: (json) => AuthStateMapper.fromJson(json),
      );
      print(savedState.username);
      update(savedState);
      if (savedState.authenticated) {
        router.replace('/selection');
      }
    } catch (e) {
      print('No saved auth state found: $e');
      update(
        state.copyWith(
          initialized: true,
          authenticated: false,
          username: null,
          password: null,
        ),
      );
    }
  }

  void update(AuthState newState) {
    state = newState;
    stream.add(state);
    storage.save(key: 'authState', data: newState);
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
