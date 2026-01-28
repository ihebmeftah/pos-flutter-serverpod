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
import '../../stats/models/cash_register_summary.dart' as _i2;
import '../../stats/models/article_count.dart' as _i3;
import '../../stats/models/category_count.dart' as _i4;
import '../../stats/models/category_revenue.dart' as _i5;
import '../../stats/models/daily_revenue.dart' as _i6;
import '../../stats/models/hourly_revenue.dart' as _i7;
import '../../stats/models/employee_stats.dart' as _i8;
import 'package:pos_client/src/protocol/protocol.dart' as _i9;

abstract class BuildingDetailedStats implements _i1.SerializableModel {
  BuildingDetailedStats._({
    required this.buildingId,
    this.buildingName,
    required this.totalRevenue,
    required this.totalOrders,
    required this.averageOrderValue,
    required this.cashRegisterStats,
    required this.activeCashRegisters,
    required this.totalCashRegisters,
    required this.totalItemsSold,
    required this.topSellingArticles,
    required this.topSellingCategories,
    required this.revenueByCategory,
    required this.dailyRevenue,
    required this.hourlyDistribution,
    required this.topEmployees,
    required this.totalEmployees,
    required this.avgRevenuePerCashRegister,
    this.bestPerformingCashRegister,
    this.worstPerformingCashRegister,
  });

  factory BuildingDetailedStats({
    required _i1.UuidValue buildingId,
    String? buildingName,
    required double totalRevenue,
    required int totalOrders,
    required double averageOrderValue,
    required List<_i2.CashRegisterSummary> cashRegisterStats,
    required int activeCashRegisters,
    required int totalCashRegisters,
    required int totalItemsSold,
    required List<_i3.ArticleCount> topSellingArticles,
    required List<_i4.CategoryCount> topSellingCategories,
    required List<_i5.CategoryRevenue> revenueByCategory,
    required List<_i6.DailyRevenue> dailyRevenue,
    required List<_i7.HourlyRevenue> hourlyDistribution,
    required List<_i8.EmployeeStats> topEmployees,
    required int totalEmployees,
    required double avgRevenuePerCashRegister,
    _i2.CashRegisterSummary? bestPerformingCashRegister,
    _i2.CashRegisterSummary? worstPerformingCashRegister,
  }) = _BuildingDetailedStatsImpl;

