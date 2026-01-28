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

abstract class HourlyRevenueData
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  HourlyRevenueData._({
    double? revenue,
    int? orderCount,
    int? itemsSold,
  }) : revenue = revenue ?? 0.0,
       orderCount = orderCount ?? 0,
       itemsSold = itemsSold ?? 0;

  factory HourlyRevenueData({
    double? revenue,
    int? orderCount,
    int? itemsSold,
  }) = _HourlyRevenueDataImpl;

  factory HourlyRevenueData.fromJson(Map<String, dynamic> jsonSerialization) {
    return HourlyRevenueData(
      revenue: (jsonSerialization['revenue'] as num?)?.toDouble(),
      orderCount: jsonSerialization['orderCount'] as int?,
      itemsSold: jsonSerialization['itemsSold'] as int?,
    );
  }

  double revenue;

  int orderCount;

  int itemsSold;

  /// Returns a shallow copy of this [HourlyRevenueData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  HourlyRevenueData copyWith({
    double? revenue,
    int? orderCount,
    int? itemsSold,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'HourlyRevenueData',
      'revenue': revenue,
      'orderCount': orderCount,
      'itemsSold': itemsSold,
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

class _HourlyRevenueDataImpl extends HourlyRevenueData {
  _HourlyRevenueDataImpl({
    double? revenue,
    int? orderCount,
    int? itemsSold,
  }) : super._(
         revenue: revenue,
         orderCount: orderCount,
         itemsSold: itemsSold,
       );

  /// Returns a shallow copy of this [HourlyRevenueData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  HourlyRevenueData copyWith({
    double? revenue,
    int? orderCount,
    int? itemsSold,
  }) {
    return HourlyRevenueData(
      revenue: revenue ?? this.revenue,
      orderCount: orderCount ?? this.orderCount,
      itemsSold: itemsSold ?? this.itemsSold,
    );
  }
}
