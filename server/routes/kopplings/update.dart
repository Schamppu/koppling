import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:drift/drift.dart';
import 'package:server/db/database.dart';
import 'package:server/features/kopplings/koppling.dart';

Future<Response> onRequest(RequestContext context) async {
  final body = await context.request.json();
  if (body is! Map) {
    return Response(statusCode: 400, body: 'Invalid request body');
  }
  final user = body['user'] as String?;
  dynamic kopplingJson = body['koppling'];
  if (kopplingJson is String) {
    kopplingJson = jsonDecode(kopplingJson);
  }
  late Koppling koppling;
  try {
    koppling = KopplingMapper.fromMap(kopplingJson as Map<String, dynamic>);
  } catch (e, s) {
    print('Koppling: $kopplingJson');
    print('Error parsing koppling JSON: $e\n$s');
    return Response(
      statusCode: 400,
      body: 'Invalid koppling data',
    );
  }
  if (user == null) {
    return Response(statusCode: 400, body: 'Missing user or koppling');
  }
  // Check if a relation exists
  final relation = await managers.userKopplingsTable
      .filter((f) => f.user.username.equals(user))
      .filter((f) => f.koppling.id.equals(koppling.id))
      .getSingleOrNull();
  if (relation == null) {
    await db.into(db.kopplingsTable).insert(
          KopplingsTableCompanion(
            id: Value(koppling.id),
            misses: Value(koppling.misses),
            completed: Value(koppling.completed),
            solved: Value(koppling.solved),
            json: Value(koppling.toJson()),
            correctGroups: Value(koppling.correctGroups.join(',')),
          ),
        );
    await db.into(db.userKopplingsTable).insert(
          UserKopplingsTableCompanion(
            user: Value(
              user,
            ),
            koppling: Value(
              koppling.id,
            ),
          ),
        );
    print('Created Koppling for user $user');
    return Response(body: 'Created Koppling for user $user');
  }
  await db.update(db.kopplingsTable).replace(
        KopplingsTableCompanion(
          id: Value(koppling.id),
          misses: Value(koppling.misses),
          completed: Value(koppling.completed),
          solved: Value(koppling.solved),
          json: Value(koppling.toJson()),
          correctGroups: Value(koppling.correctGroups.join(',')),
        ),
      );
  print('Updated Koppling for user $user');
  return Response(body: 'Updated Koppling for user $user');
}
