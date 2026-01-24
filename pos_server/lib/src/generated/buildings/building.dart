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
import '../buildings/currency_enum.dart' as _i2;

abstract class Building
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  Building._({
    _i1.UuidValue? id,
    required this.name,
    required this.address,
    required this.openingTime,
    required this.closingTime,
    this.authUserId,
    required this.tableMultiOrder,
    required this.orderWithCashRegister,
    this.cashRegisterLimitPerDay,
    required this.allowAppendingItemsToOrder,
    required this.autoCloseOrdersAtClosingTime,
    required this.strictMode,
    required this.currencyCode,
    this.long,
    this.lat,
  }) : id = id ?? _i1.Uuid().v4obj();

  factory Building({
    _i1.UuidValue? id,
    required String name,
    required String address,
    required DateTime openingTime,
    required DateTime closingTime,
    _i1.UuidValue? authUserId,
    required bool tableMultiOrder,
    required bool orderWithCashRegister,
    int? cashRegisterLimitPerDay,
    required bool allowAppendingItemsToOrder,
    required bool autoCloseOrdersAtClosingTime,
    required bool strictMode,
    required _i2.Currency currencyCode,
    double? long,
    double? lat,
  }) = _BuildingImpl;

  factory Building.fromJson(Map<String, dynamic> jsonSerialization) {
    return Building(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
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
      tableMultiOrder: jsonSerialization['tableMultiOrder'] as bool,
      orderWithCashRegister: jsonSerialization['orderWithCashRegister'] as bool,
      cashRegisterLimitPerDay:
          jsonSerialization['cashRegisterLimitPerDay'] as int?,
      allowAppendingItemsToOrder:
          jsonSerialization['allowAppendingItemsToOrder'] as bool,
      autoCloseOrdersAtClosingTime:
          jsonSerialization['autoCloseOrdersAtClosingTime'] as bool,
      strictMode: jsonSerialization['strictMode'] as bool,
      currencyCode: _i2.Currency.fromJson(
        (jsonSerialization['currencyCode'] as String),
      ),
      long: (jsonSerialization['long'] as num?)?.toDouble(),
      lat: (jsonSerialization['lat'] as num?)?.toDouble(),
    );
  }

  static final t = BuildingTable();

  static const db = BuildingRepository._();

  @override
  _i1.UuidValue id;

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

  /// Indicates whether the building supports orders with cash registers.
  /// evrey order shoud be linked to cash register of day
  bool orderWithCashRegister;

  /// Maximum number of cash registers allowed per day.
  int? cashRegisterLimitPerDay;

  /// Indicates whether items can be appended to an existing order.
  bool allowAppendingItemsToOrder;

  /// auto close orders when closing time is reached
  bool autoCloseOrdersAtClosingTime;

  /// strict mode for order processing
  /// You can't make order or item as payed if they not passed by the need status (progress->picked->ready->served->payed)
  bool strictMode;

  /// currency code for the building (e.g., USD, EUR).
  _i2.Currency currencyCode;

  double? long;

  double? lat;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [Building]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Building copyWith({
    _i1.UuidValue? id,
    String? name,
    String? address,
    DateTime? openingTime,
    DateTime? closingTime,
    _i1.UuidValue? authUserId,
    bool? tableMultiOrder,
    bool? orderWithCashRegister,
    int? cashRegisterLimitPerDay,
    bool? allowAppendingItemsToOrder,
    bool? autoCloseOrdersAtClosingTime,
    bool? strictMode,
    _i2.Currency? currencyCode,
    double? long,
    double? lat,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Building',
      'id': id.toJson(),
      'name': name,
      'address': address,
      'openingTime': openingTime.toJson(),
      'closingTime': closingTime.toJson(),
      if (authUserId != null) 'authUserId': authUserId?.toJson(),
      'tableMultiOrder': tableMultiOrder,
      'orderWithCashRegister': orderWithCashRegister,
      if (cashRegisterLimitPerDay != null)
        'cashRegisterLimitPerDay': cashRegisterLimitPerDay,
      'allowAppendingItemsToOrder': allowAppendingItemsToOrder,
      'autoCloseOrdersAtClosingTime': autoCloseOrdersAtClosingTime,
      'strictMode': strictMode,
      'currencyCode': currencyCode.toJson(),
      if (long != null) 'long': long,
      if (lat != null) 'lat': lat,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Building',
      'id': id.toJson(),
      'name': name,
      'address': address,
      'openingTime': openingTime.toJson(),
      'closingTime': closingTime.toJson(),
      if (authUserId != null) 'authUserId': authUserId?.toJson(),
      'tableMultiOrder': tableMultiOrder,
      'orderWithCashRegister': orderWithCashRegister,
      if (cashRegisterLimitPerDay != null)
        'cashRegisterLimitPerDay': cashRegisterLimitPerDay,
      'allowAppendingItemsToOrder': allowAppendingItemsToOrder,
      'autoCloseOrdersAtClosingTime': autoCloseOrdersAtClosingTime,
      'strictMode': strictMode,
      'currencyCode': currencyCode.toJson(),
      if (long != null) 'long': long,
      if (lat != null) 'lat': lat,
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
    _i1.UuidValue? id,
    required String name,
    required String address,
    required DateTime openingTime,
    required DateTime closingTime,
    _i1.UuidValue? authUserId,
    required bool tableMultiOrder,
    required bool orderWithCashRegister,
    int? cashRegisterLimitPerDay,
    required bool allowAppendingItemsToOrder,
    required bool autoCloseOrdersAtClosingTime,
    required bool strictMode,
    required _i2.Currency currencyCode,
    double? long,
    double? lat,
  }) : super._(
         id: id,
         name: name,
         address: address,
         openingTime: openingTime,
         closingTime: closingTime,
         authUserId: authUserId,
         tableMultiOrder: tableMultiOrder,
         orderWithCashRegister: orderWithCashRegister,
         cashRegisterLimitPerDay: cashRegisterLimitPerDay,
         allowAppendingItemsToOrder: allowAppendingItemsToOrder,
         autoCloseOrdersAtClosingTime: autoCloseOrdersAtClosingTime,
         strictMode: strictMode,
         currencyCode: currencyCode,
         long: long,
         lat: lat,
       );

  /// Returns a shallow copy of this [Building]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Building copyWith({
    _i1.UuidValue? id,
    String? name,
    String? address,
    DateTime? openingTime,
    DateTime? closingTime,
    Object? authUserId = _Undefined,
    bool? tableMultiOrder,
    bool? orderWithCashRegister,
    Object? cashRegisterLimitPerDay = _Undefined,
    bool? allowAppendingItemsToOrder,
    bool? autoCloseOrdersAtClosingTime,
    bool? strictMode,
    _i2.Currency? currencyCode,
    Object? long = _Undefined,
    Object? lat = _Undefined,
  }) {
    return Building(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      openingTime: openingTime ?? this.openingTime,
      closingTime: closingTime ?? this.closingTime,
      authUserId: authUserId is _i1.UuidValue? ? authUserId : this.authUserId,
      tableMultiOrder: tableMultiOrder ?? this.tableMultiOrder,
      orderWithCashRegister:
          orderWithCashRegister ?? this.orderWithCashRegister,
      cashRegisterLimitPerDay: cashRegisterLimitPerDay is int?
          ? cashRegisterLimitPerDay
          : this.cashRegisterLimitPerDay,
      allowAppendingItemsToOrder:
          allowAppendingItemsToOrder ?? this.allowAppendingItemsToOrder,
      autoCloseOrdersAtClosingTime:
          autoCloseOrdersAtClosingTime ?? this.autoCloseOrdersAtClosingTime,
      strictMode: strictMode ?? this.strictMode,
      currencyCode: currencyCode ?? this.currencyCode,
      long: long is double? ? long : this.long,
      lat: lat is double? ? lat : this.lat,
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

  _i1.ColumnValue<bool, bool> orderWithCashRegister(bool value) =>
      _i1.ColumnValue(
        table.orderWithCashRegister,
        value,
      );

  _i1.ColumnValue<int, int> cashRegisterLimitPerDay(int? value) =>
      _i1.ColumnValue(
        table.cashRegisterLimitPerDay,
        value,
      );

  _i1.ColumnValue<bool, bool> allowAppendingItemsToOrder(bool value) =>
      _i1.ColumnValue(
        table.allowAppendingItemsToOrder,
        value,
      );

  _i1.ColumnValue<bool, bool> autoCloseOrdersAtClosingTime(bool value) =>
      _i1.ColumnValue(
        table.autoCloseOrdersAtClosingTime,
        value,
      );

  _i1.ColumnValue<bool, bool> strictMode(bool value) => _i1.ColumnValue(
    table.strictMode,
    value,
  );

  _i1.ColumnValue<_i2.Currency, _i2.Currency> currencyCode(
    _i2.Currency value,
  ) => _i1.ColumnValue(
    table.currencyCode,
    value,
  );

  _i1.ColumnValue<double, double> long(double? value) => _i1.ColumnValue(
    table.long,
    value,
  );

  _i1.ColumnValue<double, double> lat(double? value) => _i1.ColumnValue(
    table.lat,
    value,
  );
}

class BuildingTable extends _i1.Table<_i1.UuidValue> {
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
    );
    orderWithCashRegister = _i1.ColumnBool(
      'orderWithCashRegister',
      this,
    );
    cashRegisterLimitPerDay = _i1.ColumnInt(
      'cashRegisterLimitPerDay',
      this,
    );
    allowAppendingItemsToOrder = _i1.ColumnBool(
      'allowAppendingItemsToOrder',
      this,
    );
    autoCloseOrdersAtClosingTime = _i1.ColumnBool(
      'autoCloseOrdersAtClosingTime',
      this,
    );
    strictMode = _i1.ColumnBool(
      'strictMode',
      this,
    );
    currencyCode = _i1.ColumnEnum(
      'currencyCode',
      this,
      _i1.EnumSerialization.byName,
    );
    long = _i1.ColumnDouble(
      'long',
      this,
    );
    lat = _i1.ColumnDouble(
      'lat',
      this,
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

  /// Indicates whether the building supports orders with cash registers.
  /// evrey order shoud be linked to cash register of day
  late final _i1.ColumnBool orderWithCashRegister;

  /// Maximum number of cash registers allowed per day.
  late final _i1.ColumnInt cashRegisterLimitPerDay;

  /// Indicates whether items can be appended to an existing order.
  late final _i1.ColumnBool allowAppendingItemsToOrder;

  /// auto close orders when closing time is reached
  late final _i1.ColumnBool autoCloseOrdersAtClosingTime;

  /// strict mode for order processing
  /// You can't make order or item as payed if they not passed by the need status (progress->picked->ready->served->payed)
  late final _i1.ColumnBool strictMode;

  /// currency code for the building (e.g., USD, EUR).
  late final _i1.ColumnEnum<_i2.Currency> currencyCode;

  late final _i1.ColumnDouble long;

  late final _i1.ColumnDouble lat;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    address,
    openingTime,
    closingTime,
    authUserId,
    tableMultiOrder,
    orderWithCashRegister,
    cashRegisterLimitPerDay,
    allowAppendingItemsToOrder,
    autoCloseOrdersAtClosingTime,
    strictMode,
    currencyCode,
    long,
    lat,
  ];
}

class BuildingInclude extends _i1.IncludeObject {
  BuildingInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue> get table => Building.t;
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
  _i1.Table<_i1.UuidValue> get table => Building.t;
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
    _i1.UuidValue id, {
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
    _i1.UuidValue id, {
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
