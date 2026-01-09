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
    this.id,
    required this.number,
    int? seatsMax,
    this.status,
    required this.buildingId,
  }) : seatsMax = seatsMax ?? 4;

  factory BTable({
    int? id,
    required int number,
    int? seatsMax,
    _i2.TableStatus? status,
    required int? buildingId,
  }) = _BTableImpl;

  factory BTable.fromJson(Map<String, dynamic> jsonSerialization) {
    return BTable(
      id: jsonSerialization['id'] as int?,
      number: jsonSerialization['number'] as int,
      seatsMax: jsonSerialization['seatsMax'] as int,
      status: jsonSerialization['status'] == null
          ? null
          : _i2.TableStatus.fromJson((jsonSerialization['status'] as String)),
      buildingId: jsonSerialization['buildingId'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// The number of the building.
  int number;

  int seatsMax;

  _i2.TableStatus? status;

  int? buildingId;

  /// Returns a shallow copy of this [BTable]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BTable copyWith({
    int? id,
    int? number,
    int? seatsMax,
    _i2.TableStatus? status,
    int? buildingId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BTable',
      if (id != null) 'id': id,
      'number': number,
      'seatsMax': seatsMax,
      if (status != null) 'status': status?.toJson(),
      if (buildingId != null) 'buildingId': buildingId,
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
    int? id,
    required int number,
    int? seatsMax,
    _i2.TableStatus? status,
    required int? buildingId,
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
    Object? id = _Undefined,
    int? number,
    int? seatsMax,
    Object? status = _Undefined,
    Object? buildingId = _Undefined,
  }) {
    return BTable(
      id: id is int? ? id : this.id,
      number: number ?? this.number,
      seatsMax: seatsMax ?? this.seatsMax,
      status: status is _i2.TableStatus? ? status : this.status,
      buildingId: buildingId is int? ? buildingId : this.buildingId,
    );
  }
}
