/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../order/order_status_enum.dart' as _i2;
import '../buildings_tables/building_tables.dart' as _i3;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i4;
import '../order/order_item.dart' as _i5;
import 'package:pos_server/src/generated/protocol.dart' as _i6;

abstract class Order implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Order._({
    this.id,
    _i2.OrderStatus? status,
    DateTime? createdAt,
    this.updatedAt,
    required this.btableId,
    required this.btable,
    required this.passedById,
    this.passedBy,
    required this.closedbyId,
    this.closedby,
    this.items,
  }) : status = status ?? _i2.OrderStatus.progress,
       createdAt = createdAt ?? DateTime.now();

  factory Order({
    int? id,
    _i2.OrderStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    required int btableId,
    required _i3.BTable? btable,
    required _i1.UuidValue passedById,
    _i4.AuthUser? passedBy,
    required _i1.UuidValue closedbyId,
    _i4.AuthUser? closedby,
    List<_i5.OrderItem>? items,
  }) = _OrderImpl;

  factory Order.fromJson(Map<String, dynamic> jsonSerialization) {
    return Order(
      id: jsonSerialization['id'] as int?,
      status: _i2.OrderStatus.fromJson((jsonSerialization['status'] as String)),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      btableId: jsonSerialization['btableId'] as int,
      btable: jsonSerialization['btable'] == null
          ? null
          : _i6.Protocol().deserialize<_i3.BTable>(jsonSerialization['btable']),
      passedById: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['passedById'],
      ),
      passedBy: jsonSerialization['passedBy'] == null
          ? null
          : _i6.Protocol().deserialize<_i4.AuthUser>(
              jsonSerialization['passedBy'],
            ),
      closedbyId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['closedbyId'],
      ),
      closedby: jsonSerialization['closedby'] == null
          ? null
          : _i6.Protocol().deserialize<_i4.AuthUser>(
              jsonSerialization['closedby'],
            ),
      items: jsonSerialization['items'] == null
          ? null
          : _i6.Protocol().deserialize<List<_i5.OrderItem>>(
              jsonSerialization['items'],
            ),
    );
  }

  static final t = OrderTable();

  static const db = OrderRepository._();

  @override
  int? id;

  _i2.OrderStatus status;

  DateTime createdAt;

  DateTime? updatedAt;

  int btableId;

  _i3.BTable? btable;

  _i1.UuidValue passedById;

  _i4.AuthUser? passedBy;

  _i1.UuidValue closedbyId;

  _i4.AuthUser? closedby;

  List<_i5.OrderItem>? items;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Order]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Order copyWith({
    int? id,
    _i2.OrderStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? btableId,
    _i3.BTable? btable,
    _i1.UuidValue? passedById,
    _i4.AuthUser? passedBy,
    _i1.UuidValue? closedbyId,
    _i4.AuthUser? closedby,
    List<_i5.OrderItem>? items,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Order',
      if (id != null) 'id': id,
      'status': status.toJson(),
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      'btableId': btableId,
      if (btable != null) 'btable': btable?.toJson(),
      'passedById': passedById.toJson(),
      if (passedBy != null) 'passedBy': passedBy?.toJson(),
      'closedbyId': closedbyId.toJson(),
      if (closedby != null) 'closedby': closedby?.toJson(),
      if (items != null) 'items': items?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Order',
      if (id != null) 'id': id,
      'status': status.toJson(),
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      'btableId': btableId,
      if (btable != null) 'btable': btable?.toJsonForProtocol(),
      'passedById': passedById.toJson(),
      if (passedBy != null) 'passedBy': passedBy?.toJsonForProtocol(),
      'closedbyId': closedbyId.toJson(),
      if (closedby != null) 'closedby': closedby?.toJsonForProtocol(),
      if (items != null)
        'items': items?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static OrderInclude include({
    _i3.BTableInclude? btable,
    _i4.AuthUserInclude? passedBy,
    _i4.AuthUserInclude? closedby,
    _i5.OrderItemIncludeList? items,
  }) {
    return OrderInclude._(
      btable: btable,
      passedBy: passedBy,
      closedby: closedby,
      items: items,
    );
  }

  static OrderIncludeList includeList({
    _i1.WhereExpressionBuilder<OrderTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderTable>? orderByList,
    OrderInclude? include,
  }) {
    return OrderIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Order.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Order.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _OrderImpl extends Order {
  _OrderImpl({
    int? id,
    _i2.OrderStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    required int btableId,
    required _i3.BTable? btable,
    required _i1.UuidValue passedById,
    _i4.AuthUser? passedBy,
    required _i1.UuidValue closedbyId,
    _i4.AuthUser? closedby,
    List<_i5.OrderItem>? items,
  }) : super._(
         id: id,
         status: status,
         createdAt: createdAt,
         updatedAt: updatedAt,
         btableId: btableId,
         btable: btable,
         passedById: passedById,
         passedBy: passedBy,
         closedbyId: closedbyId,
         closedby: closedby,
         items: items,
       );

  /// Returns a shallow copy of this [Order]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Order copyWith({
    Object? id = _Undefined,
    _i2.OrderStatus? status,
    DateTime? createdAt,
    Object? updatedAt = _Undefined,
    int? btableId,
    Object? btable = _Undefined,
    _i1.UuidValue? passedById,
    Object? passedBy = _Undefined,
    _i1.UuidValue? closedbyId,
    Object? closedby = _Undefined,
    Object? items = _Undefined,
  }) {
    return Order(
      id: id is int? ? id : this.id,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      btableId: btableId ?? this.btableId,
      btable: btable is _i3.BTable? ? btable : this.btable?.copyWith(),
      passedById: passedById ?? this.passedById,
      passedBy: passedBy is _i4.AuthUser?
          ? passedBy
          : this.passedBy?.copyWith(),
      closedbyId: closedbyId ?? this.closedbyId,
      closedby: closedby is _i4.AuthUser?
          ? closedby
          : this.closedby?.copyWith(),
      items: items is List<_i5.OrderItem>?
          ? items
          : this.items?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class OrderUpdateTable extends _i1.UpdateTable<OrderTable> {
  OrderUpdateTable(super.table);

  _i1.ColumnValue<_i2.OrderStatus, _i2.OrderStatus> status(
    _i2.OrderStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );

  _i1.ColumnValue<int, int> btableId(int value) => _i1.ColumnValue(
    table.btableId,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> passedById(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.passedById,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> closedbyId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.closedbyId,
    value,
  );
}

class OrderTable extends _i1.Table<int?> {
  OrderTable({super.tableRelation}) : super(tableName: 'orders') {
    updateTable = OrderUpdateTable(this);
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
      hasDefault: true,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
    btableId = _i1.ColumnInt(
      'btableId',
      this,
    );
    passedById = _i1.ColumnUuid(
      'passedById',
      this,
    );
    closedbyId = _i1.ColumnUuid(
      'closedbyId',
      this,
    );
  }

  late final OrderUpdateTable updateTable;

  late final _i1.ColumnEnum<_i2.OrderStatus> status;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnInt btableId;

  _i3.BTableTable? _btable;

  late final _i1.ColumnUuid passedById;

  _i4.AuthUserTable? _passedBy;

  late final _i1.ColumnUuid closedbyId;

  _i4.AuthUserTable? _closedby;

  _i5.OrderItemTable? ___items;

  _i1.ManyRelation<_i5.OrderItemTable>? _items;

  _i3.BTableTable get btable {
    if (_btable != null) return _btable!;
    _btable = _i1.createRelationTable(
      relationFieldName: 'btable',
      field: Order.t.btableId,
      foreignField: _i3.BTable.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.BTableTable(tableRelation: foreignTableRelation),
    );
    return _btable!;
  }

  _i4.AuthUserTable get passedBy {
    if (_passedBy != null) return _passedBy!;
    _passedBy = _i1.createRelationTable(
      relationFieldName: 'passedBy',
      field: Order.t.passedById,
      foreignField: _i4.AuthUser.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.AuthUserTable(tableRelation: foreignTableRelation),
    );
    return _passedBy!;
  }

  _i4.AuthUserTable get closedby {
    if (_closedby != null) return _closedby!;
    _closedby = _i1.createRelationTable(
      relationFieldName: 'closedby',
      field: Order.t.closedbyId,
      foreignField: _i4.AuthUser.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.AuthUserTable(tableRelation: foreignTableRelation),
    );
    return _closedby!;
  }

  _i5.OrderItemTable get __items {
    if (___items != null) return ___items!;
    ___items = _i1.createRelationTable(
      relationFieldName: '__items',
      field: Order.t.id,
      foreignField: _i5.OrderItem.t.$_ordersItemsOrdersId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.OrderItemTable(tableRelation: foreignTableRelation),
    );
    return ___items!;
  }

  _i1.ManyRelation<_i5.OrderItemTable> get items {
    if (_items != null) return _items!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'items',
      field: Order.t.id,
      foreignField: _i5.OrderItem.t.$_ordersItemsOrdersId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.OrderItemTable(tableRelation: foreignTableRelation),
    );
    _items = _i1.ManyRelation<_i5.OrderItemTable>(
      tableWithRelations: relationTable,
      table: _i5.OrderItemTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _items!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    status,
    createdAt,
    updatedAt,
    btableId,
    passedById,
    closedbyId,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'btable') {
      return btable;
    }
    if (relationField == 'passedBy') {
      return passedBy;
    }
    if (relationField == 'closedby') {
      return closedby;
    }
    if (relationField == 'items') {
      return __items;
    }
    return null;
  }
}

class OrderInclude extends _i1.IncludeObject {
  OrderInclude._({
    _i3.BTableInclude? btable,
    _i4.AuthUserInclude? passedBy,
    _i4.AuthUserInclude? closedby,
    _i5.OrderItemIncludeList? items,
  }) {
    _btable = btable;
    _passedBy = passedBy;
    _closedby = closedby;
    _items = items;
  }

  _i3.BTableInclude? _btable;

  _i4.AuthUserInclude? _passedBy;

  _i4.AuthUserInclude? _closedby;

  _i5.OrderItemIncludeList? _items;

  @override
  Map<String, _i1.Include?> get includes => {
    'btable': _btable,
    'passedBy': _passedBy,
    'closedby': _closedby,
    'items': _items,
  };

  @override
  _i1.Table<int?> get table => Order.t;
}

class OrderIncludeList extends _i1.IncludeList {
  OrderIncludeList._({
    _i1.WhereExpressionBuilder<OrderTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Order.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Order.t;
}

class OrderRepository {
  const OrderRepository._();

  final attach = const OrderAttachRepository._();

  final attachRow = const OrderAttachRowRepository._();

  final detach = const OrderDetachRepository._();

  final detachRow = const OrderDetachRowRepository._();

  /// Returns a list of [Order]s matching the given query parameters.
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
  Future<List<Order>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OrderTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderTable>? orderByList,
    _i1.Transaction? transaction,
    OrderInclude? include,
  }) async {
    return session.db.find<Order>(
      where: where?.call(Order.t),
      orderBy: orderBy?.call(Order.t),
      orderByList: orderByList?.call(Order.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Order] matching the given query parameters.
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
  Future<Order?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OrderTable>? where,
    int? offset,
    _i1.OrderByBuilder<OrderTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderTable>? orderByList,
    _i1.Transaction? transaction,
    OrderInclude? include,
  }) async {
    return session.db.findFirstRow<Order>(
      where: where?.call(Order.t),
      orderBy: orderBy?.call(Order.t),
      orderByList: orderByList?.call(Order.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Order] by its [id] or null if no such row exists.
  Future<Order?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    OrderInclude? include,
  }) async {
    return session.db.findById<Order>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Order]s in the list and returns the inserted rows.
  ///
  /// The returned [Order]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Order>> insert(
    _i1.Session session,
    List<Order> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Order>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Order] and returns the inserted row.
  ///
  /// The returned [Order] will have its `id` field set.
  Future<Order> insertRow(
    _i1.Session session,
    Order row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Order>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Order]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Order>> update(
    _i1.Session session,
    List<Order> rows, {
    _i1.ColumnSelections<OrderTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Order>(
      rows,
      columns: columns?.call(Order.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Order]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Order> updateRow(
    _i1.Session session,
    Order row, {
    _i1.ColumnSelections<OrderTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Order>(
      row,
      columns: columns?.call(Order.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Order] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Order?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<OrderUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Order>(
      id,
      columnValues: columnValues(Order.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Order]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Order>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<OrderUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<OrderTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderTable>? orderBy,
    _i1.OrderByListBuilder<OrderTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Order>(
      columnValues: columnValues(Order.t.updateTable),
      where: where(Order.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Order.t),
      orderByList: orderByList?.call(Order.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Order]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Order>> delete(
    _i1.Session session,
    List<Order> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Order>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Order].
  Future<Order> deleteRow(
    _i1.Session session,
    Order row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Order>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Order>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<OrderTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Order>(
      where: where(Order.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OrderTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Order>(
      where: where?.call(Order.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class OrderAttachRepository {
  const OrderAttachRepository._();

  /// Creates a relation between this [Order] and the given [OrderItem]s
  /// by setting each [OrderItem]'s foreign key `_ordersItemsOrdersId` to refer to this [Order].
  Future<void> items(
    _i1.Session session,
    Order order,
    List<_i5.OrderItem> orderItem, {
    _i1.Transaction? transaction,
  }) async {
    if (orderItem.any((e) => e.id == null)) {
      throw ArgumentError.notNull('orderItem.id');
    }
    if (order.id == null) {
      throw ArgumentError.notNull('order.id');
    }

    var $orderItem = orderItem
        .map(
          (e) => _i5.OrderItemImplicit(
            e,
            $_ordersItemsOrdersId: order.id,
          ),
        )
        .toList();
    await session.db.update<_i5.OrderItem>(
      $orderItem,
      columns: [_i5.OrderItem.t.$_ordersItemsOrdersId],
      transaction: transaction,
    );
  }
}

class OrderAttachRowRepository {
  const OrderAttachRowRepository._();

  /// Creates a relation between the given [Order] and [BTable]
  /// by setting the [Order]'s foreign key `btableId` to refer to the [BTable].
  Future<void> btable(
    _i1.Session session,
    Order order,
    _i3.BTable btable, {
    _i1.Transaction? transaction,
  }) async {
    if (order.id == null) {
      throw ArgumentError.notNull('order.id');
    }
    if (btable.id == null) {
      throw ArgumentError.notNull('btable.id');
    }

    var $order = order.copyWith(btableId: btable.id);
    await session.db.updateRow<Order>(
      $order,
      columns: [Order.t.btableId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Order] and [AuthUser]
  /// by setting the [Order]'s foreign key `passedById` to refer to the [AuthUser].
  Future<void> passedBy(
    _i1.Session session,
    Order order,
    _i4.AuthUser passedBy, {
    _i1.Transaction? transaction,
  }) async {
    if (order.id == null) {
      throw ArgumentError.notNull('order.id');
    }
    if (passedBy.id == null) {
      throw ArgumentError.notNull('passedBy.id');
    }

    var $order = order.copyWith(passedById: passedBy.id);
    await session.db.updateRow<Order>(
      $order,
      columns: [Order.t.passedById],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Order] and [AuthUser]
  /// by setting the [Order]'s foreign key `closedbyId` to refer to the [AuthUser].
  Future<void> closedby(
    _i1.Session session,
    Order order,
    _i4.AuthUser closedby, {
    _i1.Transaction? transaction,
  }) async {
    if (order.id == null) {
      throw ArgumentError.notNull('order.id');
    }
    if (closedby.id == null) {
      throw ArgumentError.notNull('closedby.id');
    }

    var $order = order.copyWith(closedbyId: closedby.id);
    await session.db.updateRow<Order>(
      $order,
      columns: [Order.t.closedbyId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Order] and the given [OrderItem]
  /// by setting the [OrderItem]'s foreign key `_ordersItemsOrdersId` to refer to this [Order].
  Future<void> items(
    _i1.Session session,
    Order order,
    _i5.OrderItem orderItem, {
    _i1.Transaction? transaction,
  }) async {
    if (orderItem.id == null) {
      throw ArgumentError.notNull('orderItem.id');
    }
    if (order.id == null) {
      throw ArgumentError.notNull('order.id');
    }

    var $orderItem = _i5.OrderItemImplicit(
      orderItem,
      $_ordersItemsOrdersId: order.id,
    );
    await session.db.updateRow<_i5.OrderItem>(
      $orderItem,
      columns: [_i5.OrderItem.t.$_ordersItemsOrdersId],
      transaction: transaction,
    );
  }
}

class OrderDetachRepository {
  const OrderDetachRepository._();

  /// Detaches the relation between this [Order] and the given [OrderItem]
  /// by setting the [OrderItem]'s foreign key `_ordersItemsOrdersId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> items(
    _i1.Session session,
    List<_i5.OrderItem> orderItem, {
    _i1.Transaction? transaction,
  }) async {
    if (orderItem.any((e) => e.id == null)) {
      throw ArgumentError.notNull('orderItem.id');
    }

    var $orderItem = orderItem
        .map(
          (e) => _i5.OrderItemImplicit(
            e,
            $_ordersItemsOrdersId: null,
          ),
        )
        .toList();
    await session.db.update<_i5.OrderItem>(
      $orderItem,
      columns: [_i5.OrderItem.t.$_ordersItemsOrdersId],
      transaction: transaction,
    );
  }
}

class OrderDetachRowRepository {
  const OrderDetachRowRepository._();

  /// Detaches the relation between this [Order] and the given [OrderItem]
  /// by setting the [OrderItem]'s foreign key `_ordersItemsOrdersId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> items(
    _i1.Session session,
    _i5.OrderItem orderItem, {
    _i1.Transaction? transaction,
  }) async {
    if (orderItem.id == null) {
      throw ArgumentError.notNull('orderItem.id');
    }

    var $orderItem = _i5.OrderItemImplicit(
      orderItem,
      $_ordersItemsOrdersId: null,
    );
    await session.db.updateRow<_i5.OrderItem>(
      $orderItem,
      columns: [_i5.OrderItem.t.$_ordersItemsOrdersId],
      transaction: transaction,
    );
  }
}
