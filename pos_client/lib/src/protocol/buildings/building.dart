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
    _i1.UuidValue? id,
    required this.name,
    required this.address,
    required this.openingTime,
    required this.closingTime,
    required this.authUserId,
    bool? tableMultiOrder,
    bool? allowAppendingItemsToOrder,
    bool? autoCloseOrdersAtClosingTime,
    bool? strictMode,
    required this.currencyCode,
    this.long,
    this.lat,
  }) : id = id ?? _i1.Uuid().v4obj(),
       tableMultiOrder = tableMultiOrder ?? false,
       allowAppendingItemsToOrder = allowAppendingItemsToOrder ?? true,
       autoCloseOrdersAtClosingTime = autoCloseOrdersAtClosingTime ?? false,
       strictMode = strictMode ?? false;

  factory Building({
    _i1.UuidValue? id,
    required String name,
    required String address,
    required DateTime openingTime,
    required DateTime closingTime,
    required _i1.UuidValue? authUserId,
    bool? tableMultiOrder,
    bool? allowAppendingItemsToOrder,
    bool? autoCloseOrdersAtClosingTime,
    bool? strictMode,
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
      tableMultiOrder: jsonSerialization['tableMultiOrder'] as bool?,
      allowAppendingItemsToOrder:
          jsonSerialization['allowAppendingItemsToOrder'] as bool?,
      autoCloseOrdersAtClosingTime:
          jsonSerialization['autoCloseOrdersAtClosingTime'] as bool?,
      strictMode: jsonSerialization['strictMode'] as bool?,
      currencyCode: _i2.Currency.fromJson(
        (jsonSerialization['currencyCode'] as String),
      ),
      long: (jsonSerialization['long'] as num?)?.toDouble(),
      lat: (jsonSerialization['lat'] as num?)?.toDouble(),
    );
  }

  /// The id of the object.
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
      'allowAppendingItemsToOrder': allowAppendingItemsToOrder,
      'autoCloseOrdersAtClosingTime': autoCloseOrdersAtClosingTime,
      'strictMode': strictMode,
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
    _i1.UuidValue? id,
    required String name,
    required String address,
    required DateTime openingTime,
    required DateTime closingTime,
    required _i1.UuidValue? authUserId,
    bool? tableMultiOrder,
    bool? allowAppendingItemsToOrder,
    bool? autoCloseOrdersAtClosingTime,
    bool? strictMode,
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
