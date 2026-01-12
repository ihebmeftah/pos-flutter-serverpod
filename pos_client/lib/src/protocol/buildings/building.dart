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

abstract class Building implements _i1.SerializableModel {
  Building._({
    this.id,
    required this.name,
    required this.address,
    required this.openingTime,
    required this.closingTime,
    bool? tableMultiOrder,
    bool? allowAppendingItemsToOrder,
  }) : tableMultiOrder = tableMultiOrder ?? false,
       allowAppendingItemsToOrder = allowAppendingItemsToOrder ?? true;

  factory Building({
    int? id,
    required String name,
    required String address,
    required DateTime openingTime,
    required DateTime closingTime,
    bool? tableMultiOrder,
    bool? allowAppendingItemsToOrder,
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
      tableMultiOrder: jsonSerialization['tableMultiOrder'] as bool?,
      allowAppendingItemsToOrder:
          jsonSerialization['allowAppendingItemsToOrder'] as bool?,
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

  /// Indicates whether the building supports multiple orders per table.
  bool tableMultiOrder;

  /// Indicates whether items can be appended to an existing order.
  bool allowAppendingItemsToOrder;

  /// Returns a shallow copy of this [Building]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Building copyWith({
    int? id,
    String? name,
    String? address,
    DateTime? openingTime,
    DateTime? closingTime,
    bool? tableMultiOrder,
    bool? allowAppendingItemsToOrder,
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
      'tableMultiOrder': tableMultiOrder,
      'allowAppendingItemsToOrder': allowAppendingItemsToOrder,
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
    bool? tableMultiOrder,
    bool? allowAppendingItemsToOrder,
  }) : super._(
         id: id,
         name: name,
         address: address,
         openingTime: openingTime,
         closingTime: closingTime,
         tableMultiOrder: tableMultiOrder,
         allowAppendingItemsToOrder: allowAppendingItemsToOrder,
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
    bool? tableMultiOrder,
    bool? allowAppendingItemsToOrder,
  }) {
    return Building(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      openingTime: openingTime ?? this.openingTime,
      closingTime: closingTime ?? this.closingTime,
      tableMultiOrder: tableMultiOrder ?? this.tableMultiOrder,
      allowAppendingItemsToOrder:
          allowAppendingItemsToOrder ?? this.allowAppendingItemsToOrder,
    );
  }
}
