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
import '../../ingredient/ingredient.dart' as _i2;
import 'package:pos_client/src/protocol/protocol.dart' as _i3;

abstract class ArticleComposition implements _i1.SerializableModel {
  ArticleComposition._({
    _i1.UuidValue? id,
    required this.ingredientId,
    this.ingredient,
    required this.quantity,
  }) : id = id ?? _i1.Uuid().v4obj();

  factory ArticleComposition({
    _i1.UuidValue? id,
    required _i1.UuidValue ingredientId,
    _i2.Ingredient? ingredient,
    required double quantity,
  }) = _ArticleCompositionImpl;

  factory ArticleComposition.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArticleComposition(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      ingredientId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['ingredientId'],
      ),
      ingredient: jsonSerialization['ingredient'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.Ingredient>(
              jsonSerialization['ingredient'],
            ),
      quantity: (jsonSerialization['quantity'] as num).toDouble(),
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  _i1.UuidValue ingredientId;

  _i2.Ingredient? ingredient;

  double quantity;

  /// Returns a shallow copy of this [ArticleComposition]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArticleComposition copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? ingredientId,
    _i2.Ingredient? ingredient,
    double? quantity,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ArticleComposition',
      'id': id.toJson(),
      'ingredientId': ingredientId.toJson(),
      if (ingredient != null) 'ingredient': ingredient?.toJson(),
      'quantity': quantity,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArticleCompositionImpl extends ArticleComposition {
  _ArticleCompositionImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue ingredientId,
    _i2.Ingredient? ingredient,
    required double quantity,
  }) : super._(
         id: id,
         ingredientId: ingredientId,
         ingredient: ingredient,
         quantity: quantity,
       );

  /// Returns a shallow copy of this [ArticleComposition]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArticleComposition copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? ingredientId,
    Object? ingredient = _Undefined,
    double? quantity,
  }) {
    return ArticleComposition(
      id: id ?? this.id,
      ingredientId: ingredientId ?? this.ingredientId,
      ingredient: ingredient is _i2.Ingredient?
          ? ingredient
          : this.ingredient?.copyWith(),
      quantity: quantity ?? this.quantity,
    );
  }
}
