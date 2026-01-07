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
    this.id,
    required this.name,
    this.description,
    required this.price,
    required this.categorieId,
    required this.categorie,
  });

  factory Article({
    int? id,
    required String name,
    String? description,
    required double price,
    required int categorieId,
    required _i2.Categorie? categorie,
  }) = _ArticleImpl;

  factory Article.fromJson(Map<String, dynamic> jsonSerialization) {
    return Article(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      price: (jsonSerialization['price'] as num).toDouble(),
      categorieId: jsonSerialization['categorieId'] as int,
      categorie: jsonSerialization['categorie'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.Categorie>(
              jsonSerialization['categorie'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String? description;

  double price;

  int categorieId;

  _i2.Categorie? categorie;

  /// Returns a shallow copy of this [Article]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Article copyWith({
    int? id,
    String? name,
    String? description,
    double? price,
    int? categorieId,
    _i2.Categorie? categorie,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Article',
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'price': price,
      'categorieId': categorieId,
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
    int? id,
    required String name,
    String? description,
    required double price,
    required int categorieId,
    required _i2.Categorie? categorie,
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
    Object? id = _Undefined,
    String? name,
    Object? description = _Undefined,
    double? price,
    int? categorieId,
    Object? categorie = _Undefined,
  }) {
    return Article(
      id: id is int? ? id : this.id,
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
