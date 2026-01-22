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

abstract class CashRegister
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  CashRegister._({
    _i1.UuidValue? id,
    required this.start,
    this.end,
    required this.isClosed,
    required this.buildingId,
    DateTime? createdAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       createdAt = createdAt ?? DateTime.now();

  factory CashRegister({
    _i1.UuidValue? id,
    required DateTime start,
    DateTime? end,
    required bool isClosed,
    required _i1.UuidValue buildingId,
    DateTime? createdAt,
  }) = _CashRegisterImpl;

  factory CashRegister.fromJson(Map<String, dynamic> jsonSerialization) {
    return CashRegister(
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

  static final t = CashRegisterTable();

  static const db = CashRegisterRepository._();

  @override
  _i1.UuidValue id;

  DateTime start;

  DateTime? end;

  bool isClosed;

  _i1.UuidValue buildingId;

  DateTime createdAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [CashRegister]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CashRegister copyWith({
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
      '__className__': 'CashRegister',
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
      '__className__': 'CashRegister',
      'id': id.toJson(),
      'start': start.toJson(),
      if (end != null) 'end': end?.toJson(),
      'isClosed': isClosed,
      'buildingId': buildingId.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  static CashRegisterInclude include() {
    return CashRegisterInclude._();
  }

  static CashRegisterIncludeList includeList({
    _i1.WhereExpressionBuilder<CashRegisterTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CashRegisterTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CashRegisterTable>? orderByList,
    CashRegisterInclude? include,
  }) {
    return CashRegisterIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CashRegister.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CashRegister.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CashRegisterImpl extends CashRegister {
  _CashRegisterImpl({
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

  /// Returns a shallow copy of this [CashRegister]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CashRegister copyWith({
    _i1.UuidValue? id,
    DateTime? start,
    Object? end = _Undefined,
    bool? isClosed,
    _i1.UuidValue? buildingId,
    DateTime? createdAt,
  }) {
    return CashRegister(
      id: id ?? this.id,
      start: start ?? this.start,
      end: end is DateTime? ? end : this.end,
      isClosed: isClosed ?? this.isClosed,
      buildingId: buildingId ?? this.buildingId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class CashRegisterUpdateTable extends _i1.UpdateTable<CashRegisterTable> {
  CashRegisterUpdateTable(super.table);

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

class CashRegisterTable extends _i1.Table<_i1.UuidValue> {
  CashRegisterTable({super.tableRelation}) : super(tableName: 'cash_register') {
    updateTable = CashRegisterUpdateTable(this);
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

  late final CashRegisterUpdateTable updateTable;

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

class CashRegisterInclude extends _i1.IncludeObject {
  CashRegisterInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue> get table => CashRegister.t;
}

class CashRegisterIncludeList extends _i1.IncludeList {
  CashRegisterIncludeList._({
    _i1.WhereExpressionBuilder<CashRegisterTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CashRegister.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => CashRegister.t;
}

class CashRegisterRepository {
  const CashRegisterRepository._();

  /// Returns a list of [CashRegister]s matching the given query parameters.
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
  Future<List<CashRegister>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CashRegisterTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CashRegisterTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CashRegisterTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<CashRegister>(
      where: where?.call(CashRegister.t),
      orderBy: orderBy?.call(CashRegister.t),
      orderByList: orderByList?.call(CashRegister.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [CashRegister] matching the given query parameters.
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
  Future<CashRegister?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CashRegisterTable>? where,
    int? offset,
    _i1.OrderByBuilder<CashRegisterTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CashRegisterTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<CashRegister>(
      where: where?.call(CashRegister.t),
      orderBy: orderBy?.call(CashRegister.t),
      orderByList: orderByList?.call(CashRegister.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [CashRegister] by its [id] or null if no such row exists.
  Future<CashRegister?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<CashRegister>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [CashRegister]s in the list and returns the inserted rows.
  ///
  /// The returned [CashRegister]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CashRegister>> insert(
    _i1.Session session,
    List<CashRegister> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CashRegister>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CashRegister] and returns the inserted row.
  ///
  /// The returned [CashRegister] will have its `id` field set.
  Future<CashRegister> insertRow(
    _i1.Session session,
    CashRegister row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CashRegister>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CashRegister]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CashRegister>> update(
    _i1.Session session,
    List<CashRegister> rows, {
    _i1.ColumnSelections<CashRegisterTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CashRegister>(
      rows,
      columns: columns?.call(CashRegister.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CashRegister]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CashRegister> updateRow(
    _i1.Session session,
    CashRegister row, {
    _i1.ColumnSelections<CashRegisterTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CashRegister>(
      row,
      columns: columns?.call(CashRegister.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CashRegister] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CashRegister?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<CashRegisterUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<CashRegister>(
      id,
      columnValues: columnValues(CashRegister.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CashRegister]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<CashRegister>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<CashRegisterUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<CashRegisterTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CashRegisterTable>? orderBy,
    _i1.OrderByListBuilder<CashRegisterTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<CashRegister>(
      columnValues: columnValues(CashRegister.t.updateTable),
      where: where(CashRegister.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CashRegister.t),
      orderByList: orderByList?.call(CashRegister.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [CashRegister]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CashRegister>> delete(
    _i1.Session session,
    List<CashRegister> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CashRegister>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CashRegister].
  Future<CashRegister> deleteRow(
    _i1.Session session,
    CashRegister row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CashRegister>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CashRegister>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CashRegisterTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CashRegister>(
      where: where(CashRegister.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CashRegisterTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CashRegister>(
      where: where?.call(CashRegister.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
