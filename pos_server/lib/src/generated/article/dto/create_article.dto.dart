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
import '../../article/entity/article_composition.dart' as _i2;
import 'package:pos_server/src/generated/protocol.dart' as _i3;

abstract class CreateArticleDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CreateArticleDto._({
    required this.name,
    this.description,
    required this.price,
    required this.categoryId,
    required this.composition,
    required this.buildingId,
  });

  factory CreateArticleDto({
    required String name,
    String? description,
    required double price,
    required _i1.UuidValue categoryId,
    required List<_i2.ArticleComposition> composition,
    required _i1.UuidValue buildingId,
  }) = _CreateArticleDtoImpl;

  factory CreateArticleDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return CreateArticleDto(
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      price: (jsonSerialization['price'] as num).toDouble(),
      categoryId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['categoryId'],
      ),
      composition: _i3.Protocol().deserialize<List<_i2.ArticleComposition>>(
        jsonSerialization['composition'],
      ),
      buildingId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['buildingId'],
      ),
    );
  }

  String name;

  String? description;

  double price;

  _i1.UuidValue categoryId;

  List<_i2.ArticleComposition> composition;

  _i1.UuidValue buildingId;

  /// Returns a shallow copy of this [CreateArticleDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreateArticleDto copyWith({
    String? name,
    String? description,
    double? price,
    _i1.UuidValue? categoryId,
    List<_i2.ArticleComposition>? composition,
    _i1.UuidValue? buildingId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CreateArticleDto',
      'name': name,
      if (description != null) 'description': description,
      'price': price,
      'categoryId': categoryId.toJson(),
      'composition': composition.toJson(valueToJson: (v) => v.toJson()),
      'buildingId': buildingId.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CreateArticleDto',
      'name': name,
      if (description != null) 'description': description,
      'price': price,
      'categoryId': categoryId.toJson(),
      'composition': composition.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
      'buildingId': buildingId.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CreateArticleDtoImpl extends CreateArticleDto {
  _CreateArticleDtoImpl({
    required String name,
    String? description,
    required double price,
    required _i1.UuidValue categoryId,
    required List<_i2.ArticleComposition> composition,
    required _i1.UuidValue buildingId,
  }) : super._(
         name: name,
         description: description,
         price: price,
         categoryId: categoryId,
         composition: composition,
         buildingId: buildingId,
       );

  /// Returns a shallow copy of this [CreateArticleDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreateArticleDto copyWith({
    String? name,
    Object? description = _Undefined,
    double? price,
    _i1.UuidValue? categoryId,
    List<_i2.ArticleComposition>? composition,
    _i1.UuidValue? buildingId,
  }) {
    return CreateArticleDto(
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      price: price ?? this.price,
      categoryId: categoryId ?? this.categoryId,
      composition:
          composition ?? this.composition.map((e0) => e0.copyWith()).toList(),
      buildingId: buildingId ?? this.buildingId,
    );
  }
}
