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
    _i1.UuidValue? id,
    required this.name,
    required this.consultAllOrders,
    required this.orderCreation,
    required this.orderCreationNotif,
    required this.orderPayment,
    required this.orderItemsPayment,
    required this.appendItems,
    required this.preparation,
    required this.takeOrder,
    required this.caisseManagement,
    required this.buildingId,
  }) : id = id ?? _i1.Uuid().v4obj();

  factory Access({
    _i1.UuidValue? id,
    required String name,
    required bool consultAllOrders,
    required bool orderCreation,
    required bool orderCreationNotif,
    required bool orderPayment,
    required bool orderItemsPayment,
    required bool appendItems,
    required bool preparation,
    required bool takeOrder,
    required bool caisseManagement,
    required _i1.UuidValue buildingId,
  }) = _AccessImpl;

  factory Access.fromJson(Map<String, dynamic> jsonSerialization) {
    return Access(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      name: jsonSerialization['name'] as String,
      consultAllOrders: jsonSerialization['consultAllOrders'] as bool,
      orderCreation: jsonSerialization['orderCreation'] as bool,
      orderCreationNotif: jsonSerialization['orderCreationNotif'] as bool,
      orderPayment: jsonSerialization['orderPayment'] as bool,
      orderItemsPayment: jsonSerialization['orderItemsPayment'] as bool,
      appendItems: jsonSerialization['appendItems'] as bool,
      preparation: jsonSerialization['preparation'] as bool,
      takeOrder: jsonSerialization['takeOrder'] as bool,
      caisseManagement: jsonSerialization['caisseManagement'] as bool,
      buildingId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['buildingId'],
      ),
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  String name;

  bool consultAllOrders;

  bool orderCreation;

  bool orderCreationNotif;

  bool orderPayment;

  bool orderItemsPayment;

  bool appendItems;

  bool preparation;

  bool takeOrder;

  bool caisseManagement;

  _i1.UuidValue buildingId;

  /// Returns a shallow copy of this [Access]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Access copyWith({
    _i1.UuidValue? id,
    String? name,
    bool? consultAllOrders,
    bool? orderCreation,
    bool? orderCreationNotif,
    bool? orderPayment,
    bool? orderItemsPayment,
    bool? appendItems,
    bool? preparation,
    bool? takeOrder,
    bool? caisseManagement,
    _i1.UuidValue? buildingId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Access',
      'id': id.toJson(),
      'name': name,
      'consultAllOrders': consultAllOrders,
      'orderCreation': orderCreation,
      'orderCreationNotif': orderCreationNotif,
      'orderPayment': orderPayment,
      'orderItemsPayment': orderItemsPayment,
      'appendItems': appendItems,
      'preparation': preparation,
      'takeOrder': takeOrder,
      'caisseManagement': caisseManagement,
      'buildingId': buildingId.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _AccessImpl extends Access {
  _AccessImpl({
    _i1.UuidValue? id,
    required String name,
    required bool consultAllOrders,
    required bool orderCreation,
    required bool orderCreationNotif,
    required bool orderPayment,
    required bool orderItemsPayment,
    required bool appendItems,
    required bool preparation,
    required bool takeOrder,
    required bool caisseManagement,
    required _i1.UuidValue buildingId,
  }) : super._(
         id: id,
         name: name,
         consultAllOrders: consultAllOrders,
         orderCreation: orderCreation,
         orderCreationNotif: orderCreationNotif,
         orderPayment: orderPayment,
         orderItemsPayment: orderItemsPayment,
         appendItems: appendItems,
         preparation: preparation,
         takeOrder: takeOrder,
         caisseManagement: caisseManagement,
         buildingId: buildingId,
       );

  /// Returns a shallow copy of this [Access]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Access copyWith({
    _i1.UuidValue? id,
    String? name,
    bool? consultAllOrders,
    bool? orderCreation,
    bool? orderCreationNotif,
    bool? orderPayment,
    bool? orderItemsPayment,
    bool? appendItems,
    bool? preparation,
    bool? takeOrder,
    bool? caisseManagement,
    _i1.UuidValue? buildingId,
  }) {
    return Access(
      id: id ?? this.id,
      name: name ?? this.name,
      consultAllOrders: consultAllOrders ?? this.consultAllOrders,
      orderCreation: orderCreation ?? this.orderCreation,
      orderCreationNotif: orderCreationNotif ?? this.orderCreationNotif,
      orderPayment: orderPayment ?? this.orderPayment,
      orderItemsPayment: orderItemsPayment ?? this.orderItemsPayment,
      appendItems: appendItems ?? this.appendItems,
      preparation: preparation ?? this.preparation,
      takeOrder: takeOrder ?? this.takeOrder,
      caisseManagement: caisseManagement ?? this.caisseManagement,
      buildingId: buildingId ?? this.buildingId,
    );
  }
}
