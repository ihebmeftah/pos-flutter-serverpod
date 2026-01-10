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
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i2;
import '../buildings/building.dart' as _i3;
import 'package:pos_client/src/protocol/protocol.dart' as _i4;

abstract class Employer implements _i1.SerializableModel {
  Employer._({
    this.id,
    required this.userProfileId,
    required this.userProfile,
    required this.buildingId,
    this.building,
  });

  factory Employer({
    int? id,
    required _i1.UuidValue userProfileId,
    required _i2.UserProfile? userProfile,
    required int buildingId,
    _i3.Building? building,
  }) = _EmployerImpl;

  factory Employer.fromJson(Map<String, dynamic> jsonSerialization) {
    return Employer(
      id: jsonSerialization['id'] as int?,
      userProfileId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['userProfileId'],
      ),
      userProfile: jsonSerialization['userProfile'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.UserProfile>(
              jsonSerialization['userProfile'],
            ),
      buildingId: jsonSerialization['buildingId'] as int,
      building: jsonSerialization['building'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.Building>(
              jsonSerialization['building'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i1.UuidValue userProfileId;

  _i2.UserProfile? userProfile;

  int buildingId;

  _i3.Building? building;

  /// Returns a shallow copy of this [Employer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Employer copyWith({
    int? id,
    _i1.UuidValue? userProfileId,
    _i2.UserProfile? userProfile,
    int? buildingId,
    _i3.Building? building,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Employer',
      if (id != null) 'id': id,
      'userProfileId': userProfileId.toJson(),
      if (userProfile != null) 'userProfile': userProfile?.toJson(),
      'buildingId': buildingId,
      if (building != null) 'building': building?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EmployerImpl extends Employer {
  _EmployerImpl({
    int? id,
    required _i1.UuidValue userProfileId,
    required _i2.UserProfile? userProfile,
    required int buildingId,
    _i3.Building? building,
  }) : super._(
         id: id,
         userProfileId: userProfileId,
         userProfile: userProfile,
         buildingId: buildingId,
         building: building,
       );

  /// Returns a shallow copy of this [Employer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Employer copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? userProfileId,
    Object? userProfile = _Undefined,
    int? buildingId,
    Object? building = _Undefined,
  }) {
    return Employer(
      id: id is int? ? id : this.id,
      userProfileId: userProfileId ?? this.userProfileId,
      userProfile: userProfile is _i2.UserProfile?
          ? userProfile
          : this.userProfile?.copyWith(),
      buildingId: buildingId ?? this.buildingId,
      building: building is _i3.Building?
          ? building
          : this.building?.copyWith(),
    );
  }
}
