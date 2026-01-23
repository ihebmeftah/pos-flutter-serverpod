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
    double? startAmount,
    this.end,
    double? endAmount,
    required this.isClosed,
    required this.buildingId,
  }) : id = id ?? _i1.Uuid().v4obj(),
       startAmount = startAmount ?? 0.0,
       endAmount = endAmount ?? 0.0;

  factory CashRegister({
    _i1.UuidValue? id,
    required DateTime start,
    double? startAmount,
    DateTime? end,
    double? endAmount,
    required bool isClosed,
    required _i1.UuidValue buildingId,
  }) = _CashRegisterImpl;

  factory CashRegister.fromJson(Map<String, dynamic> jsonSerialization) {
    return CashRegister(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      start: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['start']),
      startAmount: (jsonSerialization['startAmount'] as num?)?.toDouble(),
      end: jsonSerialization['end'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['end']),
      endAmount: (jsonSerialization['endAmount'] as num?)?.toDouble(),
      isClosed: jsonSerialization['isClosed'] as bool,
      buildingId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['buildingId'],
      ),
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  DateTime start;

  double? startAmount;

  DateTime? end;

  double? endAmount;

  bool isClosed;

  _i1.UuidValue buildingId;

  /// Returns a shallow copy of this [CashRegister]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CashRegister copyWith({
    _i1.UuidValue? id,
    DateTime? start,
    double? startAmount,
    DateTime? end,
    double? endAmount,
    bool? isClosed,
    _i1.UuidValue? buildingId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CashRegister',
      'id': id.toJson(),
      'start': start.toJson(),
      if (startAmount != null) 'startAmount': startAmount,
      if (end != null) 'end': end?.toJson(),
      if (endAmount != null) 'endAmount': endAmount,
      'isClosed': isClosed,
      'buildingId': buildingId.toJson(),
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
    double? startAmount,
    DateTime? end,
    double? endAmount,
    required bool isClosed,
    required _i1.UuidValue buildingId,
  }) : super._(
         id: id,
         start: start,
         startAmount: startAmount,
         end: end,
         endAmount: endAmount,
         isClosed: isClosed,
         buildingId: buildingId,
       );

  /// Returns a shallow copy of this [CashRegister]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CashRegister copyWith({
    _i1.UuidValue? id,
    DateTime? start,
    Object? startAmount = _Undefined,
    Object? end = _Undefined,
    Object? endAmount = _Undefined,
    bool? isClosed,
    _i1.UuidValue? buildingId,
  }) {
    return CashRegister(
      id: id ?? this.id,
      start: start ?? this.start,
      startAmount: startAmount is double? ? startAmount : this.startAmount,
      end: end is DateTime? ? end : this.end,
      endAmount: endAmount is double? ? endAmount : this.endAmount,
      isClosed: isClosed ?? this.isClosed,
      buildingId: buildingId ?? this.buildingId,
    );
  }
}
