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

abstract class Access implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Access._({
    this.id,
    required this.name,
    required this.consultAllOrders,
    required this.orderCreation,
    required this.orderCreationNotif,
    required this.orderPayment,
    required this.orderItemsPayment,
    required this.appendItems,
    required this.preparation,
    required this.takeOrder,
    required this.caisseManagement,
    required this.buildingId,
  });

  factory Access({
    int? id,
    required String name,
    required bool consultAllOrders,
    required bool orderCreation,
    required bool orderCreationNotif,
    required bool orderPayment,
    required bool orderItemsPayment,
    required bool appendItems,
    required bool preparation,
    required bool takeOrder,
    required bool caisseManagement,
    required int? buildingId,
  }) = _AccessImpl;

  factory Access.fromJson(Map<String, dynamic> jsonSerialization) {
    return Access(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      consultAllOrders: jsonSerialization['consultAllOrders'] as bool,
      orderCreation: jsonSerialization['orderCreation'] as bool,
      orderCreationNotif: jsonSerialization['orderCreationNotif'] as bool,
      orderPayment: jsonSerialization['orderPayment'] as bool,
      orderItemsPayment: jsonSerialization['orderItemsPayment'] as bool,
      appendItems: jsonSerialization['appendItems'] as bool,
      preparation: jsonSerialization['preparation'] as bool,
      takeOrder: jsonSerialization['takeOrder'] as bool,
      caisseManagement: jsonSerialization['caisseManagement'] as bool,
      buildingId: jsonSerialization['buildingId'] as int?,
    );
  }

  static final t = AccessTable();

  static const db = AccessRepository._();

  @override
  int? id;

  String name;

  bool consultAllOrders;

  bool orderCreation;

  bool orderCreationNotif;

  bool orderPayment;

  bool orderItemsPayment;

  bool appendItems;

  bool preparation;

  bool takeOrder;

  bool caisseManagement;

  int? buildingId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Access]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Access copyWith({
    int? id,
    String? name,
    bool? consultAllOrders,
    bool? orderCreation,
    bool? orderCreationNotif,
    bool? orderPayment,
    bool? orderItemsPayment,
    bool? appendItems,
    bool? preparation,
    bool? takeOrder,
    bool? caisseManagement,
    int? buildingId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Access',
      if (id != null) 'id': id,
      'name': name,
      'consultAllOrders': consultAllOrders,
      'orderCreation': orderCreation,
      'orderCreationNotif': orderCreationNotif,
      'orderPayment': orderPayment,
      'orderItemsPayment': orderItemsPayment,
      'appendItems': appendItems,
      'preparation': preparation,
      'takeOrder': takeOrder,
      'caisseManagement': caisseManagement,
      if (buildingId != null) 'buildingId': buildingId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Access',
      if (id != null) 'id': id,
      'name': name,
      'consultAllOrders': consultAllOrders,
      'orderCreation': orderCreation,
      'orderCreationNotif': orderCreationNotif,
      'orderPayment': orderPayment,
      'orderItemsPayment': orderItemsPayment,
      'appendItems': appendItems,
      'preparation': preparation,
      'takeOrder': takeOrder,
      'caisseManagement': caisseManagement,
      if (buildingId != null) 'buildingId': buildingId,
    };
  }

  static AccessInclude include() {
    return AccessInclude._();
  }

  static AccessIncludeList includeList({
    _i1.WhereExpressionBuilder<AccessTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AccessTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AccessTable>? orderByList,
    AccessInclude? include,
  }) {
    return AccessIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Access.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Access.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AccessImpl extends Access {
  _AccessImpl({
    int? id,
    required String name,
    required bool consultAllOrders,
    required bool orderCreation,
    required bool orderCreationNotif,
    required bool orderPayment,
    required bool orderItemsPayment,
    required bool appendItems,
    required bool preparation,
    required bool takeOrder,
    required bool caisseManagement,
    required int? buildingId,
  }) : super._(
         id: id,
         name: name,
         consultAllOrders: consultAllOrders,
         orderCreation: orderCreation,
         orderCreationNotif: orderCreationNotif,
         orderPayment: orderPayment,
         orderItemsPayment: orderItemsPayment,
         appendItems: appendItems,
         preparation: preparation,
         takeOrder: takeOrder,
         caisseManagement: caisseManagement,
         buildingId: buildingId,
       );

  /// Returns a shallow copy of this [Access]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Access copyWith({
    Object? id = _Undefined,
    String? name,
    bool? consultAllOrders,
    bool? orderCreation,
    bool? orderCreationNotif,
    bool? orderPayment,
    bool? orderItemsPayment,
    bool? appendItems,
    bool? preparation,
    bool? takeOrder,
    bool? caisseManagement,
    Object? buildingId = _Undefined,
  }) {
    return Access(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      consultAllOrders: consultAllOrders ?? this.consultAllOrders,
      orderCreation: orderCreation ?? this.orderCreation,
      orderCreationNotif: orderCreationNotif ?? this.orderCreationNotif,
      orderPayment: orderPayment ?? this.orderPayment,
      orderItemsPayment: orderItemsPayment ?? this.orderItemsPayment,
      appendItems: appendItems ?? this.appendItems,
      preparation: preparation ?? this.preparation,
      takeOrder: takeOrder ?? this.takeOrder,
      caisseManagement: caisseManagement ?? this.caisseManagement,
      buildingId: buildingId is int? ? buildingId : this.buildingId,
    );
  }
}

