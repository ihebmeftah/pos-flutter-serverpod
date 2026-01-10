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

abstract class Building
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Building._({
    this.id,
    required this.name,
    required this.address,
    required this.openingTime,
    required this.closingTime,
    required this.authUserId,
    bool? tableMultiOrder,
  }) : tableMultiOrder = tableMultiOrder ?? false;

  factory Building({
    int? id,
    required String name,
    required String address,
    required DateTime openingTime,
    required DateTime closingTime,
    required _i1.UuidValue? authUserId,
    bool? tableMultiOrder,
  }) = _BuildingImpl;

  factory Building.fromJson(Map<String, dynamic> jsonSerialization) {
    return Building(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      address: jsonSerialization['address'] as String,
      openingTime: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['openingTime'],
      ),
      closingTime: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['closingTime'],
      ),
      authUserId: jsonSerialization['authUserId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['authUserId'],
            ),
      tableMultiOrder: jsonSerialization['tableMultiOrder'] as bool?,
    );
  }

  static final t = BuildingTable();

  static const db = BuildingRepository._();

  @override
  int? id;

  /// The name of the building.
  String name;

  /// The address of the building.
  String address;

  /// The time when the building opens.
  DateTime openingTime;

  /// The time when the building closes.
  DateTime closingTime;

  /// The ID of the authenticated user associated with this building.
  _i1.UuidValue? authUserId;

  /// Indicates whether the building supports multiple orders per table.
  bool tableMultiOrder;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Building]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Building copyWith({
    int? id,
    String? name,
    String? address,
    DateTime? openingTime,
    DateTime? closingTime,
    _i1.UuidValue? authUserId,
    bool? tableMultiOrder,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Building',
      if (id != null) 'id': id,
      'name': name,
      'address': address,
      'openingTime': openingTime.toJson(),
      'closingTime': closingTime.toJson(),
      if (authUserId != null) 'authUserId': authUserId?.toJson(),
      'tableMultiOrder': tableMultiOrder,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Building',
      if (id != null) 'id': id,
      'name': name,
      'address': address,
      'openingTime': openingTime.toJson(),
      'closingTime': closingTime.toJson(),
      'tableMultiOrder': tableMultiOrder,
    };
  }

  static BuildingInclude include() {
    return BuildingInclude._();
  }

  static BuildingIncludeList includeList({
    _i1.WhereExpressionBuilder<BuildingTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BuildingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BuildingTable>? orderByList,
    BuildingInclude? include,
  }) {
    return BuildingIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Building.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Building.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BuildingImpl extends Building {
  _BuildingImpl({
    int? id,
    required String name,
    required String address,
    required DateTime openingTime,
    required DateTime closingTime,
    required _i1.UuidValue? authUserId,
    bool? tableMultiOrder,
  }) : super._(
         id: id,
         name: name,
         address: address,
         openingTime: openingTime,
         closingTime: closingTime,
         authUserId: authUserId,
         tableMultiOrder: tableMultiOrder,
       );

  /// Returns a shallow copy of this [Building]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Building copyWith({
    Object? id = _Undefined,
    String? name,
    String? address,
    DateTime? openingTime,
    DateTime? closingTime,
    Object? authUserId = _Undefined,
    bool? tableMultiOrder,
  }) {
    return Building(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      openingTime: openingTime ?? this.openingTime,
      closingTime: closingTime ?? this.closingTime,
      authUserId: authUserId is _i1.UuidValue? ? authUserId : this.authUserId,
      tableMultiOrder: tableMultiOrder ?? this.tableMultiOrder,
    );
  }
}

