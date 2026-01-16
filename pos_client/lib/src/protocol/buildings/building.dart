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
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../buildings/currency_enum.dart' as _i2;

abstract class Building implements _i1.SerializableModel {
  Building._({
    this.id,
    required this.name,
    required this.address,
    required this.openingTime,
    required this.closingTime,
    required this.authUserId,
    bool? tableMultiOrder,
    bool? allowAppendingItemsToOrder,
    bool? autoCloseOrdersAtClosingTime,
    required this.currencyCode,
    this.long,
    this.lat,
  }) : tableMultiOrder = tableMultiOrder ?? false,
       allowAppendingItemsToOrder = allowAppendingItemsToOrder ?? true,
       autoCloseOrdersAtClosingTime = autoCloseOrdersAtClosingTime ?? false;

  factory Building({
    int? id,
    required String name,
    required String address,
    required DateTime openingTime,
    required DateTime closingTime,
    required _i1.UuidValue? authUserId,
    bool? tableMultiOrder,
    bool? allowAppendingItemsToOrder,
    bool? autoCloseOrdersAtClosingTime,
    required _i2.Currency currencyCode,
    double? long,
    double? lat,
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
      allowAppendingItemsToOrder:
          jsonSerialization['allowAppendingItemsToOrder'] as bool?,
      autoCloseOrdersAtClosingTime:
          jsonSerialization['autoCloseOrdersAtClosingTime'] as bool?,
      currencyCode: _i2.Currency.fromJson(
        (jsonSerialization['currencyCode'] as String),
      ),
      long: (jsonSerialization['long'] as num?)?.toDouble(),
      lat: (jsonSerialization['lat'] as num?)?.toDouble(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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

  /// Indicates whether items can be appended to an existing order.
  bool allowAppendingItemsToOrder;

  /// auto close orders when closing time is reached
  bool autoCloseOrdersAtClosingTime;

  /// currency code for the building (e.g., USD, EUR).
  _i2.Currency currencyCode;

  double? long;

  double? lat;

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
    bool? allowAppendingItemsToOrder,
    bool? autoCloseOrdersAtClosingTime,
    _i2.Currency? currencyCode,
    double? long,
    double? lat,
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
      'allowAppendingItemsToOrder': allowAppendingItemsToOrder,
      'autoCloseOrdersAtClosingTime': autoCloseOrdersAtClosingTime,
      'currencyCode': currencyCode.toJson(),
      if (long != null) 'long': long,
      if (lat != null) 'lat': lat,
    };
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
    bool? allowAppendingItemsToOrder,
    bool? autoCloseOrdersAtClosingTime,
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
         allowAppendingItemsToOrder: allowAppendingItemsToOrder,
         autoCloseOrdersAtClosingTime: autoCloseOrdersAtClosingTime,
         currencyCode: currencyCode,
         long: long,
         lat: lat,
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
    bool? allowAppendingItemsToOrder,
    bool? autoCloseOrdersAtClosingTime,
    _i2.Currency? currencyCode,
    Object? long = _Undefined,
    Object? lat = _Undefined,
  }) {
    return Building(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      openingTime: openingTime ?? this.openingTime,
      closingTime: closingTime ?? this.closingTime,
      authUserId: authUserId is _i1.UuidValue? ? authUserId : this.authUserId,
      tableMultiOrder: tableMultiOrder ?? this.tableMultiOrder,
      allowAppendingItemsToOrder:
          allowAppendingItemsToOrder ?? this.allowAppendingItemsToOrder,
      autoCloseOrdersAtClosingTime:
          autoCloseOrdersAtClosingTime ?? this.autoCloseOrdersAtClosingTime,
      currencyCode: currencyCode ?? this.currencyCode,
      long: long is double? ? long : this.long,
      lat: lat is double? ? lat : this.lat,
    );
  }
}
