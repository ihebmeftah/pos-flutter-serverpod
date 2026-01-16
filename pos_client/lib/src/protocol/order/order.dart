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
import '../order/order_status_enum.dart' as _i2;
import '../buildings_tables/building_tables.dart' as _i3;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i4;
import '../order/order_item.dart' as _i5;
import 'package:pos_client/src/protocol/protocol.dart' as _i6;

abstract class Order implements _i1.SerializableModel {
  Order._({
    this.id,
    _i2.OrderStatus? status,
    required this.btableId,
    required this.btable,
    required this.passedById,
    this.passedBy,
    this.closedbyId,
    this.closedby,
    this.items,
    DateTime? createdAt,
    this.updatedAt,
  }) : status = status ?? _i2.OrderStatus.progress,
       createdAt = createdAt ?? DateTime.now();

  factory Order({
    int? id,
    _i2.OrderStatus? status,
    required int btableId,
    required _i3.BTable? btable,
    required _i1.UuidValue passedById,
    _i4.UserProfile? passedBy,
    _i1.UuidValue? closedbyId,
    _i4.UserProfile? closedby,
    List<_i5.OrderItem>? items,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _OrderImpl;

  factory Order.fromJson(Map<String, dynamic> jsonSerialization) {
    return Order(
      id: jsonSerialization['id'] as int?,
      status: jsonSerialization['status'] == null
          ? null
          : _i2.OrderStatus.fromJson((jsonSerialization['status'] as String)),
      btableId: jsonSerialization['btableId'] as int,
      btable: jsonSerialization['btable'] == null
          ? null
          : _i6.Protocol().deserialize<_i3.BTable>(jsonSerialization['btable']),
      passedById: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['passedById'],
      ),
      passedBy: jsonSerialization['passedBy'] == null
          ? null
          : _i6.Protocol().deserialize<_i4.UserProfile>(
              jsonSerialization['passedBy'],
            ),
      closedbyId: jsonSerialization['closedbyId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['closedbyId'],
            ),
      closedby: jsonSerialization['closedby'] == null
          ? null
          : _i6.Protocol().deserialize<_i4.UserProfile>(
              jsonSerialization['closedby'],
            ),
      items: jsonSerialization['items'] == null
          ? null
          : _i6.Protocol().deserialize<List<_i5.OrderItem>>(
              jsonSerialization['items'],
            ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i2.OrderStatus status;

  int btableId;

  _i3.BTable? btable;

  _i1.UuidValue passedById;

  _i4.UserProfile? passedBy;

  _i1.UuidValue? closedbyId;

  _i4.UserProfile? closedby;

  List<_i5.OrderItem>? items;

  DateTime createdAt;

  DateTime? updatedAt;

  /// Returns a shallow copy of this [Order]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Order copyWith({
    int? id,
    _i2.OrderStatus? status,
    int? btableId,
    _i3.BTable? btable,
    _i1.UuidValue? passedById,
    _i4.UserProfile? passedBy,
    _i1.UuidValue? closedbyId,
    _i4.UserProfile? closedby,
    List<_i5.OrderItem>? items,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Order',
      if (id != null) 'id': id,
      'status': status.toJson(),
      'btableId': btableId,
      if (btable != null) 'btable': btable?.toJson(),
      'passedById': passedById.toJson(),
      if (passedBy != null) 'passedBy': passedBy?.toJson(),
      if (closedbyId != null) 'closedbyId': closedbyId?.toJson(),
      if (closedby != null) 'closedby': closedby?.toJson(),
      if (items != null) 'items': items?.toJson(valueToJson: (v) => v.toJson()),
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
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
    required int btableId,
    required _i3.BTable? btable,
    required _i1.UuidValue passedById,
    _i4.UserProfile? passedBy,
    _i1.UuidValue? closedbyId,
    _i4.UserProfile? closedby,
    List<_i5.OrderItem>? items,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         status: status,
         btableId: btableId,
         btable: btable,
         passedById: passedById,
         passedBy: passedBy,
         closedbyId: closedbyId,
         closedby: closedby,
         items: items,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Order]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Order copyWith({
    Object? id = _Undefined,
    _i2.OrderStatus? status,
    int? btableId,
    Object? btable = _Undefined,
    _i1.UuidValue? passedById,
    Object? passedBy = _Undefined,
    Object? closedbyId = _Undefined,
    Object? closedby = _Undefined,
    Object? items = _Undefined,
    DateTime? createdAt,
    Object? updatedAt = _Undefined,
  }) {
    return Order(
      id: id is int? ? id : this.id,
      status: status ?? this.status,
      btableId: btableId ?? this.btableId,
      btable: btable is _i3.BTable? ? btable : this.btable?.copyWith(),
      passedById: passedById ?? this.passedById,
      passedBy: passedBy is _i4.UserProfile?
          ? passedBy
          : this.passedBy?.copyWith(),
      closedbyId: closedbyId is _i1.UuidValue? ? closedbyId : this.closedbyId,
      closedby: closedby is _i4.UserProfile?
          ? closedby
          : this.closedby?.copyWith(),
      items: items is List<_i5.OrderItem>?
          ? items
          : this.items?.map((e0) => e0.copyWith()).toList(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
    );
  }
}
