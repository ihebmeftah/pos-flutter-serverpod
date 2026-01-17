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
import '../cateogrie/categorie.dart' as _i2;
import 'package:pos_client/src/protocol/protocol.dart' as _i3;

abstract class Article implements _i1.SerializableModel {
  Article._({
    _i1.UuidValue? id,
    required this.name,
    this.description,
    required this.price,
    required this.categorieId,
    this.categorie,
  }) : id = id ?? _i1.Uuid().v4obj();

  factory Article({
    _i1.UuidValue? id,
    required String name,
    String? description,
    required double price,
    required _i1.UuidValue categorieId,
    _i2.Categorie? categorie,
  }) = _ArticleImpl;

  factory Article.fromJson(Map<String, dynamic> jsonSerialization) {
    return Article(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      price: (jsonSerialization['price'] as num).toDouble(),
      categorieId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['categorieId'],
      ),
      categorie: jsonSerialization['categorie'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.Categorie>(
              jsonSerialization['categorie'],
            ),
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  String name;

  String? description;

  double price;

  _i1.UuidValue categorieId;

  _i2.Categorie? categorie;

  /// Returns a shallow copy of this [Article]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Article copyWith({
    _i1.UuidValue? id,
    String? name,
    String? description,
    double? price,
    _i1.UuidValue? categorieId,
    _i2.Categorie? categorie,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Article',
      'id': id.toJson(),
      'name': name,
      if (description != null) 'description': description,
      'price': price,
      'categorieId': categorieId.toJson(),
      if (categorie != null) 'categorie': categorie?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArticleImpl extends Article {
  _ArticleImpl({
    _i1.UuidValue? id,
    required String name,
    String? description,
    required double price,
    required _i1.UuidValue categorieId,
    _i2.Categorie? categorie,
  }) : super._(
         id: id,
         name: name,
         description: description,
         price: price,
         categorieId: categorieId,
         categorie: categorie,
       );

  /// Returns a shallow copy of this [Article]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Article copyWith({
    _i1.UuidValue? id,
    String? name,
    Object? description = _Undefined,
    double? price,
    _i1.UuidValue? categorieId,
    Object? categorie = _Undefined,
  }) {
    return Article(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      price: price ?? this.price,
      categorieId: categorieId ?? this.categorieId,
      categorie: categorie is _i2.Categorie?
          ? categorie
          : this.categorie?.copyWith(),
    );
  }
}
