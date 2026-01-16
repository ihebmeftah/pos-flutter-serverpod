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

abstract class Caisse implements _i1.SerializableModel {
  Caisse._({
    this.id,
    required this.start,
    this.end,
    required this.isClosed,
    required this.buildingId,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Caisse({
    int? id,
    required DateTime start,
    DateTime? end,
    required bool isClosed,
    required int? buildingId,
    DateTime? createdAt,
  }) = _CaisseImpl;

  factory Caisse.fromJson(Map<String, dynamic> jsonSerialization) {
    return Caisse(
      id: jsonSerialization['id'] as int?,
      start: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['start']),
      end: jsonSerialization['end'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['end']),
      isClosed: jsonSerialization['isClosed'] as bool,
      buildingId: jsonSerialization['buildingId'] as int?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  DateTime start;

  DateTime? end;

  bool isClosed;

  int? buildingId;

  DateTime createdAt;

  /// Returns a shallow copy of this [Caisse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Caisse copyWith({
    int? id,
    DateTime? start,
    DateTime? end,
    bool? isClosed,
    int? buildingId,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Caisse',
      if (id != null) 'id': id,
      'start': start.toJson(),
      if (end != null) 'end': end?.toJson(),
      'isClosed': isClosed,
      if (buildingId != null) 'buildingId': buildingId,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CaisseImpl extends Caisse {
  _CaisseImpl({
    int? id,
    required DateTime start,
    DateTime? end,
    required bool isClosed,
    required int? buildingId,
    DateTime? createdAt,
  }) : super._(
         id: id,
         start: start,
         end: end,
         isClosed: isClosed,
         buildingId: buildingId,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Caisse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Caisse copyWith({
    Object? id = _Undefined,
    DateTime? start,
    Object? end = _Undefined,
    bool? isClosed,
    Object? buildingId = _Undefined,
    DateTime? createdAt,
  }) {
    return Caisse(
      id: id is int? ? id : this.id,
      start: start ?? this.start,
      end: end is DateTime? ? end : this.end,
      isClosed: isClosed ?? this.isClosed,
      buildingId: buildingId is int? ? buildingId : this.buildingId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
