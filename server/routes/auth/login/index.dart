import 'package:dart_frog/dart_frog.dart';
import 'package:server/db/database.dart';

Future<Response> onRequest(RequestContext context) async {
  final body = await context.request.json();
  if (body is! Map<String, dynamic>) {
    return Response(statusCode: 400, body: 'Invalid request body');
  }
  final username = body['username'] as String;
  final password = body['password'] as String;
  final user = await managers.usersTable
      .filter((f) => f.username.equals(username))
      .getSingleOrNull();
  if (user == null || user.password != password) {
    return Response(statusCode: 401, body: 'Invalid username or password');
  }
  return Response(body: 'Login successful, welcome ${user.username}!');
}
