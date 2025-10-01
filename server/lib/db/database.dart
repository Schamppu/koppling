import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:server/db/tables/users.dart';

part 'database.g.dart';

late Database db;
$DatabaseManager get managers => db.managers;

class DatabaseManager {
  factory DatabaseManager() {
    return _instance;
  }

  DatabaseManager._privateConstructor();

  static final DatabaseManager _instance =
      DatabaseManager._privateConstructor();

  Future<void> init() async {
    print('Initializing database...');
    db = constructDb();
    print('Database initialized.');
  }
}

@DriftDatabase(tables: [UsersTable])
class Database extends _$Database {
  Database(super.e);

  @override
  int get schemaVersion => 1;

  static QueryExecutor openConnection() {
    return constructDb().executor;
  }
}

Database constructDb() {
  final db = LazyDatabase(() async {
    return NativeDatabase.createInBackground(File('db'));
  });
  return Database(db);
}
