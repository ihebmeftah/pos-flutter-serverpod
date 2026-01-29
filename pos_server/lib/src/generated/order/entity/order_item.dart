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
import '../../order/order_item_status_enum.dart' as _i2;
import '../../order/pay_methode_enum.dart' as _i3;
import '../../article/entity/article.dart' as _i4;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i5;
import 'package:pos_server/src/generated/protocol.dart' as _i6;

abstract class OrderItem
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  OrderItem._({
    _i1.UuidValue? id,
    required this.article,
    _i2.OrderItemStatus? itemStatus,
    required this.passedById,
    this.passedBy,
    this.payedToId,
    this.payedTo,
    this.preparedById,
    this.preparedBy,
    this.orderId,
    DateTime? createdAt,
    this.updatedAt,
    this.preaparedAt,
    this.payedAt,
    _i3.PayMethode? payMethode,
  }) : id = id ?? _i1.Uuid().v4obj(),
       itemStatus = itemStatus ?? _i2.OrderItemStatus.progress,
       createdAt = createdAt ?? DateTime.now(),
       payMethode = payMethode ?? _i3.PayMethode.cash;

  factory OrderItem({
    _i1.UuidValue? id,
    required _i4.Article article,
    _i2.OrderItemStatus? itemStatus,
    required _i1.UuidValue passedById,
    _i5.UserProfile? passedBy,
    _i1.UuidValue? payedToId,
    _i5.UserProfile? payedTo,
    _i1.UuidValue? preparedById,
    _i5.UserProfile? preparedBy,
    _i1.UuidValue? orderId,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? preaparedAt,
    DateTime? payedAt,
    _i3.PayMethode? payMethode,
  }) = _OrderItemImpl;

  factory OrderItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return OrderItem(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      article: _i6.Protocol().deserialize<_i4.Article>(
        jsonSerialization['article'],
      ),
      itemStatus: jsonSerialization['itemStatus'] == null
          ? null
          : _i2.OrderItemStatus.fromJson(
              (jsonSerialization['itemStatus'] as String),
            ),
      passedById: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['passedById'],
      ),
      passedBy: jsonSerialization['passedBy'] == null
          ? null
          : _i6.Protocol().deserialize<_i5.UserProfile>(
              jsonSerialization['passedBy'],
            ),
      payedToId: jsonSerialization['payedToId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['payedToId']),
      payedTo: jsonSerialization['payedTo'] == null
          ? null
          : _i6.Protocol().deserialize<_i5.UserProfile>(
              jsonSerialization['payedTo'],
            ),
      preparedById: jsonSerialization['preparedById'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['preparedById'],
            ),
      preparedBy: jsonSerialization['preparedBy'] == null
          ? null
          : _i6.Protocol().deserialize<_i5.UserProfile>(
              jsonSerialization['preparedBy'],
            ),
      orderId: jsonSerialization['orderId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['orderId']),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      preaparedAt: jsonSerialization['preaparedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['preaparedAt'],
            ),
      payedAt: jsonSerialization['payedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['payedAt']),
      payMethode: jsonSerialization['payMethode'] == null
          ? null
          : _i3.PayMethode.fromJson(
              (jsonSerialization['payMethode'] as String),
            ),
    );
  }

  static final t = OrderItemTable();

  static const db = OrderItemRepository._();

  @override
  _i1.UuidValue id;

  _i4.Article article;

  _i2.OrderItemStatus itemStatus;

  _i1.UuidValue passedById;

  _i5.UserProfile? passedBy;

  _i1.UuidValue? payedToId;

  _i5.UserProfile? payedTo;

  _i1.UuidValue? preparedById;

  _i5.UserProfile? preparedBy;

  _i1.UuidValue? orderId;

  DateTime createdAt;

  DateTime? updatedAt;

  DateTime? preaparedAt;

  DateTime? payedAt;

  _i3.PayMethode payMethode;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [OrderItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  OrderItem copyWith({
    _i1.UuidValue? id,
    _i4.Article? article,
    _i2.OrderItemStatus? itemStatus,
    _i1.UuidValue? passedById,
    _i5.UserProfile? passedBy,
    _i1.UuidValue? payedToId,
    _i5.UserProfile? payedTo,
    _i1.UuidValue? preparedById,
    _i5.UserProfile? preparedBy,
    _i1.UuidValue? orderId,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? preaparedAt,
    DateTime? payedAt,
    _i3.PayMethode? payMethode,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'OrderItem',
      'id': id.toJson(),
      'article': article.toJson(),
      'itemStatus': itemStatus.toJson(),
      'passedById': passedById.toJson(),
      if (passedBy != null) 'passedBy': passedBy?.toJson(),
      if (payedToId != null) 'payedToId': payedToId?.toJson(),
      if (payedTo != null) 'payedTo': payedTo?.toJson(),
      if (preparedById != null) 'preparedById': preparedById?.toJson(),
      if (preparedBy != null) 'preparedBy': preparedBy?.toJson(),
      if (orderId != null) 'orderId': orderId?.toJson(),
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (preaparedAt != null) 'preaparedAt': preaparedAt?.toJson(),
      if (payedAt != null) 'payedAt': payedAt?.toJson(),
      'payMethode': payMethode.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'OrderItem',
      'id': id.toJson(),
      'article': article.toJsonForProtocol(),
      'itemStatus': itemStatus.toJson(),
      'passedById': passedById.toJson(),
      if (passedBy != null) 'passedBy': passedBy?.toJsonForProtocol(),
      if (payedToId != null) 'payedToId': payedToId?.toJson(),
      if (payedTo != null) 'payedTo': payedTo?.toJsonForProtocol(),
      if (preparedById != null) 'preparedById': preparedById?.toJson(),
      if (preparedBy != null) 'preparedBy': preparedBy?.toJsonForProtocol(),
      if (orderId != null) 'orderId': orderId?.toJson(),
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (preaparedAt != null) 'preaparedAt': preaparedAt?.toJson(),
      if (payedAt != null) 'payedAt': payedAt?.toJson(),
      'payMethode': payMethode.toJson(),
    };
  }

  static OrderItemInclude include({
    _i5.UserProfileInclude? passedBy,
    _i5.UserProfileInclude? payedTo,
    _i5.UserProfileInclude? preparedBy,
  }) {
    return OrderItemInclude._(
      passedBy: passedBy,
      payedTo: payedTo,
      preparedBy: preparedBy,
    );
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
    _i1.UuidValue? id,
    required _i4.Article article,
    _i2.OrderItemStatus? itemStatus,
    required _i1.UuidValue passedById,
    _i5.UserProfile? passedBy,
    _i1.UuidValue? payedToId,
    _i5.UserProfile? payedTo,
    _i1.UuidValue? preparedById,
    _i5.UserProfile? preparedBy,
    _i1.UuidValue? orderId,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? preaparedAt,
    DateTime? payedAt,
    _i3.PayMethode? payMethode,
  }) : super._(
         id: id,
         article: article,
         itemStatus: itemStatus,
         passedById: passedById,
         passedBy: passedBy,
         payedToId: payedToId,
         payedTo: payedTo,
         preparedById: preparedById,
         preparedBy: preparedBy,
         orderId: orderId,
         createdAt: createdAt,
         updatedAt: updatedAt,
         preaparedAt: preaparedAt,
         payedAt: payedAt,
         payMethode: payMethode,
       );

  /// Returns a shallow copy of this [OrderItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  OrderItem copyWith({
    _i1.UuidValue? id,
    _i4.Article? article,
    _i2.OrderItemStatus? itemStatus,
    _i1.UuidValue? passedById,
    Object? passedBy = _Undefined,
    Object? payedToId = _Undefined,
    Object? payedTo = _Undefined,
    Object? preparedById = _Undefined,
    Object? preparedBy = _Undefined,
    Object? orderId = _Undefined,
    DateTime? createdAt,
    Object? updatedAt = _Undefined,
    Object? preaparedAt = _Undefined,
    Object? payedAt = _Undefined,
    _i3.PayMethode? payMethode,
  }) {
    return OrderItem(
      id: id ?? this.id,
      article: article ?? this.article.copyWith(),
      itemStatus: itemStatus ?? this.itemStatus,
      passedById: passedById ?? this.passedById,
      passedBy: passedBy is _i5.UserProfile?
          ? passedBy
          : this.passedBy?.copyWith(),
      payedToId: payedToId is _i1.UuidValue? ? payedToId : this.payedToId,
      payedTo: payedTo is _i5.UserProfile? ? payedTo : this.payedTo?.copyWith(),
      preparedById: preparedById is _i1.UuidValue?
          ? preparedById
          : this.preparedById,
      preparedBy: preparedBy is _i5.UserProfile?
          ? preparedBy
          : this.preparedBy?.copyWith(),
      orderId: orderId is _i1.UuidValue? ? orderId : this.orderId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      preaparedAt: preaparedAt is DateTime? ? preaparedAt : this.preaparedAt,
      payedAt: payedAt is DateTime? ? payedAt : this.payedAt,
      payMethode: payMethode ?? this.payMethode,
    );
  }
}

