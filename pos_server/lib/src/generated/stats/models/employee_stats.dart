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

abstract class EmployeeStats
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  EmployeeStats._({
    required this.employeeId,
    required this.employeeName,
    required this.totalOrders,
    required this.totalRevenue,
    required this.averageOrderValue,
    required this.itemsSold,
  });

  factory EmployeeStats({
    required _i1.UuidValue employeeId,
    required String employeeName,
    required int totalOrders,
    required double totalRevenue,
    required double averageOrderValue,
    required int itemsSold,
  }) = _EmployeeStatsImpl;

  factory EmployeeStats.fromJson(Map<String, dynamic> jsonSerialization) {
    return EmployeeStats(
      employeeId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['employeeId'],
      ),
      employeeName: jsonSerialization['employeeName'] as String,
      totalOrders: jsonSerialization['totalOrders'] as int,
      totalRevenue: (jsonSerialization['totalRevenue'] as num).toDouble(),
      averageOrderValue: (jsonSerialization['averageOrderValue'] as num)
          .toDouble(),
      itemsSold: jsonSerialization['itemsSold'] as int,
    );
  }

  _i1.UuidValue employeeId;

  String employeeName;

  int totalOrders;

  double totalRevenue;

  double averageOrderValue;

  int itemsSold;

  /// Returns a shallow copy of this [EmployeeStats]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EmployeeStats copyWith({
    _i1.UuidValue? employeeId,
    String? employeeName,
    int? totalOrders,
    double? totalRevenue,
    double? averageOrderValue,
    int? itemsSold,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EmployeeStats',
      'employeeId': employeeId.toJson(),
      'employeeName': employeeName,
      'totalOrders': totalOrders,
      'totalRevenue': totalRevenue,
      'averageOrderValue': averageOrderValue,
      'itemsSold': itemsSold,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'EmployeeStats',
      'employeeId': employeeId.toJson(),
      'employeeName': employeeName,
      'totalOrders': totalOrders,
      'totalRevenue': totalRevenue,
      'averageOrderValue': averageOrderValue,
      'itemsSold': itemsSold,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _EmployeeStatsImpl extends EmployeeStats {
  _EmployeeStatsImpl({
    required _i1.UuidValue employeeId,
    required String employeeName,
    required int totalOrders,
    required double totalRevenue,
    required double averageOrderValue,
    required int itemsSold,
  }) : super._(
         employeeId: employeeId,
         employeeName: employeeName,
         totalOrders: totalOrders,
         totalRevenue: totalRevenue,
         averageOrderValue: averageOrderValue,
         itemsSold: itemsSold,
       );

  /// Returns a shallow copy of this [EmployeeStats]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EmployeeStats copyWith({
    _i1.UuidValue? employeeId,
    String? employeeName,
    int? totalOrders,
    double? totalRevenue,
    double? averageOrderValue,
    int? itemsSold,
  }) {
    return EmployeeStats(
      employeeId: employeeId ?? this.employeeId,
      employeeName: employeeName ?? this.employeeName,
      totalOrders: totalOrders ?? this.totalOrders,
      totalRevenue: totalRevenue ?? this.totalRevenue,
      averageOrderValue: averageOrderValue ?? this.averageOrderValue,
      itemsSold: itemsSold ?? this.itemsSold,
    );
  }
}
