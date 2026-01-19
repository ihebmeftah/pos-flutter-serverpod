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
import '../order/order_item_status_enum.dart' as _i2;
import '../article/entity/article.dart' as _i3;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i4;
import 'package:pos_client/src/protocol/protocol.dart' as _i5;

abstract class OrderItem implements _i1.SerializableModel {
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
    DateTime? createdAt,
    this.updatedAt,
    this.preaparedAt,
    this.payedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       itemStatus = itemStatus ?? _i2.OrderItemStatus.progress,
       createdAt = createdAt ?? DateTime.now();

  factory OrderItem({
    _i1.UuidValue? id,
    required _i3.Article article,
    _i2.OrderItemStatus? itemStatus,
    required _i1.UuidValue passedById,
    _i4.UserProfile? passedBy,
    _i1.UuidValue? payedToId,
    _i4.UserProfile? payedTo,
    _i1.UuidValue? preparedById,
    _i4.UserProfile? preparedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? preaparedAt,
    DateTime? payedAt,
  }) = _OrderItemImpl;

  factory OrderItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return OrderItem(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      article: _i5.Protocol().deserialize<_i3.Article>(
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
          : _i5.Protocol().deserialize<_i4.UserProfile>(
              jsonSerialization['passedBy'],
            ),
      payedToId: jsonSerialization['payedToId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['payedToId']),
      payedTo: jsonSerialization['payedTo'] == null
          ? null
          : _i5.Protocol().deserialize<_i4.UserProfile>(
              jsonSerialization['payedTo'],
            ),
      preparedById: jsonSerialization['preparedById'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['preparedById'],
            ),
      preparedBy: jsonSerialization['preparedBy'] == null
          ? null
          : _i5.Protocol().deserialize<_i4.UserProfile>(
              jsonSerialization['preparedBy'],
            ),
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
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  _i3.Article article;

  _i2.OrderItemStatus itemStatus;

  _i1.UuidValue passedById;

  _i4.UserProfile? passedBy;

  _i1.UuidValue? payedToId;

  _i4.UserProfile? payedTo;

  _i1.UuidValue? preparedById;

  _i4.UserProfile? preparedBy;

  DateTime createdAt;

  DateTime? updatedAt;

  DateTime? preaparedAt;

  DateTime? payedAt;

  /// Returns a shallow copy of this [OrderItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  OrderItem copyWith({
    _i1.UuidValue? id,
    _i3.Article? article,
    _i2.OrderItemStatus? itemStatus,
    _i1.UuidValue? passedById,
    _i4.UserProfile? passedBy,
    _i1.UuidValue? payedToId,
    _i4.UserProfile? payedTo,
    _i1.UuidValue? preparedById,
    _i4.UserProfile? preparedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? preaparedAt,
    DateTime? payedAt,
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
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (preaparedAt != null) 'preaparedAt': preaparedAt?.toJson(),
      if (payedAt != null) 'payedAt': payedAt?.toJson(),
    };
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
    required _i3.Article article,
    _i2.OrderItemStatus? itemStatus,
    required _i1.UuidValue passedById,
    _i4.UserProfile? passedBy,
    _i1.UuidValue? payedToId,
    _i4.UserProfile? payedTo,
    _i1.UuidValue? preparedById,
    _i4.UserProfile? preparedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? preaparedAt,
    DateTime? payedAt,
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
         createdAt: createdAt,
         updatedAt: updatedAt,
         preaparedAt: preaparedAt,
         payedAt: payedAt,
       );

  /// Returns a shallow copy of this [OrderItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  OrderItem copyWith({
    _i1.UuidValue? id,
    _i3.Article? article,
    _i2.OrderItemStatus? itemStatus,
    _i1.UuidValue? passedById,
    Object? passedBy = _Undefined,
    Object? payedToId = _Undefined,
    Object? payedTo = _Undefined,
    Object? preparedById = _Undefined,
    Object? preparedBy = _Undefined,
    DateTime? createdAt,
    Object? updatedAt = _Undefined,
    Object? preaparedAt = _Undefined,
    Object? payedAt = _Undefined,
  }) {
    return OrderItem(
      id: id ?? this.id,
      article: article ?? this.article.copyWith(),
      itemStatus: itemStatus ?? this.itemStatus,
      passedById: passedById ?? this.passedById,
      passedBy: passedBy is _i4.UserProfile?
          ? passedBy
          : this.passedBy?.copyWith(),
      payedToId: payedToId is _i1.UuidValue? ? payedToId : this.payedToId,
      payedTo: payedTo is _i4.UserProfile? ? payedTo : this.payedTo?.copyWith(),
      preparedById: preparedById is _i1.UuidValue?
          ? preparedById
          : this.preparedById,
      preparedBy: preparedBy is _i4.UserProfile?
          ? preparedBy
          : this.preparedBy?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      preaparedAt: preaparedAt is DateTime? ? preaparedAt : this.preaparedAt,
      payedAt: payedAt is DateTime? ? payedAt : this.payedAt,
    );
  }
}
