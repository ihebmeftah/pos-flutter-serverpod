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

abstract class Categorie implements _i1.SerializableModel {
  Categorie._({
    _i1.UuidValue? id,
    required this.name,
    this.description,
    required this.buildingId,
  }) : id = id ?? _i1.Uuid().v4obj();

  factory Categorie({
    _i1.UuidValue? id,
    required String name,
    String? description,
    required _i1.UuidValue buildingId,
  }) = _CategorieImpl;

  factory Categorie.fromJson(Map<String, dynamic> jsonSerialization) {
    return Categorie(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      buildingId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['buildingId'],
      ),
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  String name;

  String? description;

  _i1.UuidValue buildingId;

  /// Returns a shallow copy of this [Categorie]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Categorie copyWith({
    _i1.UuidValue? id,
    String? name,
    String? description,
    _i1.UuidValue? buildingId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Categorie',
      'id': id.toJson(),
      'name': name,
      if (description != null) 'description': description,
      'buildingId': buildingId.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CategorieImpl extends Categorie {
  _CategorieImpl({
    _i1.UuidValue? id,
    required String name,
    String? description,
    required _i1.UuidValue buildingId,
  }) : super._(
         id: id,
         name: name,
         description: description,
         buildingId: buildingId,
       );

  /// Returns a shallow copy of this [Categorie]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Categorie copyWith({
    _i1.UuidValue? id,
    String? name,
    Object? description = _Undefined,
    _i1.UuidValue? buildingId,
  }) {
    return Categorie(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      buildingId: buildingId ?? this.buildingId,
    );
  }
}
