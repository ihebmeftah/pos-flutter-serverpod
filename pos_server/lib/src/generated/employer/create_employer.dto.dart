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

abstract class CreateEmployerDTO
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CreateEmployerDTO._({
    required this.firstName,
    required this.lastName,
    required this.displayName,
    required this.phone,
    required this.persoEmail,
    required this.buildingId,
    this.accessId,
    required this.password,
  });

  factory CreateEmployerDTO({
    required String firstName,
    required String lastName,
    required String displayName,
    required int phone,
    required String persoEmail,
    required _i1.UuidValue buildingId,
    _i1.UuidValue? accessId,
    required String password,
  }) = _CreateEmployerDTOImpl;

  factory CreateEmployerDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return CreateEmployerDTO(
      firstName: jsonSerialization['firstName'] as String,
      lastName: jsonSerialization['lastName'] as String,
      displayName: jsonSerialization['displayName'] as String,
      phone: jsonSerialization['phone'] as int,
      persoEmail: jsonSerialization['persoEmail'] as String,
      buildingId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['buildingId'],
      ),
      accessId: jsonSerialization['accessId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['accessId']),
      password: jsonSerialization['password'] as String,
    );
  }

  String firstName;

  String lastName;

  String displayName;

  int phone;

  String persoEmail;

  _i1.UuidValue buildingId;

  _i1.UuidValue? accessId;

  String password;

  /// Returns a shallow copy of this [CreateEmployerDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreateEmployerDTO copyWith({
    String? firstName,
    String? lastName,
    String? displayName,
    int? phone,
    String? persoEmail,
    _i1.UuidValue? buildingId,
    _i1.UuidValue? accessId,
    String? password,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CreateEmployerDTO',
      'firstName': firstName,
      'lastName': lastName,
      'displayName': displayName,
      'phone': phone,
      'persoEmail': persoEmail,
      'buildingId': buildingId.toJson(),
      if (accessId != null) 'accessId': accessId?.toJson(),
      'password': password,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CreateEmployerDTO',
      'firstName': firstName,
      'lastName': lastName,
      'displayName': displayName,
      'phone': phone,
      'persoEmail': persoEmail,
      'buildingId': buildingId.toJson(),
      if (accessId != null) 'accessId': accessId?.toJson(),
      'password': password,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CreateEmployerDTOImpl extends CreateEmployerDTO {
  _CreateEmployerDTOImpl({
    required String firstName,
    required String lastName,
    required String displayName,
    required int phone,
    required String persoEmail,
    required _i1.UuidValue buildingId,
    _i1.UuidValue? accessId,
    required String password,
  }) : super._(
         firstName: firstName,
         lastName: lastName,
         displayName: displayName,
         phone: phone,
         persoEmail: persoEmail,
         buildingId: buildingId,
         accessId: accessId,
         password: password,
       );

  /// Returns a shallow copy of this [CreateEmployerDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreateEmployerDTO copyWith({
    String? firstName,
    String? lastName,
    String? displayName,
    int? phone,
    String? persoEmail,
    _i1.UuidValue? buildingId,
    Object? accessId = _Undefined,
    String? password,
  }) {
    return CreateEmployerDTO(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      displayName: displayName ?? this.displayName,
      phone: phone ?? this.phone,
      persoEmail: persoEmail ?? this.persoEmail,
      buildingId: buildingId ?? this.buildingId,
      accessId: accessId is _i1.UuidValue? ? accessId : this.accessId,
      password: password ?? this.password,
    );
  }
}