class OrderItemUpdateTable extends _i1.UpdateTable<OrderItemTable> {
  OrderItemUpdateTable(super.table);

  _i1.ColumnValue<_i4.Article, _i4.Article> article(_i4.Article value) =>
      _i1.ColumnValue(
        table.article,
        value,
      );

  _i1.ColumnValue<_i2.OrderItemStatus, _i2.OrderItemStatus> itemStatus(
    _i2.OrderItemStatus value,
  ) => _i1.ColumnValue(
    table.itemStatus,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> passedById(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.passedById,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> payedToId(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.payedToId,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> preparedById(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.preparedById,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> orderId(_i1.UuidValue? value) =>
      _i1.ColumnValue(
        table.orderId,
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

  _i1.ColumnValue<DateTime, DateTime> preaparedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.preaparedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> payedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.payedAt,
        value,
      );

  _i1.ColumnValue<_i3.PayMethode, _i3.PayMethode> payMethode(
    _i3.PayMethode value,
  ) => _i1.ColumnValue(
    table.payMethode,
    value,
  );
}

class OrderItemTable extends _i1.Table<_i1.UuidValue> {
  OrderItemTable({super.tableRelation}) : super(tableName: 'order_items') {
    updateTable = OrderItemUpdateTable(this);
    article = _i1.ColumnSerializable<_i4.Article>(
      'article',
      this,
    );
    itemStatus = _i1.ColumnEnum(
      'itemStatus',
      this,
      _i1.EnumSerialization.byName,
      hasDefault: true,
    );
    passedById = _i1.ColumnUuid(
      'passedById',
      this,
    );
    payedToId = _i1.ColumnUuid(
      'payedToId',
      this,
    );
    preparedById = _i1.ColumnUuid(
      'preparedById',
      this,
    );
    orderId = _i1.ColumnUuid(
      'orderId',
      this,
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
    preaparedAt = _i1.ColumnDateTime(
      'preaparedAt',
      this,
    );
    payedAt = _i1.ColumnDateTime(
      'payedAt',
      this,
    );
    payMethode = _i1.ColumnEnum(
      'payMethode',
      this,
      _i1.EnumSerialization.byName,
      hasDefault: true,
    );
  }

  late final OrderItemUpdateTable updateTable;

  late final _i1.ColumnSerializable<_i4.Article> article;

  late final _i1.ColumnEnum<_i2.OrderItemStatus> itemStatus;

  late final _i1.ColumnUuid passedById;

  _i5.UserProfileTable? _passedBy;

  late final _i1.ColumnUuid payedToId;

  _i5.UserProfileTable? _payedTo;

  late final _i1.ColumnUuid preparedById;

  _i5.UserProfileTable? _preparedBy;

  late final _i1.ColumnUuid orderId;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnDateTime preaparedAt;

  late final _i1.ColumnDateTime payedAt;

  late final _i1.ColumnEnum<_i3.PayMethode> payMethode;

  _i5.UserProfileTable get passedBy {
    if (_passedBy != null) return _passedBy!;
    _passedBy = _i1.createRelationTable(
      relationFieldName: 'passedBy',
      field: OrderItem.t.passedById,
      foreignField: _i5.UserProfile.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.UserProfileTable(tableRelation: foreignTableRelation),
    );
    return _passedBy!;
  }

  _i5.UserProfileTable get payedTo {
    if (_payedTo != null) return _payedTo!;
    _payedTo = _i1.createRelationTable(
      relationFieldName: 'payedTo',
      field: OrderItem.t.payedToId,
      foreignField: _i5.UserProfile.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.UserProfileTable(tableRelation: foreignTableRelation),
    );
    return _payedTo!;
  }

  _i5.UserProfileTable get preparedBy {
    if (_preparedBy != null) return _preparedBy!;
    _preparedBy = _i1.createRelationTable(
      relationFieldName: 'preparedBy',
      field: OrderItem.t.preparedById,
      foreignField: _i5.UserProfile.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.UserProfileTable(tableRelation: foreignTableRelation),
    );
    return _preparedBy!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    article,
    itemStatus,
    passedById,
    payedToId,
    preparedById,
    orderId,
    createdAt,
    updatedAt,
    preaparedAt,
    payedAt,
    payMethode,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'passedBy') {
      return passedBy;
    }
    if (relationField == 'payedTo') {
      return payedTo;
    }
    if (relationField == 'preparedBy') {
      return preparedBy;
    }
    return null;
  }
}

class OrderItemInclude extends _i1.IncludeObject {
  OrderItemInclude._({
    _i5.UserProfileInclude? passedBy,
    _i5.UserProfileInclude? payedTo,
    _i5.UserProfileInclude? preparedBy,
  }) {
    _passedBy = passedBy;
    _payedTo = payedTo;
    _preparedBy = preparedBy;
  }

  _i5.UserProfileInclude? _passedBy;

  _i5.UserProfileInclude? _payedTo;

  _i5.UserProfileInclude? _preparedBy;

  @override
  Map<String, _i1.Include?> get includes => {
    'passedBy': _passedBy,
    'payedTo': _payedTo,
    'preparedBy': _preparedBy,
  };

  @override
  _i1.Table<_i1.UuidValue> get table => OrderItem.t;
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
  _i1.Table<_i1.UuidValue> get table => OrderItem.t;
}

class OrderItemRepository {
  const OrderItemRepository._();

  final attachRow = const OrderItemAttachRowRepository._();

  final detachRow = const OrderItemDetachRowRepository._();

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
    _i1.UuidValue id, {
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
    _i1.UuidValue id, {
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

  /// Creates a relation between the given [OrderItem] and [UserProfile]
  /// by setting the [OrderItem]'s foreign key `passedById` to refer to the [UserProfile].
  Future<void> passedBy(
    _i1.Session session,
    OrderItem orderItem,
    _i5.UserProfile passedBy, {
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

  /// Creates a relation between the given [OrderItem] and [UserProfile]
  /// by setting the [OrderItem]'s foreign key `payedToId` to refer to the [UserProfile].
  Future<void> payedTo(
    _i1.Session session,
    OrderItem orderItem,
    _i5.UserProfile payedTo, {
    _i1.Transaction? transaction,
  }) async {
    if (orderItem.id == null) {
      throw ArgumentError.notNull('orderItem.id');
    }
    if (payedTo.id == null) {
      throw ArgumentError.notNull('payedTo.id');
    }

    var $orderItem = orderItem.copyWith(payedToId: payedTo.id);
    await session.db.updateRow<OrderItem>(
      $orderItem,
      columns: [OrderItem.t.payedToId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [OrderItem] and [UserProfile]
  /// by setting the [OrderItem]'s foreign key `preparedById` to refer to the [UserProfile].
  Future<void> preparedBy(
    _i1.Session session,
    OrderItem orderItem,
    _i5.UserProfile preparedBy, {
    _i1.Transaction? transaction,
  }) async {
    if (orderItem.id == null) {
      throw ArgumentError.notNull('orderItem.id');
    }
    if (preparedBy.id == null) {
      throw ArgumentError.notNull('preparedBy.id');
    }

    var $orderItem = orderItem.copyWith(preparedById: preparedBy.id);
    await session.db.updateRow<OrderItem>(
      $orderItem,
      columns: [OrderItem.t.preparedById],
      transaction: transaction,
    );
  }
}

class OrderItemDetachRowRepository {
  const OrderItemDetachRowRepository._();

  /// Detaches the relation between this [OrderItem] and the [UserProfile] set in `payedTo`
  /// by setting the [OrderItem]'s foreign key `payedToId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> payedTo(
    _i1.Session session,
    OrderItem orderItem, {
    _i1.Transaction? transaction,
  }) async {
    if (orderItem.id == null) {
      throw ArgumentError.notNull('orderItem.id');
    }

    var $orderItem = orderItem.copyWith(payedToId: null);
    await session.db.updateRow<OrderItem>(
      $orderItem,
      columns: [OrderItem.t.payedToId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [OrderItem] and the [UserProfile] set in `preparedBy`
  /// by setting the [OrderItem]'s foreign key `preparedById` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> preparedBy(
    _i1.Session session,
    OrderItem orderItem, {
    _i1.Transaction? transaction,
  }) async {
    if (orderItem.id == null) {
      throw ArgumentError.notNull('orderItem.id');
    }

    var $orderItem = orderItem.copyWith(preparedById: null);
    await session.db.updateRow<OrderItem>(
      $orderItem,
      columns: [OrderItem.t.preparedById],
      transaction: transaction,
    );
  }
}
