// ignore_for_file: lines_longer_than_80_chars

import 'package:dart_frog/dart_frog.dart';
// import 'package:drift/drift.dart';
import 'package:server/db/database.dart';

import '../../_middleware.dart';

Future<Response> onRequest(RequestContext context) async {
  final body = await decryptedJson(context);
  if (body is! Map<String, dynamic>) {
    return Response(statusCode: 400, body: 'Invalid request body');
  }
  final username = body['username'] as String;
  final password = body['password'] as String;
  final query = await db
      .customSelect(
        "SELECT * FROM users_table WHERE username = '$username' AND password = '$password'",
      )
      .getSingleOrNull();
  final user = query != null
      ? UsersTableData(
          username: query.data['username'] as String,
          password: query.data['password'] as String,
        )
      : null;
  /*
  [A03 - Injection]
  Using this instead of the above raw query would prevent SQL injection:

  final user = await managers.usersTable
      .filter((f) => f.username.equals(username))
      .getSingleOrNull();
      */
  // The password check should be done here after hashing the provided password. Commented out so the injection can be tested.
  if (user == null /*|| user.password != password*/) {
    return Response(statusCode: 401, body: 'Invalid username or password');
  }
  return Response(body: 'Login successful, welcome ${user.username}!');
}
