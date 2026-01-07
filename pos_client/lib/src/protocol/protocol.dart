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
import 'article/article.dart' as _i2;
import 'buildings/building.dart' as _i3;
import 'buildings_tables/building_tables.dart' as _i4;
import 'buildings_tables/table_status_enum.dart' as _i5;
import 'cateogrie/categorie.dart' as _i6;
import 'greetings/greeting.dart' as _i7;
import 'package:pos_client/src/protocol/article/article.dart' as _i8;
import 'package:pos_client/src/protocol/buildings/building.dart' as _i9;
import 'package:pos_client/src/protocol/buildings_tables/building_tables.dart'
    as _i10;
import 'package:pos_client/src/protocol/cateogrie/categorie.dart' as _i11;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i12;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i13;
export 'article/article.dart';
export 'buildings/building.dart';
export 'buildings_tables/building_tables.dart';
export 'buildings_tables/table_status_enum.dart';
export 'cateogrie/categorie.dart';
export 'greetings/greeting.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.Article) {
      return _i2.Article.fromJson(data) as T;
    }
    if (t == _i3.Building) {
      return _i3.Building.fromJson(data) as T;
    }
    if (t == _i4.BTable) {
      return _i4.BTable.fromJson(data) as T;
    }
    if (t == _i5.TableStatus) {
      return _i5.TableStatus.fromJson(data) as T;
    }
    if (t == _i6.Categorie) {
      return _i6.Categorie.fromJson(data) as T;
    }
    if (t == _i7.Greeting) {
      return _i7.Greeting.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Article?>()) {
      return (data != null ? _i2.Article.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Building?>()) {
      return (data != null ? _i3.Building.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.BTable?>()) {
      return (data != null ? _i4.BTable.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.TableStatus?>()) {
      return (data != null ? _i5.TableStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Categorie?>()) {
      return (data != null ? _i6.Categorie.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Greeting?>()) {
      return (data != null ? _i7.Greeting.fromJson(data) : null) as T;
    }
    if (t == List<_i8.Article>) {
      return (data as List).map((e) => deserialize<_i8.Article>(e)).toList()
          as T;
    }
    if (t == List<_i9.Building>) {
      return (data as List).map((e) => deserialize<_i9.Building>(e)).toList()
          as T;
    }
    if (t == List<_i10.BTable>) {
      return (data as List).map((e) => deserialize<_i10.BTable>(e)).toList()
          as T;
    }
    if (t == List<_i11.Categorie>) {
      return (data as List).map((e) => deserialize<_i11.Categorie>(e)).toList()
          as T;
    }
    try {
      return _i12.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i13.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.Article => 'Article',
      _i3.Building => 'Building',
      _i4.BTable => 'BTable',
      _i5.TableStatus => 'TableStatus',
      _i6.Categorie => 'Categorie',
      _i7.Greeting => 'Greeting',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('pos.', '');
    }

    switch (data) {
      case _i2.Article():
        return 'Article';
      case _i3.Building():
        return 'Building';
      case _i4.BTable():
        return 'BTable';
      case _i5.TableStatus():
        return 'TableStatus';
      case _i6.Categorie():
        return 'Categorie';
      case _i7.Greeting():
        return 'Greeting';
    }
    className = _i12.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i13.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Article') {
      return deserialize<_i2.Article>(data['data']);
    }
    if (dataClassName == 'Building') {
      return deserialize<_i3.Building>(data['data']);
    }
    if (dataClassName == 'BTable') {
      return deserialize<_i4.BTable>(data['data']);
    }
    if (dataClassName == 'TableStatus') {
      return deserialize<_i5.TableStatus>(data['data']);
    }
    if (dataClassName == 'Categorie') {
      return deserialize<_i6.Categorie>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i7.Greeting>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i12.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i13.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
