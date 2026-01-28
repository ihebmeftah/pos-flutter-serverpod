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

abstract class EmployeeStatsData
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  EmployeeStatsData._({
    required this.employeeId,
    required this.employeeName,
    double? revenue,
    int? orderCount,
    int? itemsSold,
  }) : revenue = revenue ?? 0.0,
       orderCount = orderCount ?? 0,
       itemsSold = itemsSold ?? 0;

  factory EmployeeStatsData({
    required _i1.UuidValue employeeId,
    required String employeeName,
    double? revenue,
    int? orderCount,
    int? itemsSold,
  }) = _EmployeeStatsDataImpl;

  factory EmployeeStatsData.fromJson(Map<String, dynamic> jsonSerialization) {
    return EmployeeStatsData(
      employeeId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['employeeId'],
      ),
      employeeName: jsonSerialization['employeeName'] as String,
      revenue: (jsonSerialization['revenue'] as num?)?.toDouble(),
      orderCount: jsonSerialization['orderCount'] as int?,
      itemsSold: jsonSerialization['itemsSold'] as int?,
    );
  }

  _i1.UuidValue employeeId;

  String employeeName;

  double revenue;

  int orderCount;

  int itemsSold;

  /// Returns a shallow copy of this [EmployeeStatsData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EmployeeStatsData copyWith({
    _i1.UuidValue? employeeId,
    String? employeeName,
    double? revenue,
    int? orderCount,
    int? itemsSold,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EmployeeStatsData',
      'employeeId': employeeId.toJson(),
      'employeeName': employeeName,
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

class _EmployeeStatsDataImpl extends EmployeeStatsData {
  _EmployeeStatsDataImpl({
    required _i1.UuidValue employeeId,
    required String employeeName,
    double? revenue,
    int? orderCount,
    int? itemsSold,
  }) : super._(
         employeeId: employeeId,
         employeeName: employeeName,
         revenue: revenue,
         orderCount: orderCount,
         itemsSold: itemsSold,
       );

  /// Returns a shallow copy of this [EmployeeStatsData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EmployeeStatsData copyWith({
    _i1.UuidValue? employeeId,
    String? employeeName,
    double? revenue,
    int? orderCount,
    int? itemsSold,
  }) {
    return EmployeeStatsData(
      employeeId: employeeId ?? this.employeeId,
      employeeName: employeeName ?? this.employeeName,
      revenue: revenue ?? this.revenue,
      orderCount: orderCount ?? this.orderCount,
      itemsSold: itemsSold ?? this.itemsSold,
    );
  }
}
