// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $StorageTableTable extends StorageTable
    with TableInfo<$StorageTableTable, StorageTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StorageTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, data];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'storage_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<StorageTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  StorageTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StorageTableData(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data'],
      )!,
    );
  }

  @override
  $StorageTableTable createAlias(String alias) {
    return $StorageTableTable(attachedDatabase, alias);
  }
}

class StorageTableData extends DataClass
    implements Insertable<StorageTableData> {
  final String key;
  final String data;
  const StorageTableData({required this.key, required this.data});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['data'] = Variable<String>(data);
    return map;
  }

  StorageTableCompanion toCompanion(bool nullToAbsent) {
    return StorageTableCompanion(key: Value(key), data: Value(data));
  }

  factory StorageTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StorageTableData(
      key: serializer.fromJson<String>(json['key']),
      data: serializer.fromJson<String>(json['data']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'data': serializer.toJson<String>(data),
    };
  }

  StorageTableData copyWith({String? key, String? data}) =>
      StorageTableData(key: key ?? this.key, data: data ?? this.data);
  StorageTableData copyWithCompanion(StorageTableCompanion data) {
    return StorageTableData(
      key: data.key.present ? data.key.value : this.key,
      data: data.data.present ? data.data.value : this.data,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StorageTableData(')
          ..write('key: $key, ')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, data);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StorageTableData &&
          other.key == this.key &&
          other.data == this.data);
}

class StorageTableCompanion extends UpdateCompanion<StorageTableData> {
  final Value<String> key;
  final Value<String> data;
  final Value<int> rowid;
  const StorageTableCompanion({
    this.key = const Value.absent(),
    this.data = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StorageTableCompanion.insert({
    required String key,
    required String data,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       data = Value(data);
  static Insertable<StorageTableData> custom({
    Expression<String>? key,
    Expression<String>? data,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (data != null) 'data': data,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StorageTableCompanion copyWith({
    Value<String>? key,
    Value<String>? data,
    Value<int>? rowid,
  }) {
    return StorageTableCompanion(
      key: key ?? this.key,
      data: data ?? this.data,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StorageTableCompanion(')
          ..write('key: $key, ')
          ..write('data: $data, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $StorageTableTable storageTable = $StorageTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [storageTable];
}

typedef $$StorageTableTableCreateCompanionBuilder =
    StorageTableCompanion Function({
      required String key,
      required String data,
      Value<int> rowid,
    });
typedef $$StorageTableTableUpdateCompanionBuilder =
    StorageTableCompanion Function({
      Value<String> key,
      Value<String> data,
      Value<int> rowid,
    });

class $$StorageTableTableFilterComposer
    extends Composer<_$Database, $StorageTableTable> {
  $$StorageTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StorageTableTableOrderingComposer
    extends Composer<_$Database, $StorageTableTable> {
  $$StorageTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StorageTableTableAnnotationComposer
    extends Composer<_$Database, $StorageTableTable> {
  $$StorageTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);
}

class $$StorageTableTableTableManager
    extends
        RootTableManager<
          _$Database,
          $StorageTableTable,
          StorageTableData,
          $$StorageTableTableFilterComposer,
          $$StorageTableTableOrderingComposer,
          $$StorageTableTableAnnotationComposer,
          $$StorageTableTableCreateCompanionBuilder,
          $$StorageTableTableUpdateCompanionBuilder,
          (
            StorageTableData,
            BaseReferences<_$Database, $StorageTableTable, StorageTableData>,
          ),
          StorageTableData,
          PrefetchHooks Function()
        > {
  $$StorageTableTableTableManager(_$Database db, $StorageTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StorageTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StorageTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StorageTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> data = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StorageTableCompanion(key: key, data: data, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String data,
                Value<int> rowid = const Value.absent(),
              }) => StorageTableCompanion.insert(
                key: key,
                data: data,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StorageTableTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $StorageTableTable,
      StorageTableData,
      $$StorageTableTableFilterComposer,
      $$StorageTableTableOrderingComposer,
      $$StorageTableTableAnnotationComposer,
      $$StorageTableTableCreateCompanionBuilder,
      $$StorageTableTableUpdateCompanionBuilder,
      (
        StorageTableData,
        BaseReferences<_$Database, $StorageTableTable, StorageTableData>,
      ),
      StorageTableData,
      PrefetchHooks Function()
    >;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$StorageTableTableTableManager get storageTable =>
      $$StorageTableTableTableManager(_db, _db.storageTable);
}
