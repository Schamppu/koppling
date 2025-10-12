import 'package:drift/drift.dart';
import 'package:server/db/tables/kopplings.dart';
import 'package:server/db/tables/users.dart';

class UserKopplingsTable extends Table {
  late final user = text().references(UsersTable, #username)();
  late final koppling = integer().references(KopplingsTable, #id)();

  @override
  Set<Column> get primaryKey => {user, koppling};
}
