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
import '../article/article.dart' as _i2;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i3;
import 'package:pos_server/src/generated/protocol.dart' as _i4;

abstract class OrderItem
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  OrderItem._({
    this.id,
    required this.article,
    required this.passedById,
    this.passedBy,
    bool? payed,
  }) : payed = payed ?? false,
       _ordersItemsOrdersId = null;

  factory OrderItem({
    int? id,
    required _i2.Article article,
    required _i1.UuidValue passedById,
    _i3.AuthUser? passedBy,
    bool? payed,
  }) = _OrderItemImpl;

  factory OrderItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return OrderItemImplicit._(
      id: jsonSerialization['id'] as int?,
      article: _i4.Protocol().deserialize<_i2.Article>(
        jsonSerialization['article'],
      ),
      passedById: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['passedById'],
      ),
      passedBy: jsonSerialization['passedBy'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.AuthUser>(
              jsonSerialization['passedBy'],
            ),
      payed: jsonSerialization['payed'] as bool,
      $_ordersItemsOrdersId: jsonSerialization['_ordersItemsOrdersId'] as int?,
    );
  }

  static final t = OrderItemTable();

  static const db = OrderItemRepository._();

  @override
  int? id;

  _i2.Article article;

  _i1.UuidValue passedById;

  _i3.AuthUser? passedBy;

  bool payed;

  final int? _ordersItemsOrdersId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [OrderItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  OrderItem copyWith({
    int? id,
    _i2.Article? article,
    _i1.UuidValue? passedById,
    _i3.AuthUser? passedBy,
    bool? payed,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'OrderItem',
      if (id != null) 'id': id,
      'article': article.toJson(),
      'passedById': passedById.toJson(),
      if (passedBy != null) 'passedBy': passedBy?.toJson(),
      'payed': payed,
      if (_ordersItemsOrdersId != null)
        '_ordersItemsOrdersId': _ordersItemsOrdersId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'OrderItem',
      if (id != null) 'id': id,
      'article': article.toJsonForProtocol(),
      'passedById': passedById.toJson(),
      if (passedBy != null) 'passedBy': passedBy?.toJsonForProtocol(),
      'payed': payed,
    };
  }

  static OrderItemInclude include({_i3.AuthUserInclude? passedBy}) {
    return OrderItemInclude._(passedBy: passedBy);
  }

  static OrderItemIncludeList includeList({
    _i1.WhereExpressionBuilder<OrderItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderItemTable>? orderByList,
    OrderItemInclude? include,
  }) {
    return OrderItemIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(OrderItem.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(OrderItem.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _OrderItemImpl extends OrderItem {
  _OrderItemImpl({
    int? id,
    required _i2.Article article,
    required _i1.UuidValue passedById,
    _i3.AuthUser? passedBy,
    bool? payed,
  }) : super._(
         id: id,
         article: article,
         passedById: passedById,
         passedBy: passedBy,
         payed: payed,
       );

  /// Returns a shallow copy of this [OrderItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  OrderItem copyWith({
    Object? id = _Undefined,
    _i2.Article? article,
    _i1.UuidValue? passedById,
    Object? passedBy = _Undefined,
    bool? payed,
  }) {
    return OrderItemImplicit._(
      id: id is int? ? id : this.id,
      article: article ?? this.article.copyWith(),
      passedById: passedById ?? this.passedById,
      passedBy: passedBy is _i3.AuthUser?
          ? passedBy
          : this.passedBy?.copyWith(),
      payed: payed ?? this.payed,
      $_ordersItemsOrdersId: this._ordersItemsOrdersId,
    );
  }
}

class OrderItemImplicit extends _OrderItemImpl {
  OrderItemImplicit._({
    int? id,
    required _i2.Article article,
    required _i1.UuidValue passedById,
    _i3.AuthUser? passedBy,
    bool? payed,
    int? $_ordersItemsOrdersId,
  }) : _ordersItemsOrdersId = $_ordersItemsOrdersId,
       super(
         id: id,
         article: article,
         passedById: passedById,
         passedBy: passedBy,
         payed: payed,
       );

  factory OrderItemImplicit(
    OrderItem orderItem, {
    int? $_ordersItemsOrdersId,
  }) {
    return OrderItemImplicit._(
      id: orderItem.id,
      article: orderItem.article,
      passedById: orderItem.passedById,
      passedBy: orderItem.passedBy,
      payed: orderItem.payed,
      $_ordersItemsOrdersId: $_ordersItemsOrdersId,
    );
  }

  @override
  final int? _ordersItemsOrdersId;
}

class OrderItemUpdateTable extends _i1.UpdateTable<OrderItemTable> {
  OrderItemUpdateTable(super.table);

  _i1.ColumnValue<_i2.Article, _i2.Article> article(_i2.Article value) =>
      _i1.ColumnValue(
        table.article,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> passedById(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.passedById,
    value,
  );

  _i1.ColumnValue<bool, bool> payed(bool value) => _i1.ColumnValue(
    table.payed,
    value,
  );

  _i1.ColumnValue<int, int> $_ordersItemsOrdersId(int? value) =>
      _i1.ColumnValue(
        table.$_ordersItemsOrdersId,
        value,
      );
}

class OrderItemTable extends _i1.Table<int?> {
  OrderItemTable({super.tableRelation}) : super(tableName: 'order_items') {
    updateTable = OrderItemUpdateTable(this);
    article = _i1.ColumnSerializable<_i2.Article>(
      'article',
      this,
    );
    passedById = _i1.ColumnUuid(
      'passedById',
      this,
    );
    payed = _i1.ColumnBool(
      'payed',
      this,
      hasDefault: true,
    );
    $_ordersItemsOrdersId = _i1.ColumnInt(
      '_ordersItemsOrdersId',
      this,
    );
  }

  late final OrderItemUpdateTable updateTable;

  late final _i1.ColumnSerializable<_i2.Article> article;

  late final _i1.ColumnUuid passedById;

  _i3.AuthUserTable? _passedBy;

  late final _i1.ColumnBool payed;

  late final _i1.ColumnInt $_ordersItemsOrdersId;

  _i3.AuthUserTable get passedBy {
    if (_passedBy != null) return _passedBy!;
    _passedBy = _i1.createRelationTable(
      relationFieldName: 'passedBy',
      field: OrderItem.t.passedById,
      foreignField: _i3.AuthUser.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.AuthUserTable(tableRelation: foreignTableRelation),
    );
    return _passedBy!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    article,
    passedById,
    payed,
    $_ordersItemsOrdersId,
  ];

  @override
  List<_i1.Column> get managedColumns => [
    id,
    article,
    passedById,
    payed,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'passedBy') {
      return passedBy;
    }
    return null;
  }
}

class OrderItemInclude extends _i1.IncludeObject {
  OrderItemInclude._({_i3.AuthUserInclude? passedBy}) {
    _passedBy = passedBy;
  }

  _i3.AuthUserInclude? _passedBy;

  @override
  Map<String, _i1.Include?> get includes => {'passedBy': _passedBy};

  @override
  _i1.Table<int?> get table => OrderItem.t;
}

class OrderItemIncludeList extends _i1.IncludeList {
  OrderItemIncludeList._({
    _i1.WhereExpressionBuilder<OrderItemTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(OrderItem.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => OrderItem.t;
}

class OrderItemRepository {
  const OrderItemRepository._();

  final attachRow = const OrderItemAttachRowRepository._();

  /// Returns a list of [OrderItem]s matching the given query parameters.
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
  Future<List<OrderItem>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OrderItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderItemTable>? orderByList,
    _i1.Transaction? transaction,
    OrderItemInclude? include,
  }) async {
    return session.db.find<OrderItem>(
      where: where?.call(OrderItem.t),
      orderBy: orderBy?.call(OrderItem.t),
      orderByList: orderByList?.call(OrderItem.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [OrderItem] matching the given query parameters.
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
  Future<OrderItem?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OrderItemTable>? where,
    int? offset,
    _i1.OrderByBuilder<OrderItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderItemTable>? orderByList,
    _i1.Transaction? transaction,
    OrderItemInclude? include,
  }) async {
    return session.db.findFirstRow<OrderItem>(
      where: where?.call(OrderItem.t),
      orderBy: orderBy?.call(OrderItem.t),
      orderByList: orderByList?.call(OrderItem.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [OrderItem] by its [id] or null if no such row exists.
  Future<OrderItem?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    OrderItemInclude? include,
  }) async {
    return session.db.findById<OrderItem>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [OrderItem]s in the list and returns the inserted rows.
  ///
  /// The returned [OrderItem]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<OrderItem>> insert(
    _i1.Session session,
    List<OrderItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<OrderItem>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [OrderItem] and returns the inserted row.
  ///
  /// The returned [OrderItem] will have its `id` field set.
  Future<OrderItem> insertRow(
    _i1.Session session,
    OrderItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<OrderItem>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [OrderItem]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<OrderItem>> update(
    _i1.Session session,
    List<OrderItem> rows, {
    _i1.ColumnSelections<OrderItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<OrderItem>(
      rows,
      columns: columns?.call(OrderItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [OrderItem]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<OrderItem> updateRow(
    _i1.Session session,
    OrderItem row, {
    _i1.ColumnSelections<OrderItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<OrderItem>(
      row,
      columns: columns?.call(OrderItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [OrderItem] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<OrderItem?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<OrderItemUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<OrderItem>(
      id,
      columnValues: columnValues(OrderItem.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [OrderItem]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<OrderItem>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<OrderItemUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<OrderItemTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderItemTable>? orderBy,
    _i1.OrderByListBuilder<OrderItemTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<OrderItem>(
      columnValues: columnValues(OrderItem.t.updateTable),
      where: where(OrderItem.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(OrderItem.t),
      orderByList: orderByList?.call(OrderItem.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [OrderItem]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<OrderItem>> delete(
    _i1.Session session,
    List<OrderItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<OrderItem>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [OrderItem].
  Future<OrderItem> deleteRow(
    _i1.Session session,
    OrderItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<OrderItem>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<OrderItem>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<OrderItemTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<OrderItem>(
      where: where(OrderItem.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OrderItemTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<OrderItem>(
      where: where?.call(OrderItem.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class OrderItemAttachRowRepository {
  const OrderItemAttachRowRepository._();

  /// Creates a relation between the given [OrderItem] and [AuthUser]
  /// by setting the [OrderItem]'s foreign key `passedById` to refer to the [AuthUser].
  Future<void> passedBy(
    _i1.Session session,
    OrderItem orderItem,
    _i3.AuthUser passedBy, {
    _i1.Transaction? transaction,
  }) async {
    if (orderItem.id == null) {
      throw ArgumentError.notNull('orderItem.id');
    }
    if (passedBy.id == null) {
      throw ArgumentError.notNull('passedBy.id');
    }

    var $orderItem = orderItem.copyWith(passedById: passedBy.id);
    await session.db.updateRow<OrderItem>(
      $orderItem,
      columns: [OrderItem.t.passedById],
      transaction: transaction,
    );
  }
}
