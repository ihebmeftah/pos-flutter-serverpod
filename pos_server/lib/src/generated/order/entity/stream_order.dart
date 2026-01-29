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
import '../../order/entity/stream_actions_order.dart' as _i2;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i3;
import 'package:pos_server/src/generated/protocol.dart' as _i4;

abstract class StreamOrder
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  StreamOrder._({
    required this.action,
    required this.message,
    required this.orderId,
    required this.tableId,
    required this.itemsids,
    this.orderCreatedBy,
    required this.itemsCreatedBy,
  });

  factory StreamOrder({
    required _i2.StreamActionsOrder action,
    required String message,
    required _i1.UuidValue orderId,
    required _i1.UuidValue tableId,
    required List<_i1.UuidValue> itemsids,
    _i3.UserProfile? orderCreatedBy,
    required List<_i3.UserProfile?> itemsCreatedBy,
  }) = _StreamOrderImpl;

  factory StreamOrder.fromJson(Map<String, dynamic> jsonSerialization) {
    return StreamOrder(
      action: _i2.StreamActionsOrder.fromJson(
        (jsonSerialization['action'] as String),
      ),
      message: jsonSerialization['message'] as String,
      orderId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['orderId'],
      ),
      tableId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['tableId'],
      ),
      itemsids: _i4.Protocol().deserialize<List<_i1.UuidValue>>(
        jsonSerialization['itemsids'],
      ),
      orderCreatedBy: jsonSerialization['orderCreatedBy'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.UserProfile>(
              jsonSerialization['orderCreatedBy'],
            ),
      itemsCreatedBy: _i4.Protocol().deserialize<List<_i3.UserProfile?>>(
        jsonSerialization['itemsCreatedBy'],
      ),
    );
  }

  _i2.StreamActionsOrder action;

  String message;

  _i1.UuidValue orderId;

  _i1.UuidValue tableId;

  List<_i1.UuidValue> itemsids;

  _i3.UserProfile? orderCreatedBy;

  List<_i3.UserProfile?> itemsCreatedBy;

  /// Returns a shallow copy of this [StreamOrder]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StreamOrder copyWith({
    _i2.StreamActionsOrder? action,
    String? message,
    _i1.UuidValue? orderId,
    _i1.UuidValue? tableId,
    List<_i1.UuidValue>? itemsids,
    _i3.UserProfile? orderCreatedBy,
    List<_i3.UserProfile?>? itemsCreatedBy,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StreamOrder',
      'action': action.toJson(),
      'message': message,
      'orderId': orderId.toJson(),
      'tableId': tableId.toJson(),
      'itemsids': itemsids.toJson(valueToJson: (v) => v.toJson()),
      if (orderCreatedBy != null) 'orderCreatedBy': orderCreatedBy?.toJson(),
      'itemsCreatedBy': itemsCreatedBy.toJson(valueToJson: (v) => v?.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StreamOrder',
      'action': action.toJson(),
      'message': message,
      'orderId': orderId.toJson(),
      'tableId': tableId.toJson(),
      'itemsids': itemsids.toJson(valueToJson: (v) => v.toJson()),
      if (orderCreatedBy != null)
        'orderCreatedBy': orderCreatedBy?.toJsonForProtocol(),
      'itemsCreatedBy': itemsCreatedBy.toJson(
        valueToJson: (v) => v?.toJsonForProtocol(),
      ),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StreamOrderImpl extends StreamOrder {
  _StreamOrderImpl({
    required _i2.StreamActionsOrder action,
    required String message,
    required _i1.UuidValue orderId,
    required _i1.UuidValue tableId,
    required List<_i1.UuidValue> itemsids,
    _i3.UserProfile? orderCreatedBy,
    required List<_i3.UserProfile?> itemsCreatedBy,
  }) : super._(
         action: action,
         message: message,
         orderId: orderId,
         tableId: tableId,
         itemsids: itemsids,
         orderCreatedBy: orderCreatedBy,
         itemsCreatedBy: itemsCreatedBy,
       );

  /// Returns a shallow copy of this [StreamOrder]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StreamOrder copyWith({
    _i2.StreamActionsOrder? action,
    String? message,
    _i1.UuidValue? orderId,
    _i1.UuidValue? tableId,
    List<_i1.UuidValue>? itemsids,
    Object? orderCreatedBy = _Undefined,
    List<_i3.UserProfile?>? itemsCreatedBy,
  }) {
    return StreamOrder(
      action: action ?? this.action,
      message: message ?? this.message,
      orderId: orderId ?? this.orderId,
      tableId: tableId ?? this.tableId,
      itemsids: itemsids ?? this.itemsids.map((e0) => e0).toList(),
      orderCreatedBy: orderCreatedBy is _i3.UserProfile?
          ? orderCreatedBy
          : this.orderCreatedBy?.copyWith(),
      itemsCreatedBy:
          itemsCreatedBy ??
          this.itemsCreatedBy.map((e0) => e0?.copyWith()).toList(),
    );
  }
}
