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
import '../buildings_tables/table_status_enum.dart' as _i2;

abstract class BTable implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  BTable._({
    this.id,
    required this.number,
    int? seatsMax,
    _i2.TableStatus? status,
    this.buildingId,
  }) : seatsMax = seatsMax ?? 4,
       status = status ?? _i2.TableStatus.available;

  factory BTable({
    int? id,
    required int number,
    int? seatsMax,
    _i2.TableStatus? status,
    int? buildingId,
  }) = _BTableImpl;

  factory BTable.fromJson(Map<String, dynamic> jsonSerialization) {
    return BTable(
      id: jsonSerialization['id'] as int?,
      number: jsonSerialization['number'] as int,
      seatsMax: jsonSerialization['seatsMax'] as int,
      status: _i2.TableStatus.fromJson((jsonSerialization['status'] as String)),
      buildingId: jsonSerialization['buildingId'] as int?,
    );
  }

  static final t = BTableTable();

  static const db = BTableRepository._();

  @override
  int? id;

  /// The number of the building.
  int number;

  int seatsMax;

  _i2.TableStatus status;

  int? buildingId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [BTable]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BTable copyWith({
    int? id,
    int? number,
    int? seatsMax,
    _i2.TableStatus? status,
    int? buildingId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BTable',
      if (id != null) 'id': id,
      'number': number,
      'seatsMax': seatsMax,
      'status': status.toJson(),
      if (buildingId != null) 'buildingId': buildingId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'BTable',
      if (id != null) 'id': id,
      'number': number,
      'seatsMax': seatsMax,
      'status': status.toJson(),
    };
  }

  static BTableInclude include() {
    return BTableInclude._();
  }

  static BTableIncludeList includeList({
    _i1.WhereExpressionBuilder<BTableTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BTableTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BTableTable>? orderByList,
    BTableInclude? include,
  }) {
    return BTableIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BTable.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(BTable.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BTableImpl extends BTable {
  _BTableImpl({
    int? id,
    required int number,
    int? seatsMax,
    _i2.TableStatus? status,
    int? buildingId,
  }) : super._(
         id: id,
         number: number,
         seatsMax: seatsMax,
         status: status,
         buildingId: buildingId,
       );

  /// Returns a shallow copy of this [BTable]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BTable copyWith({
    Object? id = _Undefined,
    int? number,
    int? seatsMax,
    _i2.TableStatus? status,
    Object? buildingId = _Undefined,
  }) {
    return BTable(
      id: id is int? ? id : this.id,
      number: number ?? this.number,
      seatsMax: seatsMax ?? this.seatsMax,
      status: status ?? this.status,
      buildingId: buildingId is int? ? buildingId : this.buildingId,
    );
  }
}

class BTableUpdateTable extends _i1.UpdateTable<BTableTable> {
  BTableUpdateTable(super.table);

  _i1.ColumnValue<int, int> number(int value) => _i1.ColumnValue(
    table.number,
    value,
  );

  _i1.ColumnValue<int, int> seatsMax(int value) => _i1.ColumnValue(
    table.seatsMax,
    value,
  );

  _i1.ColumnValue<_i2.TableStatus, _i2.TableStatus> status(
    _i2.TableStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<int, int> buildingId(int? value) => _i1.ColumnValue(
    table.buildingId,
    value,
  );
}

class BTableTable extends _i1.Table<int?> {
  BTableTable({super.tableRelation}) : super(tableName: 'b_tables') {
    updateTable = BTableUpdateTable(this);
    number = _i1.ColumnInt(
      'number',
      this,
    );
    seatsMax = _i1.ColumnInt(
      'seatsMax',
      this,
      hasDefault: true,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
      hasDefault: true,
    );
    buildingId = _i1.ColumnInt(
      'buildingId',
      this,
    );
  }

  late final BTableUpdateTable updateTable;

  /// The number of the building.
  late final _i1.ColumnInt number;

  late final _i1.ColumnInt seatsMax;

  late final _i1.ColumnEnum<_i2.TableStatus> status;

  late final _i1.ColumnInt buildingId;

  @override
  List<_i1.Column> get columns => [
    id,
    number,
    seatsMax,
    status,
    buildingId,
  ];
}

class BTableInclude extends _i1.IncludeObject {
  BTableInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => BTable.t;
}

class BTableIncludeList extends _i1.IncludeList {
  BTableIncludeList._({
    _i1.WhereExpressionBuilder<BTableTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BTable.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => BTable.t;
}

class BTableRepository {
  const BTableRepository._();

  /// Returns a list of [BTable]s matching the given query parameters.
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
  Future<List<BTable>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BTableTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BTableTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BTableTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<BTable>(
      where: where?.call(BTable.t),
      orderBy: orderBy?.call(BTable.t),
      orderByList: orderByList?.call(BTable.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [BTable] matching the given query parameters.
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
  Future<BTable?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BTableTable>? where,
    int? offset,
    _i1.OrderByBuilder<BTableTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BTableTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<BTable>(
      where: where?.call(BTable.t),
      orderBy: orderBy?.call(BTable.t),
      orderByList: orderByList?.call(BTable.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [BTable] by its [id] or null if no such row exists.
  Future<BTable?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<BTable>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [BTable]s in the list and returns the inserted rows.
  ///
  /// The returned [BTable]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<BTable>> insert(
    _i1.Session session,
    List<BTable> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<BTable>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [BTable] and returns the inserted row.
  ///
  /// The returned [BTable] will have its `id` field set.
  Future<BTable> insertRow(
    _i1.Session session,
    BTable row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<BTable>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [BTable]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<BTable>> update(
    _i1.Session session,
    List<BTable> rows, {
    _i1.ColumnSelections<BTableTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<BTable>(
      rows,
      columns: columns?.call(BTable.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BTable]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<BTable> updateRow(
    _i1.Session session,
    BTable row, {
    _i1.ColumnSelections<BTableTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<BTable>(
      row,
      columns: columns?.call(BTable.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BTable] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<BTable?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<BTableUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<BTable>(
      id,
      columnValues: columnValues(BTable.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [BTable]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<BTable>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<BTableUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<BTableTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BTableTable>? orderBy,
    _i1.OrderByListBuilder<BTableTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<BTable>(
      columnValues: columnValues(BTable.t.updateTable),
      where: where(BTable.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BTable.t),
      orderByList: orderByList?.call(BTable.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [BTable]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<BTable>> delete(
    _i1.Session session,
    List<BTable> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<BTable>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [BTable].
  Future<BTable> deleteRow(
    _i1.Session session,
    BTable row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BTable>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<BTable>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BTableTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<BTable>(
      where: where(BTable.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BTableTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<BTable>(
      where: where?.call(BTable.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
