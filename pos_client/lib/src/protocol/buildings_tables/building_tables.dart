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
import '../buildings_tables/table_status_enum.dart' as _i2;

abstract class BTable implements _i1.SerializableModel {
  BTable._({
    _i1.UuidValue? id,
    required this.number,
    required this.seatsMax,
    this.status,
    required this.buildingId,
  }) : id = id ?? _i1.Uuid().v4obj();

  factory BTable({
    _i1.UuidValue? id,
    required int number,
    required int seatsMax,
    _i2.TableStatus? status,
    required _i1.UuidValue buildingId,
  }) = _BTableImpl;

  factory BTable.fromJson(Map<String, dynamic> jsonSerialization) {
    return BTable(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      number: jsonSerialization['number'] as int,
      seatsMax: jsonSerialization['seatsMax'] as int,
      status: jsonSerialization['status'] == null
          ? null
          : _i2.TableStatus.fromJson((jsonSerialization['status'] as String)),
      buildingId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['buildingId'],
      ),
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  /// The number of the building.
  int number;

  int seatsMax;

  _i2.TableStatus? status;

  _i1.UuidValue buildingId;

  /// Returns a shallow copy of this [BTable]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BTable copyWith({
    _i1.UuidValue? id,
    int? number,
    int? seatsMax,
    _i2.TableStatus? status,
    _i1.UuidValue? buildingId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BTable',
      'id': id.toJson(),
      'number': number,
      'seatsMax': seatsMax,
      if (status != null) 'status': status?.toJson(),
      'buildingId': buildingId.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BTableImpl extends BTable {
  _BTableImpl({
    _i1.UuidValue? id,
    required int number,
    required int seatsMax,
    _i2.TableStatus? status,
    required _i1.UuidValue buildingId,
  }) : super._(
         id: id,
         number: number,
         seatsMax: seatsMax,
         status: status,
         buildingId: buildingId,
       );

  /// Returns a shallow copy of this [BTable]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BTable copyWith({
    _i1.UuidValue? id,
    int? number,
    int? seatsMax,
    Object? status = _Undefined,
    _i1.UuidValue? buildingId,
  }) {
    return BTable(
      id: id ?? this.id,
      number: number ?? this.number,
      seatsMax: seatsMax ?? this.seatsMax,
      status: status is _i2.TableStatus? ? status : this.status,
      buildingId: buildingId ?? this.buildingId,
    );
  }
}
