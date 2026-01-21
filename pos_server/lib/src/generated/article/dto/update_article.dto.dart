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

abstract class UpdateArticleDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  UpdateArticleDto._({
    required this.name,
    this.description,
    required this.price,
    required this.categoryId,
  });

  factory UpdateArticleDto({
    required String name,
    String? description,
    required double price,
    required _i1.UuidValue categoryId,
  }) = _UpdateArticleDtoImpl;

  factory UpdateArticleDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return UpdateArticleDto(
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      price: (jsonSerialization['price'] as num).toDouble(),
      categoryId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['categoryId'],
      ),
    );
  }

  String name;

  String? description;

  double price;

  _i1.UuidValue categoryId;

  /// Returns a shallow copy of this [UpdateArticleDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UpdateArticleDto copyWith({
    String? name,
    String? description,
    double? price,
    _i1.UuidValue? categoryId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UpdateArticleDto',
      'name': name,
      if (description != null) 'description': description,
      'price': price,
      'categoryId': categoryId.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UpdateArticleDto',
      'name': name,
      if (description != null) 'description': description,
      'price': price,
      'categoryId': categoryId.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UpdateArticleDtoImpl extends UpdateArticleDto {
  _UpdateArticleDtoImpl({
    required String name,
    String? description,
    required double price,
    required _i1.UuidValue categoryId,
  }) : super._(
         name: name,
         description: description,
         price: price,
         categoryId: categoryId,
       );

  /// Returns a shallow copy of this [UpdateArticleDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UpdateArticleDto copyWith({
    String? name,
    Object? description = _Undefined,
    double? price,
    _i1.UuidValue? categoryId,
  }) {
    return UpdateArticleDto(
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      price: price ?? this.price,
      categoryId: categoryId ?? this.categoryId,
    );
  }
}
