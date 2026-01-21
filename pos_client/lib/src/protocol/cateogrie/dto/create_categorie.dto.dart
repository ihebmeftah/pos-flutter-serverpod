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

abstract class UpdateCategorieDto implements _i1.SerializableModel {
  UpdateCategorieDto._({
    required this.name,
    required this.description,
    required this.buildingId,
  });

  factory UpdateCategorieDto({
    required String name,
    required String description,
    required _i1.UuidValue buildingId,
  }) = _UpdateCategorieDtoImpl;

  factory UpdateCategorieDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return UpdateCategorieDto(
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      buildingId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['buildingId'],
      ),
    );
  }

  String name;

  String description;

  _i1.UuidValue buildingId;

  /// Returns a shallow copy of this [UpdateCategorieDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UpdateCategorieDto copyWith({
    String? name,
    String? description,
    _i1.UuidValue? buildingId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UpdateCategorieDto',
      'name': name,
      'description': description,
      'buildingId': buildingId.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _UpdateCategorieDtoImpl extends UpdateCategorieDto {
  _UpdateCategorieDtoImpl({
    required String name,
    required String description,
    required _i1.UuidValue buildingId,
  }) : super._(
         name: name,
         description: description,
         buildingId: buildingId,
       );

  /// Returns a shallow copy of this [UpdateCategorieDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UpdateCategorieDto copyWith({
    String? name,
    String? description,
    _i1.UuidValue? buildingId,
  }) {
    return UpdateCategorieDto(
      name: name ?? this.name,
      description: description ?? this.description,
      buildingId: buildingId ?? this.buildingId,
    );
  }
}