  factory BuildingDetailedStats.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return BuildingDetailedStats(
      buildingId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['buildingId'],
      ),
      buildingName: jsonSerialization['buildingName'] as String?,
      totalRevenue: (jsonSerialization['totalRevenue'] as num).toDouble(),
      totalOrders: jsonSerialization['totalOrders'] as int,
      averageOrderValue: (jsonSerialization['averageOrderValue'] as num)
          .toDouble(),
      cashRegisterStats: _i9.Protocol()
          .deserialize<List<_i2.CashRegisterSummary>>(
            jsonSerialization['cashRegisterStats'],
          ),
      activeCashRegisters: jsonSerialization['activeCashRegisters'] as int,
      totalCashRegisters: jsonSerialization['totalCashRegisters'] as int,
      totalItemsSold: jsonSerialization['totalItemsSold'] as int,
      topSellingArticles: _i9.Protocol().deserialize<List<_i3.ArticleCount>>(
        jsonSerialization['topSellingArticles'],
      ),
      topSellingCategories: _i9.Protocol().deserialize<List<_i4.CategoryCount>>(
        jsonSerialization['topSellingCategories'],
      ),
      revenueByCategory: _i9.Protocol().deserialize<List<_i5.CategoryRevenue>>(
        jsonSerialization['revenueByCategory'],
      ),
      dailyRevenue: _i9.Protocol().deserialize<List<_i6.DailyRevenue>>(
        jsonSerialization['dailyRevenue'],
      ),
      hourlyDistribution: _i9.Protocol().deserialize<List<_i7.HourlyRevenue>>(
        jsonSerialization['hourlyDistribution'],
      ),
      topEmployees: _i9.Protocol().deserialize<List<_i8.EmployeeStats>>(
        jsonSerialization['topEmployees'],
      ),
      totalEmployees: jsonSerialization['totalEmployees'] as int,
      avgRevenuePerCashRegister:
          (jsonSerialization['avgRevenuePerCashRegister'] as num).toDouble(),
      bestPerformingCashRegister:
          jsonSerialization['bestPerformingCashRegister'] == null
          ? null
          : _i9.Protocol().deserialize<_i2.CashRegisterSummary>(
              jsonSerialization['bestPerformingCashRegister'],
            ),
      worstPerformingCashRegister:
          jsonSerialization['worstPerformingCashRegister'] == null
          ? null
          : _i9.Protocol().deserialize<_i2.CashRegisterSummary>(
              jsonSerialization['worstPerformingCashRegister'],
            ),
    );
  }

  _i1.UuidValue buildingId;

  String? buildingName;

  double totalRevenue;

  int totalOrders;

  double averageOrderValue;

  List<_i2.CashRegisterSummary> cashRegisterStats;

  int activeCashRegisters;

  int totalCashRegisters;

  int totalItemsSold;

  List<_i3.ArticleCount> topSellingArticles;

  List<_i4.CategoryCount> topSellingCategories;

  List<_i5.CategoryRevenue> revenueByCategory;

  List<_i6.DailyRevenue> dailyRevenue;

  List<_i7.HourlyRevenue> hourlyDistribution;

  List<_i8.EmployeeStats> topEmployees;

  int totalEmployees;

  double avgRevenuePerCashRegister;

  _i2.CashRegisterSummary? bestPerformingCashRegister;

  _i2.CashRegisterSummary? worstPerformingCashRegister;

  /// Returns a shallow copy of this [BuildingDetailedStats]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BuildingDetailedStats copyWith({
    _i1.UuidValue? buildingId,
    String? buildingName,
    double? totalRevenue,
    int? totalOrders,
    double? averageOrderValue,
    List<_i2.CashRegisterSummary>? cashRegisterStats,
    int? activeCashRegisters,
    int? totalCashRegisters,
    int? totalItemsSold,
    List<_i3.ArticleCount>? topSellingArticles,
    List<_i4.CategoryCount>? topSellingCategories,
    List<_i5.CategoryRevenue>? revenueByCategory,
    List<_i6.DailyRevenue>? dailyRevenue,
    List<_i7.HourlyRevenue>? hourlyDistribution,
    List<_i8.EmployeeStats>? topEmployees,
    int? totalEmployees,
    double? avgRevenuePerCashRegister,
    _i2.CashRegisterSummary? bestPerformingCashRegister,
    _i2.CashRegisterSummary? worstPerformingCashRegister,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BuildingDetailedStats',
      'buildingId': buildingId.toJson(),
      if (buildingName != null) 'buildingName': buildingName,
      'totalRevenue': totalRevenue,
      'totalOrders': totalOrders,
      'averageOrderValue': averageOrderValue,
      'cashRegisterStats': cashRegisterStats.toJson(
        valueToJson: (v) => v.toJson(),
      ),
      'activeCashRegisters': activeCashRegisters,
      'totalCashRegisters': totalCashRegisters,
      'totalItemsSold': totalItemsSold,
      'topSellingArticles': topSellingArticles.toJson(
        valueToJson: (v) => v.toJson(),
      ),
      'topSellingCategories': topSellingCategories.toJson(
        valueToJson: (v) => v.toJson(),
      ),
      'revenueByCategory': revenueByCategory.toJson(
        valueToJson: (v) => v.toJson(),
      ),
      'dailyRevenue': dailyRevenue.toJson(valueToJson: (v) => v.toJson()),
      'hourlyDistribution': hourlyDistribution.toJson(
        valueToJson: (v) => v.toJson(),
      ),
      'topEmployees': topEmployees.toJson(valueToJson: (v) => v.toJson()),
      'totalEmployees': totalEmployees,
      'avgRevenuePerCashRegister': avgRevenuePerCashRegister,
      if (bestPerformingCashRegister != null)
        'bestPerformingCashRegister': bestPerformingCashRegister?.toJson(),
      if (worstPerformingCashRegister != null)
        'worstPerformingCashRegister': worstPerformingCashRegister?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BuildingDetailedStatsImpl extends BuildingDetailedStats {
  _BuildingDetailedStatsImpl({
    required _i1.UuidValue buildingId,
    String? buildingName,
    required double totalRevenue,
    required int totalOrders,
    required double averageOrderValue,
    required List<_i2.CashRegisterSummary> cashRegisterStats,
    required int activeCashRegisters,
    required int totalCashRegisters,
    required int totalItemsSold,
    required List<_i3.ArticleCount> topSellingArticles,
    required List<_i4.CategoryCount> topSellingCategories,
    required List<_i5.CategoryRevenue> revenueByCategory,
    required List<_i6.DailyRevenue> dailyRevenue,
    required List<_i7.HourlyRevenue> hourlyDistribution,
    required List<_i8.EmployeeStats> topEmployees,
    required int totalEmployees,
    required double avgRevenuePerCashRegister,
    _i2.CashRegisterSummary? bestPerformingCashRegister,
    _i2.CashRegisterSummary? worstPerformingCashRegister,
  }) : super._(
         buildingId: buildingId,
         buildingName: buildingName,
         totalRevenue: totalRevenue,
         totalOrders: totalOrders,
         averageOrderValue: averageOrderValue,
         cashRegisterStats: cashRegisterStats,
         activeCashRegisters: activeCashRegisters,
         totalCashRegisters: totalCashRegisters,
         totalItemsSold: totalItemsSold,
         topSellingArticles: topSellingArticles,
         topSellingCategories: topSellingCategories,
         revenueByCategory: revenueByCategory,
         dailyRevenue: dailyRevenue,
         hourlyDistribution: hourlyDistribution,
         topEmployees: topEmployees,
         totalEmployees: totalEmployees,
         avgRevenuePerCashRegister: avgRevenuePerCashRegister,
         bestPerformingCashRegister: bestPerformingCashRegister,
         worstPerformingCashRegister: worstPerformingCashRegister,
       );

  /// Returns a shallow copy of this [BuildingDetailedStats]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BuildingDetailedStats copyWith({
    _i1.UuidValue? buildingId,
    Object? buildingName = _Undefined,
    double? totalRevenue,
    int? totalOrders,
    double? averageOrderValue,
    List<_i2.CashRegisterSummary>? cashRegisterStats,
    int? activeCashRegisters,
    int? totalCashRegisters,
    int? totalItemsSold,
    List<_i3.ArticleCount>? topSellingArticles,
    List<_i4.CategoryCount>? topSellingCategories,
    List<_i5.CategoryRevenue>? revenueByCategory,
    List<_i6.DailyRevenue>? dailyRevenue,
    List<_i7.HourlyRevenue>? hourlyDistribution,
    List<_i8.EmployeeStats>? topEmployees,
    int? totalEmployees,
    double? avgRevenuePerCashRegister,
    Object? bestPerformingCashRegister = _Undefined,
    Object? worstPerformingCashRegister = _Undefined,
  }) {
    return BuildingDetailedStats(
      buildingId: buildingId ?? this.buildingId,
      buildingName: buildingName is String? ? buildingName : this.buildingName,
      totalRevenue: totalRevenue ?? this.totalRevenue,
      totalOrders: totalOrders ?? this.totalOrders,
      averageOrderValue: averageOrderValue ?? this.averageOrderValue,
      cashRegisterStats:
          cashRegisterStats ??
          this.cashRegisterStats.map((e0) => e0.copyWith()).toList(),
      activeCashRegisters: activeCashRegisters ?? this.activeCashRegisters,
      totalCashRegisters: totalCashRegisters ?? this.totalCashRegisters,
      totalItemsSold: totalItemsSold ?? this.totalItemsSold,
      topSellingArticles:
          topSellingArticles ??
          this.topSellingArticles.map((e0) => e0.copyWith()).toList(),
      topSellingCategories:
          topSellingCategories ??
          this.topSellingCategories.map((e0) => e0.copyWith()).toList(),
      revenueByCategory:
          revenueByCategory ??
          this.revenueByCategory.map((e0) => e0.copyWith()).toList(),
      dailyRevenue:
          dailyRevenue ?? this.dailyRevenue.map((e0) => e0.copyWith()).toList(),
      hourlyDistribution:
          hourlyDistribution ??
          this.hourlyDistribution.map((e0) => e0.copyWith()).toList(),
      topEmployees:
          topEmployees ?? this.topEmployees.map((e0) => e0.copyWith()).toList(),
      totalEmployees: totalEmployees ?? this.totalEmployees,
      avgRevenuePerCashRegister:
          avgRevenuePerCashRegister ?? this.avgRevenuePerCashRegister,
      bestPerformingCashRegister:
          bestPerformingCashRegister is _i2.CashRegisterSummary?
          ? bestPerformingCashRegister
          : this.bestPerformingCashRegister?.copyWith(),
      worstPerformingCashRegister:
          worstPerformingCashRegister is _i2.CashRegisterSummary?
          ? worstPerformingCashRegister
          : this.worstPerformingCashRegister?.copyWith(),
    );
  }
}
