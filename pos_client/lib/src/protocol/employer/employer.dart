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
import '../access/access.dart' as _i4;
import 'package:pos_client/src/protocol/protocol.dart' as _i5;

abstract class Employer implements _i1.SerializableModel {
  Employer._({
    _i1.UuidValue? id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    bool? phoneVerified,
    required this.persoEmail,
    bool? persoEmailVerified,
    required this.userProfileId,
    this.userProfile,
    required this.buildingId,
    this.building,
    this.accessId,
    this.access,
  }) : id = id ?? _i1.Uuid().v4obj(),
       phoneVerified = phoneVerified ?? false,
       persoEmailVerified = persoEmailVerified ?? false;

  factory Employer({
    _i1.UuidValue? id,
    required String firstName,
    required String lastName,
    required int phone,
    bool? phoneVerified,
    required String persoEmail,
    bool? persoEmailVerified,
    required _i1.UuidValue userProfileId,
    _i2.UserProfile? userProfile,
    required _i1.UuidValue buildingId,
    _i3.Building? building,
    _i1.UuidValue? accessId,
    _i4.Access? access,
  }) = _EmployerImpl;

  factory Employer.fromJson(Map<String, dynamic> jsonSerialization) {
    return Employer(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      firstName: jsonSerialization['firstName'] as String,
      lastName: jsonSerialization['lastName'] as String,
      phone: jsonSerialization['phone'] as int,
      phoneVerified: jsonSerialization['phoneVerified'] as bool?,
      persoEmail: jsonSerialization['persoEmail'] as String,
      persoEmailVerified: jsonSerialization['persoEmailVerified'] as bool?,
      userProfileId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['userProfileId'],
      ),
      userProfile: jsonSerialization['userProfile'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.UserProfile>(
              jsonSerialization['userProfile'],
            ),
      buildingId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['buildingId'],
      ),
      building: jsonSerialization['building'] == null
          ? null
          : _i5.Protocol().deserialize<_i3.Building>(
              jsonSerialization['building'],
            ),
      accessId: jsonSerialization['accessId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['accessId']),
      access: jsonSerialization['access'] == null
          ? null
          : _i5.Protocol().deserialize<_i4.Access>(jsonSerialization['access']),
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  String firstName;

  String lastName;

  int phone;

  bool phoneVerified;

  String persoEmail;

  bool persoEmailVerified;

  _i1.UuidValue userProfileId;

  _i2.UserProfile? userProfile;

  _i1.UuidValue buildingId;

  _i3.Building? building;

  _i1.UuidValue? accessId;

  _i4.Access? access;

  /// Returns a shallow copy of this [Employer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Employer copyWith({
    _i1.UuidValue? id,
    String? firstName,
    String? lastName,
    int? phone,
    bool? phoneVerified,
    String? persoEmail,
    bool? persoEmailVerified,
    _i1.UuidValue? userProfileId,
    _i2.UserProfile? userProfile,
    _i1.UuidValue? buildingId,
    _i3.Building? building,
    _i1.UuidValue? accessId,
    _i4.Access? access,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Employer',
      'id': id.toJson(),
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'phoneVerified': phoneVerified,
      'persoEmail': persoEmail,
      'persoEmailVerified': persoEmailVerified,
      'userProfileId': userProfileId.toJson(),
      if (userProfile != null) 'userProfile': userProfile?.toJson(),
      'buildingId': buildingId.toJson(),
      if (building != null) 'building': building?.toJson(),
      if (accessId != null) 'accessId': accessId?.toJson(),
      if (access != null) 'access': access?.toJson(),
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
    _i1.UuidValue? id,
    required String firstName,
    required String lastName,
    required int phone,
    bool? phoneVerified,
    required String persoEmail,
    bool? persoEmailVerified,
    required _i1.UuidValue userProfileId,
    _i2.UserProfile? userProfile,
    required _i1.UuidValue buildingId,
    _i3.Building? building,
    _i1.UuidValue? accessId,
    _i4.Access? access,
  }) : super._(
         id: id,
         firstName: firstName,
         lastName: lastName,
         phone: phone,
         phoneVerified: phoneVerified,
         persoEmail: persoEmail,
         persoEmailVerified: persoEmailVerified,
         userProfileId: userProfileId,
         userProfile: userProfile,
         buildingId: buildingId,
         building: building,
         accessId: accessId,
         access: access,
       );

  /// Returns a shallow copy of this [Employer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Employer copyWith({
    _i1.UuidValue? id,
    String? firstName,
    String? lastName,
    int? phone,
    bool? phoneVerified,
    String? persoEmail,
    bool? persoEmailVerified,
    _i1.UuidValue? userProfileId,
    Object? userProfile = _Undefined,
    _i1.UuidValue? buildingId,
    Object? building = _Undefined,
    Object? accessId = _Undefined,
    Object? access = _Undefined,
  }) {
    return Employer(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      phoneVerified: phoneVerified ?? this.phoneVerified,
      persoEmail: persoEmail ?? this.persoEmail,
      persoEmailVerified: persoEmailVerified ?? this.persoEmailVerified,
      userProfileId: userProfileId ?? this.userProfileId,
      userProfile: userProfile is _i2.UserProfile?
          ? userProfile
          : this.userProfile?.copyWith(),
      buildingId: buildingId ?? this.buildingId,
      building: building is _i3.Building?
          ? building
          : this.building?.copyWith(),
      accessId: accessId is _i1.UuidValue? ? accessId : this.accessId,
      access: access is _i4.Access? ? access : this.access?.copyWith(),
    );
  }
}
