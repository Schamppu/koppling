import 'package:dart_frog/dart_frog.dart';
import 'package:server/db/database.dart';

Future<Response> onRequest(RequestContext context) async {
  final body = await context.request.json();
  if (body is! Map<String, dynamic>) {
    return Response(statusCode: 400, body: 'Invalid request body');
  }
  final username = body['username'] as String;
  final password = body['password'] as String;
  // Check if the user already exists
  final exists = await managers.usersTable
      .filter((f) => f.username.equals(username))
      .getSingleOrNull();
  if (exists != null) {
    return Response(statusCode: 409, body: 'User already exists');
  }
  await db.into(db.usersTable).insert(
        UsersTableCompanion.insert(
          username: username,
          password: password,
        ),
      );
  return Response(body: 'You signed up, yay');
}
