// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTableTable extends UsersTable
    with TableInfo<$UsersTableTable, UsersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [username, password];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users_table';
  @override
  VerificationContext validateIntegrity(Insertable<UsersTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {username};
  @override
  UsersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsersTableData(
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
    );
  }

  @override
  $UsersTableTable createAlias(String alias) {
    return $UsersTableTable(attachedDatabase, alias);
  }
}

class UsersTableData extends DataClass implements Insertable<UsersTableData> {
  final String username;
  final String password;
  const UsersTableData({required this.username, required this.password});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    return map;
  }

  UsersTableCompanion toCompanion(bool nullToAbsent) {
    return UsersTableCompanion(
      username: Value(username),
      password: Value(password),
    );
  }

  factory UsersTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UsersTableData(
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
    };
  }

  UsersTableData copyWith({String? username, String? password}) =>
      UsersTableData(
        username: username ?? this.username,
        password: password ?? this.password,
      );
  UsersTableData copyWithCompanion(UsersTableCompanion data) {
    return UsersTableData(
      username: data.username.present ? data.username.value : this.username,
      password: data.password.present ? data.password.value : this.password,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UsersTableData(')
          ..write('username: $username, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(username, password);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsersTableData &&
          other.username == this.username &&
          other.password == this.password);
}

class UsersTableCompanion extends UpdateCompanion<UsersTableData> {
  final Value<String> username;
  final Value<String> password;
  final Value<int> rowid;
  const UsersTableCompanion({
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersTableCompanion.insert({
    required String username,
    required String password,
    this.rowid = const Value.absent(),
  })  : username = Value(username),
        password = Value(password);
  static Insertable<UsersTableData> custom({
    Expression<String>? username,
    Expression<String>? password,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersTableCompanion copyWith(
      {Value<String>? username, Value<String>? password, Value<int>? rowid}) {
    return UsersTableCompanion(
      username: username ?? this.username,
      password: password ?? this.password,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersTableCompanion(')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $KopplingsTableTable extends KopplingsTable
    with TableInfo<$KopplingsTableTable, KopplingsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KopplingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _missesMeta = const VerificationMeta('misses');
  @override
  late final GeneratedColumn<int> misses = GeneratedColumn<int>(
      'misses', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _completedMeta =
      const VerificationMeta('completed');
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
      'completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("completed" IN (0, 1))'));
  static const VerificationMeta _solvedMeta = const VerificationMeta('solved');
  @override
  late final GeneratedColumn<bool> solved = GeneratedColumn<bool>(
      'solved', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("solved" IN (0, 1))'));
  static const VerificationMeta _jsonMeta = const VerificationMeta('json');
  @override
  late final GeneratedColumn<String> json = GeneratedColumn<String>(
      'json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _correctGroupsMeta =
      const VerificationMeta('correctGroups');
  @override
  late final GeneratedColumn<String> correctGroups = GeneratedColumn<String>(
      'correct_groups', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, misses, completed, solved, json, correctGroups];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'kopplings_table';
  @override
  VerificationContext validateIntegrity(Insertable<KopplingsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('misses')) {
      context.handle(_missesMeta,
          misses.isAcceptableOrUnknown(data['misses']!, _missesMeta));
    } else if (isInserting) {
      context.missing(_missesMeta);
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed']!, _completedMeta));
    } else if (isInserting) {
      context.missing(_completedMeta);
    }
    if (data.containsKey('solved')) {
      context.handle(_solvedMeta,
          solved.isAcceptableOrUnknown(data['solved']!, _solvedMeta));
    } else if (isInserting) {
      context.missing(_solvedMeta);
    }
    if (data.containsKey('json')) {
      context.handle(
          _jsonMeta, json.isAcceptableOrUnknown(data['json']!, _jsonMeta));
    } else if (isInserting) {
      context.missing(_jsonMeta);
    }
    if (data.containsKey('correct_groups')) {
      context.handle(
          _correctGroupsMeta,
          correctGroups.isAcceptableOrUnknown(
              data['correct_groups']!, _correctGroupsMeta));
    } else if (isInserting) {
      context.missing(_correctGroupsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  KopplingsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KopplingsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      misses: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}misses'])!,
      completed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}completed'])!,
      solved: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}solved'])!,
      json: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}json'])!,
      correctGroups: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}correct_groups'])!,
    );
  }

  @override
  $KopplingsTableTable createAlias(String alias) {
    return $KopplingsTableTable(attachedDatabase, alias);
  }
}

class KopplingsTableData extends DataClass
    implements Insertable<KopplingsTableData> {
  final int id;
  final int misses;
  final bool completed;
  final bool solved;
  final String json;
  final String correctGroups;
  const KopplingsTableData(
      {required this.id,
      required this.misses,
      required this.completed,
      required this.solved,
      required this.json,
      required this.correctGroups});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['misses'] = Variable<int>(misses);
    map['completed'] = Variable<bool>(completed);
    map['solved'] = Variable<bool>(solved);
    map['json'] = Variable<String>(json);
    map['correct_groups'] = Variable<String>(correctGroups);
    return map;
  }

  KopplingsTableCompanion toCompanion(bool nullToAbsent) {
    return KopplingsTableCompanion(
      id: Value(id),
      misses: Value(misses),
      completed: Value(completed),
      solved: Value(solved),
      json: Value(json),
      correctGroups: Value(correctGroups),
    );
  }

  factory KopplingsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KopplingsTableData(
      id: serializer.fromJson<int>(json['id']),
      misses: serializer.fromJson<int>(json['misses']),
      completed: serializer.fromJson<bool>(json['completed']),
      solved: serializer.fromJson<bool>(json['solved']),
      json: serializer.fromJson<String>(json['json']),
      correctGroups: serializer.fromJson<String>(json['correctGroups']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'misses': serializer.toJson<int>(misses),
      'completed': serializer.toJson<bool>(completed),
      'solved': serializer.toJson<bool>(solved),
      'json': serializer.toJson<String>(json),
      'correctGroups': serializer.toJson<String>(correctGroups),
    };
  }

  KopplingsTableData copyWith(
          {int? id,
          int? misses,
          bool? completed,
          bool? solved,
          String? json,
          String? correctGroups}) =>
      KopplingsTableData(
        id: id ?? this.id,
        misses: misses ?? this.misses,
        completed: completed ?? this.completed,
        solved: solved ?? this.solved,
        json: json ?? this.json,
        correctGroups: correctGroups ?? this.correctGroups,
      );
  KopplingsTableData copyWithCompanion(KopplingsTableCompanion data) {
    return KopplingsTableData(
      id: data.id.present ? data.id.value : this.id,
      misses: data.misses.present ? data.misses.value : this.misses,
      completed: data.completed.present ? data.completed.value : this.completed,
      solved: data.solved.present ? data.solved.value : this.solved,
      json: data.json.present ? data.json.value : this.json,
      correctGroups: data.correctGroups.present
          ? data.correctGroups.value
          : this.correctGroups,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KopplingsTableData(')
          ..write('id: $id, ')
          ..write('misses: $misses, ')
          ..write('completed: $completed, ')
          ..write('solved: $solved, ')
          ..write('json: $json, ')
          ..write('correctGroups: $correctGroups')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, misses, completed, solved, json, correctGroups);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KopplingsTableData &&
          other.id == this.id &&
          other.misses == this.misses &&
          other.completed == this.completed &&
          other.solved == this.solved &&
          other.json == this.json &&
          other.correctGroups == this.correctGroups);
}

class KopplingsTableCompanion extends UpdateCompanion<KopplingsTableData> {
  final Value<int> id;
  final Value<int> misses;
  final Value<bool> completed;
  final Value<bool> solved;
  final Value<String> json;
  final Value<String> correctGroups;
  const KopplingsTableCompanion({
    this.id = const Value.absent(),
    this.misses = const Value.absent(),
    this.completed = const Value.absent(),
    this.solved = const Value.absent(),
    this.json = const Value.absent(),
    this.correctGroups = const Value.absent(),
  });
  KopplingsTableCompanion.insert({
    this.id = const Value.absent(),
    required int misses,
    required bool completed,
    required bool solved,
    required String json,
    required String correctGroups,
  })  : misses = Value(misses),
        completed = Value(completed),
        solved = Value(solved),
        json = Value(json),
        correctGroups = Value(correctGroups);
  static Insertable<KopplingsTableData> custom({
    Expression<int>? id,
    Expression<int>? misses,
    Expression<bool>? completed,
    Expression<bool>? solved,
    Expression<String>? json,
    Expression<String>? correctGroups,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (misses != null) 'misses': misses,
      if (completed != null) 'completed': completed,
      if (solved != null) 'solved': solved,
      if (json != null) 'json': json,
      if (correctGroups != null) 'correct_groups': correctGroups,
    });
  }

  KopplingsTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? misses,
      Value<bool>? completed,
      Value<bool>? solved,
      Value<String>? json,
      Value<String>? correctGroups}) {
    return KopplingsTableCompanion(
      id: id ?? this.id,
      misses: misses ?? this.misses,
      completed: completed ?? this.completed,
      solved: solved ?? this.solved,
      json: json ?? this.json,
      correctGroups: correctGroups ?? this.correctGroups,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (misses.present) {
      map['misses'] = Variable<int>(misses.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (solved.present) {
      map['solved'] = Variable<bool>(solved.value);
    }
    if (json.present) {
      map['json'] = Variable<String>(json.value);
    }
    if (correctGroups.present) {
      map['correct_groups'] = Variable<String>(correctGroups.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KopplingsTableCompanion(')
          ..write('id: $id, ')
          ..write('misses: $misses, ')
          ..write('completed: $completed, ')
          ..write('solved: $solved, ')
          ..write('json: $json, ')
          ..write('correctGroups: $correctGroups')
          ..write(')'))
        .toString();
  }
}

class $UserKopplingsTableTable extends UserKopplingsTable
    with TableInfo<$UserKopplingsTableTable, UserKopplingsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserKopplingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userMeta = const VerificationMeta('user');
  @override
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
      'user', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES users_table (username)'));
  static const VerificationMeta _kopplingMeta =
      const VerificationMeta('koppling');
  @override
  late final GeneratedColumn<int> koppling = GeneratedColumn<int>(
      'koppling', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES kopplings_table (id)'));
  @override
  List<GeneratedColumn> get $columns => [user, koppling];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_kopplings_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<UserKopplingsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user')) {
      context.handle(
          _userMeta, user.isAcceptableOrUnknown(data['user']!, _userMeta));
    } else if (isInserting) {
      context.missing(_userMeta);
    }
    if (data.containsKey('koppling')) {
      context.handle(_kopplingMeta,
          koppling.isAcceptableOrUnknown(data['koppling']!, _kopplingMeta));
    } else if (isInserting) {
      context.missing(_kopplingMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {user, koppling};
  @override
  UserKopplingsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserKopplingsTableData(
      user: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user'])!,
      koppling: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}koppling'])!,
    );
  }

  @override
  $UserKopplingsTableTable createAlias(String alias) {
    return $UserKopplingsTableTable(attachedDatabase, alias);
  }
}

class UserKopplingsTableData extends DataClass
    implements Insertable<UserKopplingsTableData> {
  final String user;
  final int koppling;
  const UserKopplingsTableData({required this.user, required this.koppling});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user'] = Variable<String>(user);
    map['koppling'] = Variable<int>(koppling);
    return map;
  }

  UserKopplingsTableCompanion toCompanion(bool nullToAbsent) {
    return UserKopplingsTableCompanion(
      user: Value(user),
      koppling: Value(koppling),
    );
  }

  factory UserKopplingsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserKopplingsTableData(
      user: serializer.fromJson<String>(json['user']),
      koppling: serializer.fromJson<int>(json['koppling']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'user': serializer.toJson<String>(user),
      'koppling': serializer.toJson<int>(koppling),
    };
  }

  UserKopplingsTableData copyWith({String? user, int? koppling}) =>
      UserKopplingsTableData(
        user: user ?? this.user,
        koppling: koppling ?? this.koppling,
      );
  UserKopplingsTableData copyWithCompanion(UserKopplingsTableCompanion data) {
    return UserKopplingsTableData(
      user: data.user.present ? data.user.value : this.user,
      koppling: data.koppling.present ? data.koppling.value : this.koppling,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserKopplingsTableData(')
          ..write('user: $user, ')
          ..write('koppling: $koppling')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(user, koppling);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserKopplingsTableData &&
          other.user == this.user &&
          other.koppling == this.koppling);
}

class UserKopplingsTableCompanion
    extends UpdateCompanion<UserKopplingsTableData> {
  final Value<String> user;
  final Value<int> koppling;
  final Value<int> rowid;
  const UserKopplingsTableCompanion({
    this.user = const Value.absent(),
    this.koppling = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserKopplingsTableCompanion.insert({
    required String user,
    required int koppling,
    this.rowid = const Value.absent(),
  })  : user = Value(user),
        koppling = Value(koppling);
  static Insertable<UserKopplingsTableData> custom({
    Expression<String>? user,
    Expression<int>? koppling,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (user != null) 'user': user,
      if (koppling != null) 'koppling': koppling,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserKopplingsTableCompanion copyWith(
      {Value<String>? user, Value<int>? koppling, Value<int>? rowid}) {
    return UserKopplingsTableCompanion(
      user: user ?? this.user,
      koppling: koppling ?? this.koppling,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (user.present) {
      map['user'] = Variable<String>(user.value);
    }
    if (koppling.present) {
      map['koppling'] = Variable<int>(koppling.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserKopplingsTableCompanion(')
          ..write('user: $user, ')
          ..write('koppling: $koppling, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $UsersTableTable usersTable = $UsersTableTable(this);
  late final $KopplingsTableTable kopplingsTable = $KopplingsTableTable(this);
  late final $UserKopplingsTableTable userKopplingsTable =
      $UserKopplingsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [usersTable, kopplingsTable, userKopplingsTable];
}

typedef $$UsersTableTableCreateCompanionBuilder = UsersTableCompanion Function({
  required String username,
  required String password,
  Value<int> rowid,
});
typedef $$UsersTableTableUpdateCompanionBuilder = UsersTableCompanion Function({
  Value<String> username,
  Value<String> password,
  Value<int> rowid,
});

final class $$UsersTableTableReferences
    extends BaseReferences<_$Database, $UsersTableTable, UsersTableData> {
  $$UsersTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UserKopplingsTableTable,
      List<UserKopplingsTableData>> _userKopplingsTableRefsTable(
          _$Database db) =>
      MultiTypedResultKey.fromTable(db.userKopplingsTable,
          aliasName: $_aliasNameGenerator(
              db.usersTable.username, db.userKopplingsTable.user));

  $$UserKopplingsTableTableProcessedTableManager get userKopplingsTableRefs {
    final manager =
        $$UserKopplingsTableTableTableManager($_db, $_db.userKopplingsTable)
            .filter((f) =>
                f.user.username.sqlEquals($_itemColumn<String>('username')!));

    final cache =
        $_typedResult.readTableOrNull(_userKopplingsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$UsersTableTableFilterComposer
    extends Composer<_$Database, $UsersTableTable> {
  $$UsersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnFilters(column));

  Expression<bool> userKopplingsTableRefs(
      Expression<bool> Function($$UserKopplingsTableTableFilterComposer f) f) {
    final $$UserKopplingsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.username,
        referencedTable: $db.userKopplingsTable,
        getReferencedColumn: (t) => t.user,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserKopplingsTableTableFilterComposer(
              $db: $db,
              $table: $db.userKopplingsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UsersTableTableOrderingComposer
    extends Composer<_$Database, $UsersTableTable> {
  $$UsersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableTableAnnotationComposer
    extends Composer<_$Database, $UsersTableTable> {
  $$UsersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  Expression<T> userKopplingsTableRefs<T extends Object>(
      Expression<T> Function($$UserKopplingsTableTableAnnotationComposer a) f) {
    final $$UserKopplingsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.username,
            referencedTable: $db.userKopplingsTable,
            getReferencedColumn: (t) => t.user,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$UserKopplingsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.userKopplingsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$UsersTableTableTableManager extends RootTableManager<
    _$Database,
    $UsersTableTable,
    UsersTableData,
    $$UsersTableTableFilterComposer,
    $$UsersTableTableOrderingComposer,
    $$UsersTableTableAnnotationComposer,
    $$UsersTableTableCreateCompanionBuilder,
    $$UsersTableTableUpdateCompanionBuilder,
    (UsersTableData, $$UsersTableTableReferences),
    UsersTableData,
    PrefetchHooks Function({bool userKopplingsTableRefs})> {
  $$UsersTableTableTableManager(_$Database db, $UsersTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> username = const Value.absent(),
            Value<String> password = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersTableCompanion(
            username: username,
            password: password,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String username,
            required String password,
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersTableCompanion.insert(
            username: username,
            password: password,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$UsersTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({userKopplingsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (userKopplingsTableRefs) db.userKopplingsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (userKopplingsTableRefs)
                    await $_getPrefetchedData<UsersTableData, $UsersTableTable,
                            UserKopplingsTableData>(
                        currentTable: table,
                        referencedTable: $$UsersTableTableReferences
                            ._userKopplingsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableTableReferences(db, table, p0)
                                .userKopplingsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.user == item.username),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$UsersTableTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $UsersTableTable,
    UsersTableData,
    $$UsersTableTableFilterComposer,
    $$UsersTableTableOrderingComposer,
    $$UsersTableTableAnnotationComposer,
    $$UsersTableTableCreateCompanionBuilder,
    $$UsersTableTableUpdateCompanionBuilder,
    (UsersTableData, $$UsersTableTableReferences),
    UsersTableData,
    PrefetchHooks Function({bool userKopplingsTableRefs})>;
typedef $$KopplingsTableTableCreateCompanionBuilder = KopplingsTableCompanion
    Function({
  Value<int> id,
  required int misses,
  required bool completed,
  required bool solved,
  required String json,
  required String correctGroups,
});
typedef $$KopplingsTableTableUpdateCompanionBuilder = KopplingsTableCompanion
    Function({
  Value<int> id,
  Value<int> misses,
  Value<bool> completed,
  Value<bool> solved,
  Value<String> json,
  Value<String> correctGroups,
});

final class $$KopplingsTableTableReferences extends BaseReferences<_$Database,
    $KopplingsTableTable, KopplingsTableData> {
  $$KopplingsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UserKopplingsTableTable,
      List<UserKopplingsTableData>> _userKopplingsTableRefsTable(
          _$Database db) =>
      MultiTypedResultKey.fromTable(db.userKopplingsTable,
          aliasName: $_aliasNameGenerator(
              db.kopplingsTable.id, db.userKopplingsTable.koppling));

  $$UserKopplingsTableTableProcessedTableManager get userKopplingsTableRefs {
    final manager =
        $$UserKopplingsTableTableTableManager($_db, $_db.userKopplingsTable)
            .filter((f) => f.koppling.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_userKopplingsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$KopplingsTableTableFilterComposer
    extends Composer<_$Database, $KopplingsTableTable> {
  $$KopplingsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get misses => $composableBuilder(
      column: $table.misses, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get completed => $composableBuilder(
      column: $table.completed, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get solved => $composableBuilder(
      column: $table.solved, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get json => $composableBuilder(
      column: $table.json, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get correctGroups => $composableBuilder(
      column: $table.correctGroups, builder: (column) => ColumnFilters(column));

  Expression<bool> userKopplingsTableRefs(
      Expression<bool> Function($$UserKopplingsTableTableFilterComposer f) f) {
    final $$UserKopplingsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.userKopplingsTable,
        getReferencedColumn: (t) => t.koppling,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserKopplingsTableTableFilterComposer(
              $db: $db,
              $table: $db.userKopplingsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$KopplingsTableTableOrderingComposer
    extends Composer<_$Database, $KopplingsTableTable> {
  $$KopplingsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get misses => $composableBuilder(
      column: $table.misses, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get completed => $composableBuilder(
      column: $table.completed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get solved => $composableBuilder(
      column: $table.solved, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get json => $composableBuilder(
      column: $table.json, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get correctGroups => $composableBuilder(
      column: $table.correctGroups,
      builder: (column) => ColumnOrderings(column));
}

class $$KopplingsTableTableAnnotationComposer
    extends Composer<_$Database, $KopplingsTableTable> {
  $$KopplingsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get misses =>
      $composableBuilder(column: $table.misses, builder: (column) => column);

  GeneratedColumn<bool> get completed =>
      $composableBuilder(column: $table.completed, builder: (column) => column);

  GeneratedColumn<bool> get solved =>
      $composableBuilder(column: $table.solved, builder: (column) => column);

  GeneratedColumn<String> get json =>
      $composableBuilder(column: $table.json, builder: (column) => column);

  GeneratedColumn<String> get correctGroups => $composableBuilder(
      column: $table.correctGroups, builder: (column) => column);

  Expression<T> userKopplingsTableRefs<T extends Object>(
      Expression<T> Function($$UserKopplingsTableTableAnnotationComposer a) f) {
    final $$UserKopplingsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.userKopplingsTable,
            getReferencedColumn: (t) => t.koppling,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$UserKopplingsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.userKopplingsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$KopplingsTableTableTableManager extends RootTableManager<
    _$Database,
    $KopplingsTableTable,
    KopplingsTableData,
    $$KopplingsTableTableFilterComposer,
    $$KopplingsTableTableOrderingComposer,
    $$KopplingsTableTableAnnotationComposer,
    $$KopplingsTableTableCreateCompanionBuilder,
    $$KopplingsTableTableUpdateCompanionBuilder,
    (KopplingsTableData, $$KopplingsTableTableReferences),
    KopplingsTableData,
    PrefetchHooks Function({bool userKopplingsTableRefs})> {
  $$KopplingsTableTableTableManager(_$Database db, $KopplingsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KopplingsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KopplingsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KopplingsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> misses = const Value.absent(),
            Value<bool> completed = const Value.absent(),
            Value<bool> solved = const Value.absent(),
            Value<String> json = const Value.absent(),
            Value<String> correctGroups = const Value.absent(),
          }) =>
              KopplingsTableCompanion(
            id: id,
            misses: misses,
            completed: completed,
            solved: solved,
            json: json,
            correctGroups: correctGroups,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int misses,
            required bool completed,
            required bool solved,
            required String json,
            required String correctGroups,
          }) =>
              KopplingsTableCompanion.insert(
            id: id,
            misses: misses,
            completed: completed,
            solved: solved,
            json: json,
            correctGroups: correctGroups,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$KopplingsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({userKopplingsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (userKopplingsTableRefs) db.userKopplingsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (userKopplingsTableRefs)
                    await $_getPrefetchedData<KopplingsTableData,
                            $KopplingsTableTable, UserKopplingsTableData>(
                        currentTable: table,
                        referencedTable: $$KopplingsTableTableReferences
                            ._userKopplingsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$KopplingsTableTableReferences(db, table, p0)
                                .userKopplingsTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.koppling == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$KopplingsTableTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $KopplingsTableTable,
    KopplingsTableData,
    $$KopplingsTableTableFilterComposer,
    $$KopplingsTableTableOrderingComposer,
    $$KopplingsTableTableAnnotationComposer,
    $$KopplingsTableTableCreateCompanionBuilder,
    $$KopplingsTableTableUpdateCompanionBuilder,
    (KopplingsTableData, $$KopplingsTableTableReferences),
    KopplingsTableData,
    PrefetchHooks Function({bool userKopplingsTableRefs})>;
typedef $$UserKopplingsTableTableCreateCompanionBuilder
    = UserKopplingsTableCompanion Function({
  required String user,
  required int koppling,
  Value<int> rowid,
});
typedef $$UserKopplingsTableTableUpdateCompanionBuilder
    = UserKopplingsTableCompanion Function({
  Value<String> user,
  Value<int> koppling,
  Value<int> rowid,
});

final class $$UserKopplingsTableTableReferences extends BaseReferences<
    _$Database, $UserKopplingsTableTable, UserKopplingsTableData> {
  $$UserKopplingsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $UsersTableTable _userTable(_$Database db) =>
      db.usersTable.createAlias($_aliasNameGenerator(
          db.userKopplingsTable.user, db.usersTable.username));

  $$UsersTableTableProcessedTableManager get user {
    final $_column = $_itemColumn<String>('user')!;

    final manager = $$UsersTableTableTableManager($_db, $_db.usersTable)
        .filter((f) => f.username.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $KopplingsTableTable _kopplingTable(_$Database db) =>
      db.kopplingsTable.createAlias($_aliasNameGenerator(
          db.userKopplingsTable.koppling, db.kopplingsTable.id));

  $$KopplingsTableTableProcessedTableManager get koppling {
    final $_column = $_itemColumn<int>('koppling')!;

    final manager = $$KopplingsTableTableTableManager($_db, $_db.kopplingsTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_kopplingTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$UserKopplingsTableTableFilterComposer
    extends Composer<_$Database, $UserKopplingsTableTable> {
  $$UserKopplingsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$UsersTableTableFilterComposer get user {
    final $$UsersTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.user,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.username,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableFilterComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$KopplingsTableTableFilterComposer get koppling {
    final $$KopplingsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.koppling,
        referencedTable: $db.kopplingsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$KopplingsTableTableFilterComposer(
              $db: $db,
              $table: $db.kopplingsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$UserKopplingsTableTableOrderingComposer
    extends Composer<_$Database, $UserKopplingsTableTable> {
  $$UserKopplingsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$UsersTableTableOrderingComposer get user {
    final $$UsersTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.user,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.username,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableOrderingComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$KopplingsTableTableOrderingComposer get koppling {
    final $$KopplingsTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.koppling,
        referencedTable: $db.kopplingsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$KopplingsTableTableOrderingComposer(
              $db: $db,
              $table: $db.kopplingsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$UserKopplingsTableTableAnnotationComposer
    extends Composer<_$Database, $UserKopplingsTableTable> {
  $$UserKopplingsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$UsersTableTableAnnotationComposer get user {
    final $$UsersTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.user,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.username,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableAnnotationComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$KopplingsTableTableAnnotationComposer get koppling {
    final $$KopplingsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.koppling,
        referencedTable: $db.kopplingsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$KopplingsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.kopplingsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$UserKopplingsTableTableTableManager extends RootTableManager<
    _$Database,
    $UserKopplingsTableTable,
    UserKopplingsTableData,
    $$UserKopplingsTableTableFilterComposer,
    $$UserKopplingsTableTableOrderingComposer,
    $$UserKopplingsTableTableAnnotationComposer,
    $$UserKopplingsTableTableCreateCompanionBuilder,
    $$UserKopplingsTableTableUpdateCompanionBuilder,
    (UserKopplingsTableData, $$UserKopplingsTableTableReferences),
    UserKopplingsTableData,
    PrefetchHooks Function({bool user, bool koppling})> {
  $$UserKopplingsTableTableTableManager(
      _$Database db, $UserKopplingsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserKopplingsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserKopplingsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserKopplingsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> user = const Value.absent(),
            Value<int> koppling = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserKopplingsTableCompanion(
            user: user,
            koppling: koppling,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String user,
            required int koppling,
            Value<int> rowid = const Value.absent(),
          }) =>
              UserKopplingsTableCompanion.insert(
            user: user,
            koppling: koppling,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$UserKopplingsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({user = false, koppling = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (user) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.user,
                    referencedTable:
                        $$UserKopplingsTableTableReferences._userTable(db),
                    referencedColumn: $$UserKopplingsTableTableReferences
                        ._userTable(db)
                        .username,
                  ) as T;
                }
                if (koppling) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.koppling,
                    referencedTable:
                        $$UserKopplingsTableTableReferences._kopplingTable(db),
                    referencedColumn: $$UserKopplingsTableTableReferences
                        ._kopplingTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$UserKopplingsTableTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $UserKopplingsTableTable,
    UserKopplingsTableData,
    $$UserKopplingsTableTableFilterComposer,
    $$UserKopplingsTableTableOrderingComposer,
    $$UserKopplingsTableTableAnnotationComposer,
    $$UserKopplingsTableTableCreateCompanionBuilder,
    $$UserKopplingsTableTableUpdateCompanionBuilder,
    (UserKopplingsTableData, $$UserKopplingsTableTableReferences),
    UserKopplingsTableData,
    PrefetchHooks Function({bool user, bool koppling})>;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$UsersTableTableTableManager get usersTable =>
      $$UsersTableTableTableManager(_db, _db.usersTable);
  $$KopplingsTableTableTableManager get kopplingsTable =>
      $$KopplingsTableTableTableManager(_db, _db.kopplingsTable);
  $$UserKopplingsTableTableTableManager get userKopplingsTable =>
      $$UserKopplingsTableTableTableManager(_db, _db.userKopplingsTable);
}
