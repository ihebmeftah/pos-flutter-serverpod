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
import '../ingredient/ingredient.dart' as _i2;
import 'package:pos_client/src/protocol/protocol.dart' as _i3;

abstract class ArticleComposition implements _i1.SerializableModel {
  ArticleComposition._({
    _i1.UuidValue? id,
    required this.articleId,
    this.ingredients,
    required this.quantity,
  }) : id = id ?? _i1.Uuid().v4obj();

  factory ArticleComposition({
    _i1.UuidValue? id,
    required _i1.UuidValue articleId,
    List<_i2.Ingredient>? ingredients,
    required double quantity,
  }) = _ArticleCompositionImpl;

  factory ArticleComposition.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArticleComposition(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      articleId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['articleId'],
      ),
      ingredients: jsonSerialization['ingredients'] == null
          ? null
          : _i3.Protocol().deserialize<List<_i2.Ingredient>>(
              jsonSerialization['ingredients'],
            ),
      quantity: (jsonSerialization['quantity'] as num).toDouble(),
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  _i1.UuidValue articleId;

  List<_i2.Ingredient>? ingredients;

  double quantity;

  /// Returns a shallow copy of this [ArticleComposition]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArticleComposition copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? articleId,
    List<_i2.Ingredient>? ingredients,
    double? quantity,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ArticleComposition',
      'id': id.toJson(),
      'articleId': articleId.toJson(),
      if (ingredients != null)
        'ingredients': ingredients?.toJson(valueToJson: (v) => v.toJson()),
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
    required _i1.UuidValue articleId,
    List<_i2.Ingredient>? ingredients,
    required double quantity,
  }) : super._(
         id: id,
         articleId: articleId,
         ingredients: ingredients,
         quantity: quantity,
       );

  /// Returns a shallow copy of this [ArticleComposition]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArticleComposition copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? articleId,
    Object? ingredients = _Undefined,
    double? quantity,
  }) {
    return ArticleComposition(
      id: id ?? this.id,
      articleId: articleId ?? this.articleId,
      ingredients: ingredients is List<_i2.Ingredient>?
          ? ingredients
          : this.ingredients?.map((e0) => e0.copyWith()).toList(),
      quantity: quantity ?? this.quantity,
    );
  }
}
