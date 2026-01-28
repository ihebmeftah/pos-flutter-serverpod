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

abstract class CashRegisterStatsData
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CashRegisterStatsData._({
    required this.cashRegisterId,
    required this.startTime,
    this.endTime,
    required this.isClosed,
    double? revenue,
    int? orderCount,
    int? itemsSold,
  }) : revenue = revenue ?? 0.0,
       orderCount = orderCount ?? 0,
       itemsSold = itemsSold ?? 0;

  factory CashRegisterStatsData({
    required _i1.UuidValue cashRegisterId,
    required DateTime startTime,
    DateTime? endTime,
    required bool isClosed,
    double? revenue,
    int? orderCount,
    int? itemsSold,
  }) = _CashRegisterStatsDataImpl;

  factory CashRegisterStatsData.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CashRegisterStatsData(
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
      revenue: (jsonSerialization['revenue'] as num?)?.toDouble(),
      orderCount: jsonSerialization['orderCount'] as int?,
      itemsSold: jsonSerialization['itemsSold'] as int?,
    );
  }

  _i1.UuidValue cashRegisterId;

  DateTime startTime;

  DateTime? endTime;

  bool isClosed;

  double revenue;

  int orderCount;

  int itemsSold;

  /// Returns a shallow copy of this [CashRegisterStatsData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CashRegisterStatsData copyWith({
    _i1.UuidValue? cashRegisterId,
    DateTime? startTime,
    DateTime? endTime,
    bool? isClosed,
    double? revenue,
    int? orderCount,
    int? itemsSold,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CashRegisterStatsData',
      'cashRegisterId': cashRegisterId.toJson(),
      'startTime': startTime.toJson(),
      if (endTime != null) 'endTime': endTime?.toJson(),
      'isClosed': isClosed,
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

class _Undefined {}

class _CashRegisterStatsDataImpl extends CashRegisterStatsData {
  _CashRegisterStatsDataImpl({
    required _i1.UuidValue cashRegisterId,
    required DateTime startTime,
    DateTime? endTime,
    required bool isClosed,
    double? revenue,
    int? orderCount,
    int? itemsSold,
  }) : super._(
         cashRegisterId: cashRegisterId,
         startTime: startTime,
         endTime: endTime,
         isClosed: isClosed,
         revenue: revenue,
         orderCount: orderCount,
         itemsSold: itemsSold,
       );

  /// Returns a shallow copy of this [CashRegisterStatsData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CashRegisterStatsData copyWith({
    _i1.UuidValue? cashRegisterId,
    DateTime? startTime,
    Object? endTime = _Undefined,
    bool? isClosed,
    double? revenue,
    int? orderCount,
    int? itemsSold,
  }) {
    return CashRegisterStatsData(
      cashRegisterId: cashRegisterId ?? this.cashRegisterId,
      startTime: startTime ?? this.startTime,
      endTime: endTime is DateTime? ? endTime : this.endTime,
      isClosed: isClosed ?? this.isClosed,
      revenue: revenue ?? this.revenue,
      orderCount: orderCount ?? this.orderCount,
      itemsSold: itemsSold ?? this.itemsSold,
    );
  }
}
