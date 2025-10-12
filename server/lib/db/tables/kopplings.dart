import 'package:drift/drift.dart';

class KopplingsTable extends Table {
  IntColumn get id => integer()();
  IntColumn get misses => integer()();
  BoolColumn get completed => boolean()();
  BoolColumn get solved => boolean()();
  TextColumn get json => text()();
  TextColumn get correctGroups => text()();

  @override
  Set<Column> get primaryKey => {id};
}
