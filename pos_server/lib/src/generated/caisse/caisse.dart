/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Caisse
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  Caisse._({
    _i1.UuidValue? id,
    required this.start,
    this.end,
    required this.isClosed,
    required this.buildingId,
    DateTime? createdAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       createdAt = createdAt ?? DateTime.now();

  factory Caisse({
    _i1.UuidValue? id,
    required DateTime start,
    DateTime? end,
    required bool isClosed,
    required _i1.UuidValue buildingId,
    DateTime? createdAt,
  }) = _CaisseImpl;

  factory Caisse.fromJson(Map<String, dynamic> jsonSerialization) {
    return Caisse(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      start: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['start']),
      end: jsonSerialization['end'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['end']),
      isClosed: jsonSerialization['isClosed'] as bool,
      buildingId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['buildingId'],
      ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = CaisseTable();

  static const db = CaisseRepository._();

  @override
  _i1.UuidValue id;

  DateTime start;

  DateTime? end;

  bool isClosed;

  _i1.UuidValue buildingId;

  DateTime createdAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [Caisse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Caisse copyWith({
    _i1.UuidValue? id,
    DateTime? start,
    DateTime? end,
    bool? isClosed,
    _i1.UuidValue? buildingId,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Caisse',
      'id': id.toJson(),
      'start': start.toJson(),
      if (end != null) 'end': end?.toJson(),
      'isClosed': isClosed,
      'buildingId': buildingId.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Caisse',
      'id': id.toJson(),
      'start': start.toJson(),
      if (end != null) 'end': end?.toJson(),
      'isClosed': isClosed,
      'buildingId': buildingId.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  static CaisseInclude include() {
    return CaisseInclude._();
  }

  static CaisseIncludeList includeList({
    _i1.WhereExpressionBuilder<CaisseTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CaisseTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CaisseTable>? orderByList,
    CaisseInclude? include,
  }) {
    return CaisseIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Caisse.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Caisse.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CaisseImpl extends Caisse {
  _CaisseImpl({
    _i1.UuidValue? id,
    required DateTime start,
    DateTime? end,
    required bool isClosed,
    required _i1.UuidValue buildingId,
    DateTime? createdAt,
  }) : super._(
         id: id,
         start: start,
         end: end,
         isClosed: isClosed,
         buildingId: buildingId,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Caisse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Caisse copyWith({
    _i1.UuidValue? id,
    DateTime? start,
    Object? end = _Undefined,
    bool? isClosed,
    _i1.UuidValue? buildingId,
    DateTime? createdAt,
  }) {
    return Caisse(
      id: id ?? this.id,
      start: start ?? this.start,
      end: end is DateTime? ? end : this.end,
      isClosed: isClosed ?? this.isClosed,
      buildingId: buildingId ?? this.buildingId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class CaisseUpdateTable extends _i1.UpdateTable<CaisseTable> {
  CaisseUpdateTable(super.table);

  _i1.ColumnValue<DateTime, DateTime> start(DateTime value) => _i1.ColumnValue(
    table.start,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> end(DateTime? value) => _i1.ColumnValue(
    table.end,
    value,
  );

  _i1.ColumnValue<bool, bool> isClosed(bool value) => _i1.ColumnValue(
    table.isClosed,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> buildingId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.buildingId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class CaisseTable extends _i1.Table<_i1.UuidValue> {
  CaisseTable({super.tableRelation}) : super(tableName: 'caisse') {
    updateTable = CaisseUpdateTable(this);
    start = _i1.ColumnDateTime(
      'start',
      this,
    );
    end = _i1.ColumnDateTime(
      'end',
      this,
    );
    isClosed = _i1.ColumnBool(
      'isClosed',
      this,
    );
    buildingId = _i1.ColumnUuid(
      'buildingId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final CaisseUpdateTable updateTable;

  late final _i1.ColumnDateTime start;

  late final _i1.ColumnDateTime end;

  late final _i1.ColumnBool isClosed;

  late final _i1.ColumnUuid buildingId;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    start,
    end,
    isClosed,
    buildingId,
    createdAt,
  ];
}

class CaisseInclude extends _i1.IncludeObject {
  CaisseInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue> get table => Caisse.t;
}

class CaisseIncludeList extends _i1.IncludeList {
  CaisseIncludeList._({
    _i1.WhereExpressionBuilder<CaisseTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Caisse.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => Caisse.t;
}

class CaisseRepository {
  const CaisseRepository._();

  /// Returns a list of [Caisse]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Caisse>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CaisseTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CaisseTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CaisseTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Caisse>(
      where: where?.call(Caisse.t),
      orderBy: orderBy?.call(Caisse.t),
      orderByList: orderByList?.call(Caisse.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Caisse] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Caisse?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CaisseTable>? where,
    int? offset,
    _i1.OrderByBuilder<CaisseTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CaisseTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Caisse>(
      where: where?.call(Caisse.t),
      orderBy: orderBy?.call(Caisse.t),
      orderByList: orderByList?.call(Caisse.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Caisse] by its [id] or null if no such row exists.
  Future<Caisse?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Caisse>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Caisse]s in the list and returns the inserted rows.
  ///
  /// The returned [Caisse]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Caisse>> insert(
    _i1.Session session,
    List<Caisse> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Caisse>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Caisse] and returns the inserted row.
  ///
  /// The returned [Caisse] will have its `id` field set.
  Future<Caisse> insertRow(
    _i1.Session session,
    Caisse row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Caisse>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Caisse]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Caisse>> update(
    _i1.Session session,
    List<Caisse> rows, {
    _i1.ColumnSelections<CaisseTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Caisse>(
      rows,
      columns: columns?.call(Caisse.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Caisse]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Caisse> updateRow(
    _i1.Session session,
    Caisse row, {
    _i1.ColumnSelections<CaisseTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Caisse>(
      row,
      columns: columns?.call(Caisse.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Caisse] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Caisse?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<CaisseUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Caisse>(
      id,
      columnValues: columnValues(Caisse.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Caisse]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Caisse>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<CaisseUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<CaisseTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CaisseTable>? orderBy,
    _i1.OrderByListBuilder<CaisseTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Caisse>(
      columnValues: columnValues(Caisse.t.updateTable),
      where: where(Caisse.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Caisse.t),
      orderByList: orderByList?.call(Caisse.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Caisse]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Caisse>> delete(
    _i1.Session session,
    List<Caisse> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Caisse>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Caisse].
  Future<Caisse> deleteRow(
    _i1.Session session,
    Caisse row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Caisse>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Caisse>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CaisseTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Caisse>(
      where: where(Caisse.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CaisseTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Caisse>(
      where: where?.call(Caisse.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
