import 'dart:async';
import 'dart:convert';

import 'package:client/db/database.dart';
import 'package:client/features/authentication/classes/auth_state.dart';
import 'package:drift/drift.dart';
//part 'storage_manager.g.dart';

StorageManager get storage => StorageManager();

class StorageManager {
  StorageManager._privateConstructor();

  static final StorageManager _instance = StorageManager._privateConstructor();
  AuthState state = AuthState();
  StreamController<AuthState> stream = StreamController<AuthState>.broadcast();

  factory StorageManager() {
    return _instance;
  }

  Future<void> init() async {
    await DatabaseManager().init();
  }

  Future<void> save({required String key, required dynamic data}) async {
    final dbInstance = db;
    late String map;
    try {
      map = jsonEncode(data);
    } catch (e) {
      try {
        map = data.toJson();
      } catch (e) {
        throw Exception('Data cannot be serialized: $e');
      }
    }
    await dbInstance
        .into(dbInstance.storageTable)
        .insertOnConflictUpdate(
          StorageTableCompanion(key: Value(key), data: Value(map)),
        );
  }

  Future<T> load<T>({
    required String key,
    required T Function(String) fromJson,
  }) async {
    final dbInstance = db;
    final query = await (dbInstance.select(
      dbInstance.storageTable,
    )..where((tbl) => tbl.key.equals(key))).getSingleOrNull();
    final data = query?.data;
    return data != null
        ? fromJson(jsonDecode(data))
        : throw Exception('No data found for key: $key');
  }

  void update(AuthState newState) {
    state = newState;
    stream.add(state);
  }
}
