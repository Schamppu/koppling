import 'package:drift/drift.dart';

class StorageTable extends Table {
  late final key = text()();
  late final data = text()();

  @override
  Set<Column> get primaryKey => {key};
}
