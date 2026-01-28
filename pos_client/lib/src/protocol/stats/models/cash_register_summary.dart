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

abstract class CashRegisterSummary implements _i1.SerializableModel {
  CashRegisterSummary._({
    required this.cashRegisterId,
    required this.startTime,
    this.endTime,
    required this.isClosed,
    required this.totalRevenue,
    required this.totalOrders,
    required this.totalItemsSold,
    required this.averageOrderValue,
  });

  factory CashRegisterSummary({
    required _i1.UuidValue cashRegisterId,
    required DateTime startTime,
    DateTime? endTime,
    required bool isClosed,
    required double totalRevenue,
    required int totalOrders,
    required int totalItemsSold,
    required double averageOrderValue,
  }) = _CashRegisterSummaryImpl;

  factory CashRegisterSummary.fromJson(Map<String, dynamic> jsonSerialization) {
    return CashRegisterSummary(
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
      totalOrders: jsonSerialization['totalOrders'] as int,
      totalItemsSold: jsonSerialization['totalItemsSold'] as int,
      averageOrderValue: (jsonSerialization['averageOrderValue'] as num)
          .toDouble(),
    );
  }

  _i1.UuidValue cashRegisterId;

  DateTime startTime;

  DateTime? endTime;

  bool isClosed;

  double totalRevenue;

  int totalOrders;

  int totalItemsSold;

  double averageOrderValue;

  /// Returns a shallow copy of this [CashRegisterSummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CashRegisterSummary copyWith({
    _i1.UuidValue? cashRegisterId,
    DateTime? startTime,
    DateTime? endTime,
    bool? isClosed,
    double? totalRevenue,
    int? totalOrders,
    int? totalItemsSold,
    double? averageOrderValue,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CashRegisterSummary',
      'cashRegisterId': cashRegisterId.toJson(),
      'startTime': startTime.toJson(),
      if (endTime != null) 'endTime': endTime?.toJson(),
      'isClosed': isClosed,
      'totalRevenue': totalRevenue,
      'totalOrders': totalOrders,
      'totalItemsSold': totalItemsSold,
      'averageOrderValue': averageOrderValue,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CashRegisterSummaryImpl extends CashRegisterSummary {
  _CashRegisterSummaryImpl({
    required _i1.UuidValue cashRegisterId,
    required DateTime startTime,
    DateTime? endTime,
    required bool isClosed,
    required double totalRevenue,
    required int totalOrders,
    required int totalItemsSold,
    required double averageOrderValue,
  }) : super._(
         cashRegisterId: cashRegisterId,
         startTime: startTime,
         endTime: endTime,
         isClosed: isClosed,
         totalRevenue: totalRevenue,
         totalOrders: totalOrders,
         totalItemsSold: totalItemsSold,
         averageOrderValue: averageOrderValue,
       );

  /// Returns a shallow copy of this [CashRegisterSummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CashRegisterSummary copyWith({
    _i1.UuidValue? cashRegisterId,
    DateTime? startTime,
    Object? endTime = _Undefined,
    bool? isClosed,
    double? totalRevenue,
    int? totalOrders,
    int? totalItemsSold,
    double? averageOrderValue,
  }) {
    return CashRegisterSummary(
      cashRegisterId: cashRegisterId ?? this.cashRegisterId,
      startTime: startTime ?? this.startTime,
      endTime: endTime is DateTime? ? endTime : this.endTime,
      isClosed: isClosed ?? this.isClosed,
      totalRevenue: totalRevenue ?? this.totalRevenue,
      totalOrders: totalOrders ?? this.totalOrders,
      totalItemsSold: totalItemsSold ?? this.totalItemsSold,
      averageOrderValue: averageOrderValue ?? this.averageOrderValue,
    );
  }
}
