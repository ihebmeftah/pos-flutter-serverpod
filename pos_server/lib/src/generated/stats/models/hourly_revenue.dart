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

abstract class HourlyRevenue
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  HourlyRevenue._({
    required this.hour,
    required this.revenue,
    required this.orderCount,
    required this.itemsSold,
  });

  factory HourlyRevenue({
    required int hour,
    required double revenue,
    required int orderCount,
    required int itemsSold,
  }) = _HourlyRevenueImpl;

  factory HourlyRevenue.fromJson(Map<String, dynamic> jsonSerialization) {
    return HourlyRevenue(
      hour: jsonSerialization['hour'] as int,
      revenue: (jsonSerialization['revenue'] as num).toDouble(),
      orderCount: jsonSerialization['orderCount'] as int,
      itemsSold: jsonSerialization['itemsSold'] as int,
    );
  }

  int hour;

  double revenue;

  int orderCount;

  int itemsSold;

  /// Returns a shallow copy of this [HourlyRevenue]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  HourlyRevenue copyWith({
    int? hour,
    double? revenue,
    int? orderCount,
    int? itemsSold,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'HourlyRevenue',
      'hour': hour,
      'revenue': revenue,
      'orderCount': orderCount,
      'itemsSold': itemsSold,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'HourlyRevenue',
      'hour': hour,
      'revenue': revenue,
      'orderCount': orderCount,
      'itemsSold': itemsSold,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _HourlyRevenueImpl extends HourlyRevenue {
  _HourlyRevenueImpl({
    required int hour,
    required double revenue,
    required int orderCount,
    required int itemsSold,
  }) : super._(
         hour: hour,
         revenue: revenue,
         orderCount: orderCount,
         itemsSold: itemsSold,
       );

  /// Returns a shallow copy of this [HourlyRevenue]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  HourlyRevenue copyWith({
    int? hour,
    double? revenue,
    int? orderCount,
    int? itemsSold,
  }) {
    return HourlyRevenue(
      hour: hour ?? this.hour,
      revenue: revenue ?? this.revenue,
      orderCount: orderCount ?? this.orderCount,
      itemsSold: itemsSold ?? this.itemsSold,
    );
  }
}
