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
import '../article/article.dart' as _i2;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i3;
import 'package:pos_client/src/protocol/protocol.dart' as _i4;

abstract class OrderItem implements _i1.SerializableModel {
  OrderItem._({
    this.id,
    required this.article,
    required this.passedById,
    this.passedBy,
    bool? payed,
  }) : payed = payed ?? false;

  factory OrderItem({
    int? id,
    required _i2.Article article,
    required _i1.UuidValue passedById,
    _i3.UserProfile? passedBy,
    bool? payed,
  }) = _OrderItemImpl;

  factory OrderItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return OrderItem(
      id: jsonSerialization['id'] as int?,
      article: _i4.Protocol().deserialize<_i2.Article>(
        jsonSerialization['article'],
      ),
      passedById: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['passedById'],
      ),
      passedBy: jsonSerialization['passedBy'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.UserProfile>(
              jsonSerialization['passedBy'],
            ),
      payed: jsonSerialization['payed'] as bool?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i2.Article article;

  _i1.UuidValue passedById;

  _i3.UserProfile? passedBy;

  bool payed;

  /// Returns a shallow copy of this [OrderItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  OrderItem copyWith({
    int? id,
    _i2.Article? article,
    _i1.UuidValue? passedById,
    _i3.UserProfile? passedBy,
    bool? payed,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'OrderItem',
      if (id != null) 'id': id,
      'article': article.toJson(),
      'passedById': passedById.toJson(),
      if (passedBy != null) 'passedBy': passedBy?.toJson(),
      'payed': payed,
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
    int? id,
    required _i2.Article article,
    required _i1.UuidValue passedById,
    _i3.UserProfile? passedBy,
    bool? payed,
  }) : super._(
         id: id,
         article: article,
         passedById: passedById,
         passedBy: passedBy,
         payed: payed,
       );

  /// Returns a shallow copy of this [OrderItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  OrderItem copyWith({
    Object? id = _Undefined,
    _i2.Article? article,
    _i1.UuidValue? passedById,
    Object? passedBy = _Undefined,
    bool? payed,
  }) {
    return OrderItem(
      id: id is int? ? id : this.id,
      article: article ?? this.article.copyWith(),
      passedById: passedById ?? this.passedById,
      passedBy: passedBy is _i3.UserProfile?
          ? passedBy
          : this.passedBy?.copyWith(),
      payed: payed ?? this.payed,
    );
  }
}
