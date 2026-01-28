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
import '../../../cateogrie/entity/categorie.dart' as _i2;
import 'package:pos_server/src/generated/protocol.dart' as _i3;

abstract class CategoryRevenueData
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CategoryRevenueData._({
    required this.category,
    double? revenue,
    int? itemsSold,
    required this.orderIds,
  }) : revenue = revenue ?? 0.0,
       itemsSold = itemsSold ?? 0;

  factory CategoryRevenueData({
    required _i2.Categorie category,
    double? revenue,
    int? itemsSold,
    required List<String> orderIds,
  }) = _CategoryRevenueDataImpl;

  factory CategoryRevenueData.fromJson(Map<String, dynamic> jsonSerialization) {
    return CategoryRevenueData(
      category: _i3.Protocol().deserialize<_i2.Categorie>(
        jsonSerialization['category'],
      ),
      revenue: (jsonSerialization['revenue'] as num?)?.toDouble(),
      itemsSold: jsonSerialization['itemsSold'] as int?,
      orderIds: _i3.Protocol().deserialize<List<String>>(
        jsonSerialization['orderIds'],
      ),
    );
  }

  _i2.Categorie category;

  double revenue;

  int itemsSold;

  List<String> orderIds;

  /// Returns a shallow copy of this [CategoryRevenueData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CategoryRevenueData copyWith({
    _i2.Categorie? category,
    double? revenue,
    int? itemsSold,
    List<String>? orderIds,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CategoryRevenueData',
      'category': category.toJson(),
      'revenue': revenue,
      'itemsSold': itemsSold,
      'orderIds': orderIds.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CategoryRevenueDataImpl extends CategoryRevenueData {
  _CategoryRevenueDataImpl({
    required _i2.Categorie category,
    double? revenue,
    int? itemsSold,
    required List<String> orderIds,
  }) : super._(
         category: category,
         revenue: revenue,
         itemsSold: itemsSold,
         orderIds: orderIds,
       );

  /// Returns a shallow copy of this [CategoryRevenueData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CategoryRevenueData copyWith({
    _i2.Categorie? category,
    double? revenue,
    int? itemsSold,
    List<String>? orderIds,
  }) {
    return CategoryRevenueData(
      category: category ?? this.category.copyWith(),
      revenue: revenue ?? this.revenue,
      itemsSold: itemsSold ?? this.itemsSold,
      orderIds: orderIds ?? this.orderIds.map((e0) => e0).toList(),
    );
  }
}
