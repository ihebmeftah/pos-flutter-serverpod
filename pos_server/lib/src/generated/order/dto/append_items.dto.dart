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
import 'package:pos_server/src/generated/protocol.dart' as _i2;

abstract class AppendItemsDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  AppendItemsDto._({
    required this.orderId,
    required this.itemIds,
    required this.buildingId,
  });

  factory AppendItemsDto({
    required _i1.UuidValue orderId,
    required List<_i1.UuidValue> itemIds,
    required _i1.UuidValue buildingId,
  }) = _AppendItemsDtoImpl;

  factory AppendItemsDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppendItemsDto(
      orderId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['orderId'],
      ),
      itemIds: _i2.Protocol().deserialize<List<_i1.UuidValue>>(
        jsonSerialization['itemIds'],
      ),
      buildingId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['buildingId'],
      ),
    );
  }

  _i1.UuidValue orderId;

  List<_i1.UuidValue> itemIds;

  _i1.UuidValue buildingId;

  /// Returns a shallow copy of this [AppendItemsDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AppendItemsDto copyWith({
    _i1.UuidValue? orderId,
    List<_i1.UuidValue>? itemIds,
    _i1.UuidValue? buildingId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AppendItemsDto',
      'orderId': orderId.toJson(),
      'itemIds': itemIds.toJson(valueToJson: (v) => v.toJson()),
      'buildingId': buildingId.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AppendItemsDto',
      'orderId': orderId.toJson(),
      'itemIds': itemIds.toJson(valueToJson: (v) => v.toJson()),
      'buildingId': buildingId.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _AppendItemsDtoImpl extends AppendItemsDto {
  _AppendItemsDtoImpl({
    required _i1.UuidValue orderId,
    required List<_i1.UuidValue> itemIds,
    required _i1.UuidValue buildingId,
  }) : super._(
         orderId: orderId,
         itemIds: itemIds,
         buildingId: buildingId,
       );

  /// Returns a shallow copy of this [AppendItemsDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AppendItemsDto copyWith({
    _i1.UuidValue? orderId,
    List<_i1.UuidValue>? itemIds,
    _i1.UuidValue? buildingId,
  }) {
    return AppendItemsDto(
      orderId: orderId ?? this.orderId,
      itemIds: itemIds ?? this.itemIds.map((e0) => e0).toList(),
      buildingId: buildingId ?? this.buildingId,
    );
  }
}
