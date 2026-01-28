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
import '../../cateogrie/entity/categorie.dart' as _i2;
import 'package:pos_server/src/generated/protocol.dart' as _i3;

abstract class CategoryRevenue
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CategoryRevenue._({
    required this.category,
    required this.totalRevenue,
    required this.itemsSold,
    required this.orderCount,
    required this.percentageOfTotal,
  });

  factory CategoryRevenue({
    required _i2.Categorie category,
    required double totalRevenue,
    required int itemsSold,
    required int orderCount,
    required double percentageOfTotal,
  }) = _CategoryRevenueImpl;

  factory CategoryRevenue.fromJson(Map<String, dynamic> jsonSerialization) {
    return CategoryRevenue(
      category: _i3.Protocol().deserialize<_i2.Categorie>(
        jsonSerialization['category'],
      ),
      totalRevenue: (jsonSerialization['totalRevenue'] as num).toDouble(),
      itemsSold: jsonSerialization['itemsSold'] as int,
      orderCount: jsonSerialization['orderCount'] as int,
      percentageOfTotal: (jsonSerialization['percentageOfTotal'] as num)
          .toDouble(),
    );
  }

  _i2.Categorie category;

  double totalRevenue;

  int itemsSold;

  int orderCount;

  double percentageOfTotal;

  /// Returns a shallow copy of this [CategoryRevenue]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CategoryRevenue copyWith({
    _i2.Categorie? category,
    double? totalRevenue,
    int? itemsSold,
    int? orderCount,
    double? percentageOfTotal,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CategoryRevenue',
      'category': category.toJson(),
      'totalRevenue': totalRevenue,
      'itemsSold': itemsSold,
      'orderCount': orderCount,
      'percentageOfTotal': percentageOfTotal,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CategoryRevenue',
      'category': category.toJsonForProtocol(),
      'totalRevenue': totalRevenue,
      'itemsSold': itemsSold,
      'orderCount': orderCount,
      'percentageOfTotal': percentageOfTotal,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CategoryRevenueImpl extends CategoryRevenue {
  _CategoryRevenueImpl({
    required _i2.Categorie category,
    required double totalRevenue,
    required int itemsSold,
    required int orderCount,
    required double percentageOfTotal,
  }) : super._(
         category: category,
         totalRevenue: totalRevenue,
         itemsSold: itemsSold,
         orderCount: orderCount,
         percentageOfTotal: percentageOfTotal,
       );

  /// Returns a shallow copy of this [CategoryRevenue]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CategoryRevenue copyWith({
    _i2.Categorie? category,
    double? totalRevenue,
    int? itemsSold,
    int? orderCount,
    double? percentageOfTotal,
  }) {
    return CategoryRevenue(
      category: category ?? this.category.copyWith(),
      totalRevenue: totalRevenue ?? this.totalRevenue,
      itemsSold: itemsSold ?? this.itemsSold,
      orderCount: orderCount ?? this.orderCount,
      percentageOfTotal: percentageOfTotal ?? this.percentageOfTotal,
    );
  }
}
