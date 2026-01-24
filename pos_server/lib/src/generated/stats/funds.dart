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

abstract class Funds
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  Funds._({
    required this.totalSales,
    required this.avgOrderValue,
  });

  factory Funds({
    required double totalSales,
    required double avgOrderValue,
  }) = _FundsImpl;

  factory Funds.fromJson(Map<String, dynamic> jsonSerialization) {
    return Funds(
      totalSales: (jsonSerialization['totalSales'] as num).toDouble(),
      avgOrderValue: (jsonSerialization['avgOrderValue'] as num).toDouble(),
    );
  }

  double totalSales;

  double avgOrderValue;

  /// Returns a shallow copy of this [Funds]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Funds copyWith({
    double? totalSales,
    double? avgOrderValue,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Funds',
      'totalSales': totalSales,
      'avgOrderValue': avgOrderValue,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Funds',
      'totalSales': totalSales,
      'avgOrderValue': avgOrderValue,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _FundsImpl extends Funds {
  _FundsImpl({
    required double totalSales,
    required double avgOrderValue,
  }) : super._(
         totalSales: totalSales,
         avgOrderValue: avgOrderValue,
       );

  /// Returns a shallow copy of this [Funds]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Funds copyWith({
    double? totalSales,
    double? avgOrderValue,
  }) {
    return Funds(
      totalSales: totalSales ?? this.totalSales,
      avgOrderValue: avgOrderValue ?? this.avgOrderValue,
    );
  }
}
