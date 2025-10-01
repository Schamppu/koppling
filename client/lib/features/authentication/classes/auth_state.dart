import 'package:dart_mappable/dart_mappable.dart';
part 'auth_state.mapper.dart';

@MappableClass()
class AuthState with AuthStateMappable {
  AuthState({this.authenticated = false, this.username, this.password});

  bool authenticated;
  String? username;
  String? password;
}
