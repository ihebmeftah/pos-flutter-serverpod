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
import '../../stats/models/article_count.dart' as _i2;
import '../../stats/models/category_count.dart' as _i3;
import '../../stats/models/category_revenue.dart' as _i4;
import '../../stats/models/hourly_revenue.dart' as _i5;
import '../../stats/models/employee_stats.dart' as _i6;
import 'package:pos_server/src/generated/protocol.dart' as _i7;

abstract class CashRegisterStats
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CashRegisterStats._({
    required this.cashRegisterId,
    required this.startTime,
    this.endTime,
    required this.isClosed,
    required this.totalRevenue,
    required this.startAmount,
    required this.endAmount,
    required this.expectedEndAmount,
    required this.cashDifference,
    required this.totalOrders,
    required this.completedOrders,
    required this.cancelledOrders,
    required this.averageOrderValue,
    required this.totalItemsSold,
    required this.totalItemsCancelled,
    required this.topSellingArticles,
    required this.topSellingCategories,
    required this.revenueByCategory,
    required this.hourlyRevenue,
    this.peakHour,
    this.employeeStats,
  });

  factory CashRegisterStats({
    required _i1.UuidValue cashRegisterId,
    required DateTime startTime,
    DateTime? endTime,
    required bool isClosed,
    required double totalRevenue,
    required double startAmount,
    required double endAmount,
    required double expectedEndAmount,
    required double cashDifference,
    required int totalOrders,
    required int completedOrders,
    required int cancelledOrders,
    required double averageOrderValue,
    required int totalItemsSold,
    required int totalItemsCancelled,
    required List<_i2.ArticleCount> topSellingArticles,
    required List<_i3.CategoryCount> topSellingCategories,
    required List<_i4.CategoryRevenue> revenueByCategory,
    required List<_i5.HourlyRevenue> hourlyRevenue,
    String? peakHour,
    List<_i6.EmployeeStats>? employeeStats,
  }) = _CashRegisterStatsImpl;

  factory CashRegisterStats.fromJson(Map<String, dynamic> jsonSerialization) {
    return CashRegisterStats(
      cashRegisterId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['cashRegisterId'],
      ),
      startTime: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['startTime'],
      ),
      endTime: jsonSerialization['endTime'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['endTime']),
      isClosed: jsonSerialization['isClosed'] as bool,
      totalRevenue: (jsonSerialization['totalRevenue'] as num).toDouble(),
      startAmount: (jsonSerialization['startAmount'] as num).toDouble(),
      endAmount: (jsonSerialization['endAmount'] as num).toDouble(),
      expectedEndAmount: (jsonSerialization['expectedEndAmount'] as num)
          .toDouble(),
      cashDifference: (jsonSerialization['cashDifference'] as num).toDouble(),
      totalOrders: jsonSerialization['totalOrders'] as int,
      completedOrders: jsonSerialization['completedOrders'] as int,
      cancelledOrders: jsonSerialization['cancelledOrders'] as int,
      averageOrderValue: (jsonSerialization['averageOrderValue'] as num)
          .toDouble(),
      totalItemsSold: jsonSerialization['totalItemsSold'] as int,
      totalItemsCancelled: jsonSerialization['totalItemsCancelled'] as int,
      topSellingArticles: _i7.Protocol().deserialize<List<_i2.ArticleCount>>(
        jsonSerialization['topSellingArticles'],
      ),
      topSellingCategories: _i7.Protocol().deserialize<List<_i3.CategoryCount>>(
        jsonSerialization['topSellingCategories'],
      ),
      revenueByCategory: _i7.Protocol().deserialize<List<_i4.CategoryRevenue>>(
        jsonSerialization['revenueByCategory'],
      ),
      hourlyRevenue: _i7.Protocol().deserialize<List<_i5.HourlyRevenue>>(
        jsonSerialization['hourlyRevenue'],
      ),
      peakHour: jsonSerialization['peakHour'] as String?,
      employeeStats: jsonSerialization['employeeStats'] == null
          ? null
          : _i7.Protocol().deserialize<List<_i6.EmployeeStats>>(
              jsonSerialization['employeeStats'],
            ),
    );
  }

  _i1.UuidValue cashRegisterId;

  DateTime startTime;

  DateTime? endTime;

  bool isClosed;

  double totalRevenue;

  double startAmount;

  double endAmount;

  double expectedEndAmount;

  double cashDifference;

  int totalOrders;

  int completedOrders;

  int cancelledOrders;

  double averageOrderValue;

  int totalItemsSold;

  int totalItemsCancelled;

  List<_i2.ArticleCount> topSellingArticles;

  List<_i3.CategoryCount> topSellingCategories;

  List<_i4.CategoryRevenue> revenueByCategory;

  List<_i5.HourlyRevenue> hourlyRevenue;

  String? peakHour;

  List<_i6.EmployeeStats>? employeeStats;

  /// Returns a shallow copy of this [CashRegisterStats]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CashRegisterStats copyWith({
    _i1.UuidValue? cashRegisterId,
    DateTime? startTime,
    DateTime? endTime,
    bool? isClosed,
    double? totalRevenue,
    double? startAmount,
    double? endAmount,
    double? expectedEndAmount,
    double? cashDifference,
    int? totalOrders,
    int? completedOrders,
    int? cancelledOrders,
    double? averageOrderValue,
    int? totalItemsSold,
    int? totalItemsCancelled,
    List<_i2.ArticleCount>? topSellingArticles,
    List<_i3.CategoryCount>? topSellingCategories,
    List<_i4.CategoryRevenue>? revenueByCategory,
    List<_i5.HourlyRevenue>? hourlyRevenue,
    String? peakHour,
    List<_i6.EmployeeStats>? employeeStats,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CashRegisterStats',
      'cashRegisterId': cashRegisterId.toJson(),
      'startTime': startTime.toJson(),
      if (endTime != null) 'endTime': endTime?.toJson(),
      'isClosed': isClosed,
      'totalRevenue': totalRevenue,
      'startAmount': startAmount,
      'endAmount': endAmount,
      'expectedEndAmount': expectedEndAmount,
      'cashDifference': cashDifference,
      'totalOrders': totalOrders,
      'completedOrders': completedOrders,
      'cancelledOrders': cancelledOrders,
      'averageOrderValue': averageOrderValue,
      'totalItemsSold': totalItemsSold,
      'totalItemsCancelled': totalItemsCancelled,
      'topSellingArticles': topSellingArticles.toJson(
        valueToJson: (v) => v.toJson(),
      ),
      'topSellingCategories': topSellingCategories.toJson(
        valueToJson: (v) => v.toJson(),
      ),
      'revenueByCategory': revenueByCategory.toJson(
        valueToJson: (v) => v.toJson(),
      ),
      'hourlyRevenue': hourlyRevenue.toJson(valueToJson: (v) => v.toJson()),
      if (peakHour != null) 'peakHour': peakHour,
      if (employeeStats != null)
        'employeeStats': employeeStats?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CashRegisterStats',
      'cashRegisterId': cashRegisterId.toJson(),
      'startTime': startTime.toJson(),
      if (endTime != null) 'endTime': endTime?.toJson(),
      'isClosed': isClosed,
      'totalRevenue': totalRevenue,
      'startAmount': startAmount,
      'endAmount': endAmount,
      'expectedEndAmount': expectedEndAmount,
      'cashDifference': cashDifference,
      'totalOrders': totalOrders,
      'completedOrders': completedOrders,
      'cancelledOrders': cancelledOrders,
      'averageOrderValue': averageOrderValue,
      'totalItemsSold': totalItemsSold,
      'totalItemsCancelled': totalItemsCancelled,
      'topSellingArticles': topSellingArticles.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
      'topSellingCategories': topSellingCategories.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
      'revenueByCategory': revenueByCategory.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
      'hourlyRevenue': hourlyRevenue.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
      if (peakHour != null) 'peakHour': peakHour,
      if (employeeStats != null)
        'employeeStats': employeeStats?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CashRegisterStatsImpl extends CashRegisterStats {
  _CashRegisterStatsImpl({
    required _i1.UuidValue cashRegisterId,
    required DateTime startTime,
    DateTime? endTime,
    required bool isClosed,
    required double totalRevenue,
    required double startAmount,
    required double endAmount,
    required double expectedEndAmount,
    required double cashDifference,
    required int totalOrders,
    required int completedOrders,
    required int cancelledOrders,
    required double averageOrderValue,
    required int totalItemsSold,
    required int totalItemsCancelled,
    required List<_i2.ArticleCount> topSellingArticles,
    required List<_i3.CategoryCount> topSellingCategories,
    required List<_i4.CategoryRevenue> revenueByCategory,
    required List<_i5.HourlyRevenue> hourlyRevenue,
    String? peakHour,
    List<_i6.EmployeeStats>? employeeStats,
  }) : super._(
         cashRegisterId: cashRegisterId,
         startTime: startTime,
         endTime: endTime,
         isClosed: isClosed,
         totalRevenue: totalRevenue,
         startAmount: startAmount,
         endAmount: endAmount,
         expectedEndAmount: expectedEndAmount,
         cashDifference: cashDifference,
         totalOrders: totalOrders,
         completedOrders: completedOrders,
         cancelledOrders: cancelledOrders,
         averageOrderValue: averageOrderValue,
         totalItemsSold: totalItemsSold,
         totalItemsCancelled: totalItemsCancelled,
         topSellingArticles: topSellingArticles,
         topSellingCategories: topSellingCategories,
         revenueByCategory: revenueByCategory,
         hourlyRevenue: hourlyRevenue,
         peakHour: peakHour,
         employeeStats: employeeStats,
       );

  /// Returns a shallow copy of this [CashRegisterStats]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CashRegisterStats copyWith({
    _i1.UuidValue? cashRegisterId,
    DateTime? startTime,
    Object? endTime = _Undefined,
    bool? isClosed,
    double? totalRevenue,
    double? startAmount,
    double? endAmount,
    double? expectedEndAmount,
    double? cashDifference,
    int? totalOrders,
    int? completedOrders,
    int? cancelledOrders,
    double? averageOrderValue,
    int? totalItemsSold,
    int? totalItemsCancelled,
    List<_i2.ArticleCount>? topSellingArticles,
    List<_i3.CategoryCount>? topSellingCategories,
    List<_i4.CategoryRevenue>? revenueByCategory,
    List<_i5.HourlyRevenue>? hourlyRevenue,
    Object? peakHour = _Undefined,
    Object? employeeStats = _Undefined,
  }) {
    return CashRegisterStats(
      cashRegisterId: cashRegisterId ?? this.cashRegisterId,
      startTime: startTime ?? this.startTime,
      endTime: endTime is DateTime? ? endTime : this.endTime,
      isClosed: isClosed ?? this.isClosed,
      totalRevenue: totalRevenue ?? this.totalRevenue,
      startAmount: startAmount ?? this.startAmount,
      endAmount: endAmount ?? this.endAmount,
      expectedEndAmount: expectedEndAmount ?? this.expectedEndAmount,
      cashDifference: cashDifference ?? this.cashDifference,
      totalOrders: totalOrders ?? this.totalOrders,
      completedOrders: completedOrders ?? this.completedOrders,
      cancelledOrders: cancelledOrders ?? this.cancelledOrders,
      averageOrderValue: averageOrderValue ?? this.averageOrderValue,
      totalItemsSold: totalItemsSold ?? this.totalItemsSold,
      totalItemsCancelled: totalItemsCancelled ?? this.totalItemsCancelled,
      topSellingArticles:
          topSellingArticles ??
          this.topSellingArticles.map((e0) => e0.copyWith()).toList(),
      topSellingCategories:
          topSellingCategories ??
          this.topSellingCategories.map((e0) => e0.copyWith()).toList(),
      revenueByCategory:
          revenueByCategory ??
          this.revenueByCategory.map((e0) => e0.copyWith()).toList(),
      hourlyRevenue:
          hourlyRevenue ??
          this.hourlyRevenue.map((e0) => e0.copyWith()).toList(),
      peakHour: peakHour is String? ? peakHour : this.peakHour,
      employeeStats: employeeStats is List<_i6.EmployeeStats>?
          ? employeeStats
          : this.employeeStats?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
