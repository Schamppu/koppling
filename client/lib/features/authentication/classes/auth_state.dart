import 'package:dart_mappable/dart_mappable.dart';
part 'auth_state.mapper.dart';

@MappableClass()
class AuthState with AuthStateMappable {
  AuthState({
    this.authenticated = false,
    this.username,
    this.password,
    this.initialized = false,
  });

  bool authenticated;
  String? username;
  String? password;
  bool initialized;
}
