import 'dart:io';

import 'package:client/db/storage.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

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
    db = constructDb();
  }
}

@DriftDatabase(tables: [StorageTable])
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