class BuildingUpdateTable extends _i1.UpdateTable<BuildingTable> {
  BuildingUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> address(String value) => _i1.ColumnValue(
    table.address,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> openingTime(DateTime value) =>
      _i1.ColumnValue(
        table.openingTime,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> closingTime(DateTime value) =>
      _i1.ColumnValue(
        table.closingTime,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> authUserId(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.authUserId,
    value,
  );

  _i1.ColumnValue<bool, bool> tableMultiOrder(bool value) => _i1.ColumnValue(
    table.tableMultiOrder,
    value,
  );
}

class BuildingTable extends _i1.Table<int?> {
  BuildingTable({super.tableRelation}) : super(tableName: 'building') {
    updateTable = BuildingUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    address = _i1.ColumnString(
      'address',
      this,
    );
    openingTime = _i1.ColumnDateTime(
      'openingTime',
      this,
    );
    closingTime = _i1.ColumnDateTime(
      'closingTime',
      this,
    );
    authUserId = _i1.ColumnUuid(
      'authUserId',
      this,
    );
    tableMultiOrder = _i1.ColumnBool(
      'tableMultiOrder',
      this,
      hasDefault: true,
    );
  }

  late final BuildingUpdateTable updateTable;

  /// The name of the building.
  late final _i1.ColumnString name;

  /// The address of the building.
  late final _i1.ColumnString address;

  /// The time when the building opens.
  late final _i1.ColumnDateTime openingTime;

  /// The time when the building closes.
  late final _i1.ColumnDateTime closingTime;

  /// The ID of the authenticated user associated with this building.
  late final _i1.ColumnUuid authUserId;

  /// Indicates whether the building supports multiple orders per table.
  late final _i1.ColumnBool tableMultiOrder;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    address,
    openingTime,
    closingTime,
    authUserId,
    tableMultiOrder,
  ];
}

class BuildingInclude extends _i1.IncludeObject {
  BuildingInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Building.t;
}

class BuildingIncludeList extends _i1.IncludeList {
  BuildingIncludeList._({
    _i1.WhereExpressionBuilder<BuildingTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Building.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Building.t;
}

class BuildingRepository {
  const BuildingRepository._();

  /// Returns a list of [Building]s matching the given query parameters.
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
  Future<List<Building>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BuildingTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BuildingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BuildingTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Building>(
      where: where?.call(Building.t),
      orderBy: orderBy?.call(Building.t),
      orderByList: orderByList?.call(Building.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Building] matching the given query parameters.
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
  Future<Building?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BuildingTable>? where,
    int? offset,
    _i1.OrderByBuilder<BuildingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BuildingTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Building>(
      where: where?.call(Building.t),
      orderBy: orderBy?.call(Building.t),
      orderByList: orderByList?.call(Building.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Building] by its [id] or null if no such row exists.
  Future<Building?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Building>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Building]s in the list and returns the inserted rows.
  ///
  /// The returned [Building]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Building>> insert(
    _i1.Session session,
    List<Building> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Building>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Building] and returns the inserted row.
  ///
  /// The returned [Building] will have its `id` field set.
  Future<Building> insertRow(
    _i1.Session session,
    Building row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Building>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Building]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Building>> update(
    _i1.Session session,
    List<Building> rows, {
    _i1.ColumnSelections<BuildingTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Building>(
      rows,
      columns: columns?.call(Building.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Building]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Building> updateRow(
    _i1.Session session,
    Building row, {
    _i1.ColumnSelections<BuildingTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Building>(
      row,
      columns: columns?.call(Building.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Building] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Building?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<BuildingUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Building>(
      id,
      columnValues: columnValues(Building.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Building]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Building>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<BuildingUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<BuildingTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BuildingTable>? orderBy,
    _i1.OrderByListBuilder<BuildingTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Building>(
      columnValues: columnValues(Building.t.updateTable),
      where: where(Building.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Building.t),
      orderByList: orderByList?.call(Building.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Building]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Building>> delete(
    _i1.Session session,
    List<Building> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Building>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Building].
  Future<Building> deleteRow(
    _i1.Session session,
    Building row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Building>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Building>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BuildingTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Building>(
      where: where(Building.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BuildingTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Building>(
      where: where?.call(Building.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
