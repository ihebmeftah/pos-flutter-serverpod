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
import '../ingredient/units_type.enum.dart' as _i2;

abstract class Ingredient implements _i1.SerializableModel {
  Ingredient._({
    _i1.UuidValue? id,
    required this.name,
    required this.unit,
    required this.currentStock,
    required this.thresholdStock,
    required this.buildingId,
  }) : id = id ?? _i1.Uuid().v4obj();

  factory Ingredient({
    _i1.UuidValue? id,
    required String name,
    required _i2.UnitsType unit,
    required double currentStock,
    required double thresholdStock,
    required _i1.UuidValue buildingId,
  }) = _IngredientImpl;

  factory Ingredient.fromJson(Map<String, dynamic> jsonSerialization) {
    return Ingredient(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      name: jsonSerialization['name'] as String,
      unit: _i2.UnitsType.fromJson((jsonSerialization['unit'] as String)),
      currentStock: (jsonSerialization['currentStock'] as num).toDouble(),
      thresholdStock: (jsonSerialization['thresholdStock'] as num).toDouble(),
      buildingId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['buildingId'],
      ),
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  String name;

  _i2.UnitsType unit;

  double currentStock;

  double thresholdStock;

  _i1.UuidValue buildingId;

  /// Returns a shallow copy of this [Ingredient]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Ingredient copyWith({
    _i1.UuidValue? id,
    String? name,
    _i2.UnitsType? unit,
    double? currentStock,
    double? thresholdStock,
    _i1.UuidValue? buildingId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Ingredient',
      'id': id.toJson(),
      'name': name,
      'unit': unit.toJson(),
      'currentStock': currentStock,
      'thresholdStock': thresholdStock,
      'buildingId': buildingId.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _IngredientImpl extends Ingredient {
  _IngredientImpl({
    _i1.UuidValue? id,
    required String name,
    required _i2.UnitsType unit,
    required double currentStock,
    required double thresholdStock,
    required _i1.UuidValue buildingId,
  }) : super._(
         id: id,
         name: name,
         unit: unit,
         currentStock: currentStock,
         thresholdStock: thresholdStock,
         buildingId: buildingId,
       );

  /// Returns a shallow copy of this [Ingredient]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Ingredient copyWith({
    _i1.UuidValue? id,
    String? name,
    _i2.UnitsType? unit,
    double? currentStock,
    double? thresholdStock,
    _i1.UuidValue? buildingId,
  }) {
    return Ingredient(
      id: id ?? this.id,
      name: name ?? this.name,
      unit: unit ?? this.unit,
      currentStock: currentStock ?? this.currentStock,
      thresholdStock: thresholdStock ?? this.thresholdStock,
      buildingId: buildingId ?? this.buildingId,
    );
  }
}