class AccessUpdateTable extends _i1.UpdateTable<AccessTable> {
  AccessUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<bool, bool> consultAllOrders(bool value) => _i1.ColumnValue(
    table.consultAllOrders,
    value,
  );

  _i1.ColumnValue<bool, bool> orderCreation(bool value) => _i1.ColumnValue(
    table.orderCreation,
    value,
  );

  _i1.ColumnValue<bool, bool> orderCreationNotif(bool value) => _i1.ColumnValue(
    table.orderCreationNotif,
    value,
  );

  _i1.ColumnValue<bool, bool> orderPayment(bool value) => _i1.ColumnValue(
    table.orderPayment,
    value,
  );

  _i1.ColumnValue<bool, bool> orderItemsPayment(bool value) => _i1.ColumnValue(
    table.orderItemsPayment,
    value,
  );

  _i1.ColumnValue<bool, bool> appendItems(bool value) => _i1.ColumnValue(
    table.appendItems,
    value,
  );

  _i1.ColumnValue<bool, bool> preparation(bool value) => _i1.ColumnValue(
    table.preparation,
    value,
  );

  _i1.ColumnValue<bool, bool> takeOrder(bool value) => _i1.ColumnValue(
    table.takeOrder,
    value,
  );

  _i1.ColumnValue<bool, bool> caisseManagement(bool value) => _i1.ColumnValue(
    table.caisseManagement,
    value,
  );

  _i1.ColumnValue<int, int> buildingId(int? value) => _i1.ColumnValue(
    table.buildingId,
    value,
  );
}

class AccessTable extends _i1.Table<int?> {
  AccessTable({super.tableRelation}) : super(tableName: 'access') {
    updateTable = AccessUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    consultAllOrders = _i1.ColumnBool(
      'consultAllOrders',
      this,
    );
    orderCreation = _i1.ColumnBool(
      'orderCreation',
      this,
    );
    orderCreationNotif = _i1.ColumnBool(
      'orderCreationNotif',
      this,
    );
    orderPayment = _i1.ColumnBool(
      'orderPayment',
      this,
    );
    orderItemsPayment = _i1.ColumnBool(
      'orderItemsPayment',
      this,
    );
    appendItems = _i1.ColumnBool(
      'appendItems',
      this,
    );
    preparation = _i1.ColumnBool(
      'preparation',
      this,
    );
    takeOrder = _i1.ColumnBool(
      'takeOrder',
      this,
    );
    caisseManagement = _i1.ColumnBool(
      'caisseManagement',
      this,
    );
    buildingId = _i1.ColumnInt(
      'buildingId',
      this,
    );
  }

  late final AccessUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnBool consultAllOrders;

  late final _i1.ColumnBool orderCreation;

  late final _i1.ColumnBool orderCreationNotif;

  late final _i1.ColumnBool orderPayment;

  late final _i1.ColumnBool orderItemsPayment;

  late final _i1.ColumnBool appendItems;

  late final _i1.ColumnBool preparation;

  late final _i1.ColumnBool takeOrder;

  late final _i1.ColumnBool caisseManagement;

  late final _i1.ColumnInt buildingId;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    consultAllOrders,
    orderCreation,
    orderCreationNotif,
    orderPayment,
    orderItemsPayment,
    appendItems,
    preparation,
    takeOrder,
    caisseManagement,
    buildingId,
  ];
}

class AccessInclude extends _i1.IncludeObject {
  AccessInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Access.t;
}

class AccessIncludeList extends _i1.IncludeList {
  AccessIncludeList._({
    _i1.WhereExpressionBuilder<AccessTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Access.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Access.t;
}

class AccessRepository {
  const AccessRepository._();

  /// Returns a list of [Access]s matching the given query parameters.
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
  Future<List<Access>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AccessTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AccessTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AccessTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Access>(
      where: where?.call(Access.t),
      orderBy: orderBy?.call(Access.t),
      orderByList: orderByList?.call(Access.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Access] matching the given query parameters.
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
  Future<Access?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AccessTable>? where,
    int? offset,
    _i1.OrderByBuilder<AccessTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AccessTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Access>(
      where: where?.call(Access.t),
      orderBy: orderBy?.call(Access.t),
      orderByList: orderByList?.call(Access.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Access] by its [id] or null if no such row exists.
  Future<Access?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Access>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Access]s in the list and returns the inserted rows.
  ///
  /// The returned [Access]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Access>> insert(
    _i1.Session session,
    List<Access> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Access>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Access] and returns the inserted row.
  ///
  /// The returned [Access] will have its `id` field set.
  Future<Access> insertRow(
    _i1.Session session,
    Access row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Access>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Access]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Access>> update(
    _i1.Session session,
    List<Access> rows, {
    _i1.ColumnSelections<AccessTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Access>(
      rows,
      columns: columns?.call(Access.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Access]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Access> updateRow(
    _i1.Session session,
    Access row, {
    _i1.ColumnSelections<AccessTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Access>(
      row,
      columns: columns?.call(Access.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Access] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Access?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<AccessUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Access>(
      id,
      columnValues: columnValues(Access.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Access]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Access>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<AccessUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<AccessTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AccessTable>? orderBy,
    _i1.OrderByListBuilder<AccessTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Access>(
      columnValues: columnValues(Access.t.updateTable),
      where: where(Access.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Access.t),
      orderByList: orderByList?.call(Access.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Access]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Access>> delete(
    _i1.Session session,
    List<Access> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Access>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Access].
  Future<Access> deleteRow(
    _i1.Session session,
    Access row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Access>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Access>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AccessTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Access>(
      where: where(Access.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AccessTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Access>(
      where: where?.call(Access.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
