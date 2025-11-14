import 'package:dart_frog/dart_frog.dart';
import 'package:secure_password_utility/secure_password_utility.dart';
import 'package:server/db/database.dart';

Future<Response> onRequest(RequestContext context) async {
  final body = await context.request.json();
  if (body is! Map<String, dynamic>) {
    return Response(statusCode: 400, body: 'Invalid request body');
  }
  final username = body['username'] as String;
  final password = body['password'] as String;
  /*
  [A07 - Identification and Authentication Failures]
  Uncomment this to force strong passwords on registration.

  // Check for strong password
  final passwordStrength = checkPasswordStrength(password, 16);
  if (!await passwordStrength) {
    return Response(statusCode: 400, body: 'Password is too weak');
  }
  */
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

Future<bool> checkPasswordStrength(String password, int passwordLength) async {
  var passcodeStrength = false;
  await SecurePasswordGateway()
      .checkWeakPassword(password, passwordLength)
      .then((value) => {passcodeStrength = value});
  return passcodeStrength;
}
