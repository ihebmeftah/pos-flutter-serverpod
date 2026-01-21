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
import 'package:pos_client/src/protocol/protocol.dart' as _i2;

abstract class CreateOrderDto implements _i1.SerializableModel {
  CreateOrderDto._({
    required this.btableId,
    required this.itemsIds,
    required this.buildingId,
  });

  factory CreateOrderDto({
    required _i1.UuidValue btableId,
    required List<_i1.UuidValue> itemsIds,
    required _i1.UuidValue buildingId,
  }) = _CreateOrderDtoImpl;

  factory CreateOrderDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return CreateOrderDto(
      btableId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['btableId'],
      ),
      itemsIds: _i2.Protocol().deserialize<List<_i1.UuidValue>>(
        jsonSerialization['itemsIds'],
      ),
      buildingId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['buildingId'],
      ),
    );
  }

  _i1.UuidValue btableId;

  List<_i1.UuidValue> itemsIds;

  _i1.UuidValue buildingId;

  /// Returns a shallow copy of this [CreateOrderDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreateOrderDto copyWith({
    _i1.UuidValue? btableId,
    List<_i1.UuidValue>? itemsIds,
    _i1.UuidValue? buildingId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CreateOrderDto',
      'btableId': btableId.toJson(),
      'itemsIds': itemsIds.toJson(valueToJson: (v) => v.toJson()),
      'buildingId': buildingId.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CreateOrderDtoImpl extends CreateOrderDto {
  _CreateOrderDtoImpl({
    required _i1.UuidValue btableId,
    required List<_i1.UuidValue> itemsIds,
    required _i1.UuidValue buildingId,
  }) : super._(
         btableId: btableId,
         itemsIds: itemsIds,
         buildingId: buildingId,
       );

  /// Returns a shallow copy of this [CreateOrderDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreateOrderDto copyWith({
    _i1.UuidValue? btableId,
    List<_i1.UuidValue>? itemsIds,
    _i1.UuidValue? buildingId,
  }) {
    return CreateOrderDto(
      btableId: btableId ?? this.btableId,
      itemsIds: itemsIds ?? this.itemsIds.map((e0) => e0).toList(),
      buildingId: buildingId ?? this.buildingId,
    );
  }
}
