import 'package:drift/drift.dart';

class UsersTable extends Table {
  TextColumn get username => text().withLength(min: 3, max: 50)();
  TextColumn get password => text()();

  @override
  Set<Column> get primaryKey => {username};
}
