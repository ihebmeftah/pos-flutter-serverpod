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

abstract class CashRegister implements _i1.SerializableModel {
  CashRegister._({
    _i1.UuidValue? id,
    required this.start,
    this.end,
    required this.isClosed,
    required this.buildingId,
    DateTime? createdAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       createdAt = createdAt ?? DateTime.now();

  factory CashRegister({
    _i1.UuidValue? id,
    required DateTime start,
    DateTime? end,
    required bool isClosed,
    required _i1.UuidValue buildingId,
    DateTime? createdAt,
  }) = _CashRegisterImpl;

  factory CashRegister.fromJson(Map<String, dynamic> jsonSerialization) {
    return CashRegister(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      start: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['start']),
      end: jsonSerialization['end'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['end']),
      isClosed: jsonSerialization['isClosed'] as bool,
      buildingId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['buildingId'],
      ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  DateTime start;

  DateTime? end;

  bool isClosed;

  _i1.UuidValue buildingId;

  DateTime createdAt;

  /// Returns a shallow copy of this [CashRegister]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CashRegister copyWith({
    _i1.UuidValue? id,
    DateTime? start,
    DateTime? end,
    bool? isClosed,
    _i1.UuidValue? buildingId,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CashRegister',
      'id': id.toJson(),
      'start': start.toJson(),
      if (end != null) 'end': end?.toJson(),
      'isClosed': isClosed,
      'buildingId': buildingId.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CashRegisterImpl extends CashRegister {
  _CashRegisterImpl({
    _i1.UuidValue? id,
    required DateTime start,
    DateTime? end,
    required bool isClosed,
    required _i1.UuidValue buildingId,
    DateTime? createdAt,
  }) : super._(
         id: id,
         start: start,
         end: end,
         isClosed: isClosed,
         buildingId: buildingId,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [CashRegister]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CashRegister copyWith({
    _i1.UuidValue? id,
    DateTime? start,
    Object? end = _Undefined,
    bool? isClosed,
    _i1.UuidValue? buildingId,
    DateTime? createdAt,
  }) {
    return CashRegister(
      id: id ?? this.id,
      start: start ?? this.start,
      end: end is DateTime? ? end : this.end,
      isClosed: isClosed ?? this.isClosed,
      buildingId: buildingId ?? this.buildingId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
