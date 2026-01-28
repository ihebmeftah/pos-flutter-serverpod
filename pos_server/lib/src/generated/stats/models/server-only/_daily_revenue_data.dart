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

abstract class DailyRevenueData
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  DailyRevenueData._({
    double? revenue,
    int? orderCount,
    int? itemsSold,
  }) : revenue = revenue ?? 0.0,
       orderCount = orderCount ?? 0,
       itemsSold = itemsSold ?? 0;

  factory DailyRevenueData({
    double? revenue,
    int? orderCount,
    int? itemsSold,
  }) = _DailyRevenueDataImpl;

  factory DailyRevenueData.fromJson(Map<String, dynamic> jsonSerialization) {
    return DailyRevenueData(
      revenue: (jsonSerialization['revenue'] as num?)?.toDouble(),
      orderCount: jsonSerialization['orderCount'] as int?,
      itemsSold: jsonSerialization['itemsSold'] as int?,
    );
  }

  double revenue;

  int orderCount;

  int itemsSold;

  /// Returns a shallow copy of this [DailyRevenueData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DailyRevenueData copyWith({
    double? revenue,
    int? orderCount,
    int? itemsSold,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DailyRevenueData',
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

class _DailyRevenueDataImpl extends DailyRevenueData {
  _DailyRevenueDataImpl({
    double? revenue,
    int? orderCount,
    int? itemsSold,
  }) : super._(
         revenue: revenue,
         orderCount: orderCount,
         itemsSold: itemsSold,
       );

  /// Returns a shallow copy of this [DailyRevenueData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DailyRevenueData copyWith({
    double? revenue,
    int? orderCount,
    int? itemsSold,
  }) {
    return DailyRevenueData(
      revenue: revenue ?? this.revenue,
      orderCount: orderCount ?? this.orderCount,
      itemsSold: itemsSold ?? this.itemsSold,
    );
  }
}
