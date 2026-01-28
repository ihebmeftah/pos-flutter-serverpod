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
import '../../cateogrie/entity/categorie.dart' as _i2;
import 'package:pos_server/src/generated/protocol.dart' as _i3;

abstract class CategoryCount
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CategoryCount._({
    required this.category,
    required this.count,
  });

  factory CategoryCount({
    required _i2.Categorie category,
    required int count,
  }) = _CategoryCountImpl;

  factory CategoryCount.fromJson(Map<String, dynamic> jsonSerialization) {
    return CategoryCount(
      category: _i3.Protocol().deserialize<_i2.Categorie>(
        jsonSerialization['category'],
      ),
      count: jsonSerialization['count'] as int,
    );
  }

  _i2.Categorie category;

  int count;

  /// Returns a shallow copy of this [CategoryCount]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CategoryCount copyWith({
    _i2.Categorie? category,
    int? count,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CategoryCount',
      'category': category.toJson(),
      'count': count,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CategoryCount',
      'category': category.toJsonForProtocol(),
      'count': count,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CategoryCountImpl extends CategoryCount {
  _CategoryCountImpl({
    required _i2.Categorie category,
    required int count,
  }) : super._(
         category: category,
         count: count,
       );

  /// Returns a shallow copy of this [CategoryCount]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CategoryCount copyWith({
    _i2.Categorie? category,
    int? count,
  }) {
    return CategoryCount(
      category: category ?? this.category.copyWith(),
      count: count ?? this.count,
    );
  }
}
