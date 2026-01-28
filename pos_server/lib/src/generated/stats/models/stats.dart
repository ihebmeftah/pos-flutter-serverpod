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
import '../../stats/models/funds.dart' as _i4;
import 'package:pos_server/src/generated/protocol.dart' as _i5;

abstract class Stats
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  Stats._({
    required this.totalOrders,
    required this.totalArticles,
    required this.totalCategories,
    required this.paidOrdersCount,
    required this.totalItemsSold,
    required this.mostPopularArticles,
    required this.mostPopularCategories,
    required this.funds,
  });

  factory Stats({
    required int totalOrders,
    required int totalArticles,
    required int totalCategories,
    required int paidOrdersCount,
    required int totalItemsSold,
    required List<_i2.ArticleCount> mostPopularArticles,
    required List<_i3.CategoryCount> mostPopularCategories,
    required _i4.Funds funds,
  }) = _StatsImpl;

  factory Stats.fromJson(Map<String, dynamic> jsonSerialization) {
    return Stats(
      totalOrders: jsonSerialization['totalOrders'] as int,
      totalArticles: jsonSerialization['totalArticles'] as int,
      totalCategories: jsonSerialization['totalCategories'] as int,
      paidOrdersCount: jsonSerialization['paidOrdersCount'] as int,
      totalItemsSold: jsonSerialization['totalItemsSold'] as int,
      mostPopularArticles: _i5.Protocol().deserialize<List<_i2.ArticleCount>>(
        jsonSerialization['mostPopularArticles'],
      ),
      mostPopularCategories: _i5.Protocol()
          .deserialize<List<_i3.CategoryCount>>(
            jsonSerialization['mostPopularCategories'],
          ),
      funds: _i5.Protocol().deserialize<_i4.Funds>(jsonSerialization['funds']),
    );
  }

  int totalOrders;

  int totalArticles;

  int totalCategories;

  int paidOrdersCount;

  int totalItemsSold;

  List<_i2.ArticleCount> mostPopularArticles;

  List<_i3.CategoryCount> mostPopularCategories;

  _i4.Funds funds;

  /// Returns a shallow copy of this [Stats]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Stats copyWith({
    int? totalOrders,
    int? totalArticles,
    int? totalCategories,
    int? paidOrdersCount,
    int? totalItemsSold,
    List<_i2.ArticleCount>? mostPopularArticles,
    List<_i3.CategoryCount>? mostPopularCategories,
    _i4.Funds? funds,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Stats',
      'totalOrders': totalOrders,
      'totalArticles': totalArticles,
      'totalCategories': totalCategories,
      'paidOrdersCount': paidOrdersCount,
      'totalItemsSold': totalItemsSold,
      'mostPopularArticles': mostPopularArticles.toJson(
        valueToJson: (v) => v.toJson(),
      ),
      'mostPopularCategories': mostPopularCategories.toJson(
        valueToJson: (v) => v.toJson(),
      ),
      'funds': funds.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Stats',
      'totalOrders': totalOrders,
      'totalArticles': totalArticles,
      'totalCategories': totalCategories,
      'paidOrdersCount': paidOrdersCount,
      'totalItemsSold': totalItemsSold,
      'mostPopularArticles': mostPopularArticles.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
      'mostPopularCategories': mostPopularCategories.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
      'funds': funds.toJsonForProtocol(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _StatsImpl extends Stats {
  _StatsImpl({
    required int totalOrders,
    required int totalArticles,
    required int totalCategories,
    required int paidOrdersCount,
    required int totalItemsSold,
    required List<_i2.ArticleCount> mostPopularArticles,
    required List<_i3.CategoryCount> mostPopularCategories,
    required _i4.Funds funds,
  }) : super._(
         totalOrders: totalOrders,
         totalArticles: totalArticles,
         totalCategories: totalCategories,
         paidOrdersCount: paidOrdersCount,
         totalItemsSold: totalItemsSold,
         mostPopularArticles: mostPopularArticles,
         mostPopularCategories: mostPopularCategories,
         funds: funds,
       );

  /// Returns a shallow copy of this [Stats]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Stats copyWith({
    int? totalOrders,
    int? totalArticles,
    int? totalCategories,
    int? paidOrdersCount,
    int? totalItemsSold,
    List<_i2.ArticleCount>? mostPopularArticles,
    List<_i3.CategoryCount>? mostPopularCategories,
    _i4.Funds? funds,
  }) {
    return Stats(
      totalOrders: totalOrders ?? this.totalOrders,
      totalArticles: totalArticles ?? this.totalArticles,
      totalCategories: totalCategories ?? this.totalCategories,
      paidOrdersCount: paidOrdersCount ?? this.paidOrdersCount,
      totalItemsSold: totalItemsSold ?? this.totalItemsSold,
      mostPopularArticles:
          mostPopularArticles ??
          this.mostPopularArticles.map((e0) => e0.copyWith()).toList(),
      mostPopularCategories:
          mostPopularCategories ??
          this.mostPopularCategories.map((e0) => e0.copyWith()).toList(),
      funds: funds ?? this.funds.copyWith(),
    );
  }
}
