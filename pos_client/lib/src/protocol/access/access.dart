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

abstract class Access implements _i1.SerializableModel {
  Access._({
    this.id,
    required this.name,
    required this.orderCreation,
    bool? orderCreationNotif,
    required this.orderPayment,
    required this.orderItemsPayment,
    required this.buildingId,
  }) : orderCreationNotif = orderCreationNotif ?? true;

  factory Access({
    int? id,
    required String name,
    required bool orderCreation,
    bool? orderCreationNotif,
    required bool orderPayment,
    required bool orderItemsPayment,
    required int? buildingId,
  }) = _AccessImpl;

  factory Access.fromJson(Map<String, dynamic> jsonSerialization) {
    return Access(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      orderCreation: jsonSerialization['orderCreation'] as bool,
      orderCreationNotif: jsonSerialization['orderCreationNotif'] as bool?,
      orderPayment: jsonSerialization['orderPayment'] as bool,
      orderItemsPayment: jsonSerialization['orderItemsPayment'] as bool,
      buildingId: jsonSerialization['buildingId'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  bool orderCreation;

  bool orderCreationNotif;

  bool orderPayment;

  bool orderItemsPayment;

  int? buildingId;

  /// Returns a shallow copy of this [Access]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Access copyWith({
    int? id,
    String? name,
    bool? orderCreation,
    bool? orderCreationNotif,
    bool? orderPayment,
    bool? orderItemsPayment,
    int? buildingId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Access',
      if (id != null) 'id': id,
      'name': name,
      'orderCreation': orderCreation,
      'orderCreationNotif': orderCreationNotif,
      'orderPayment': orderPayment,
      'orderItemsPayment': orderItemsPayment,
      if (buildingId != null) 'buildingId': buildingId,
    };
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
    required bool orderCreation,
    bool? orderCreationNotif,
    required bool orderPayment,
    required bool orderItemsPayment,
    required int? buildingId,
  }) : super._(
         id: id,
         name: name,
         orderCreation: orderCreation,
         orderCreationNotif: orderCreationNotif,
         orderPayment: orderPayment,
         orderItemsPayment: orderItemsPayment,
         buildingId: buildingId,
       );

  /// Returns a shallow copy of this [Access]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Access copyWith({
    Object? id = _Undefined,
    String? name,
    bool? orderCreation,
    bool? orderCreationNotif,
    bool? orderPayment,
    bool? orderItemsPayment,
    Object? buildingId = _Undefined,
  }) {
    return Access(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      orderCreation: orderCreation ?? this.orderCreation,
      orderCreationNotif: orderCreationNotif ?? this.orderCreationNotif,
      orderPayment: orderPayment ?? this.orderPayment,
      orderItemsPayment: orderItemsPayment ?? this.orderItemsPayment,
      buildingId: buildingId is int? ? buildingId : this.buildingId,
    );
  }
}
