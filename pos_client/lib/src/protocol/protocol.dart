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
import 'access/access.dart' as _i2;
import 'article/article.dart' as _i3;
import 'buildings/building.dart' as _i4;
import 'buildings/currency_enum.dart' as _i5;
import 'buildings_tables/building_tables.dart' as _i6;
import 'buildings_tables/table_status_enum.dart' as _i7;
import 'cateogrie/categorie.dart' as _i8;
import 'employer/employer.dart' as _i9;
import 'exceptions/endpoint_exceptions.dart' as _i10;
import 'exceptions/exceptiont_enums.dart' as _i11;
import 'order/order.dart' as _i12;
import 'order/order_item.dart' as _i13;
import 'order/order_item_status_enum.dart' as _i14;
import 'order/order_status_enum.dart' as _i15;
import 'package:pos_client/src/protocol/access/access.dart' as _i16;
import 'package:pos_client/src/protocol/article/article.dart' as _i17;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i18;
import 'package:pos_client/src/protocol/employer/employer.dart' as _i19;
import 'package:pos_client/src/protocol/buildings/building.dart' as _i20;
import 'package:pos_client/src/protocol/buildings_tables/building_tables.dart'
    as _i21;
import 'package:pos_client/src/protocol/cateogrie/categorie.dart' as _i22;
import 'package:pos_client/src/protocol/order/order.dart' as _i23;
import 'package:pos_client/src/protocol/order/order_item.dart' as _i24;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i25;
export 'access/access.dart';
export 'article/article.dart';
export 'buildings/building.dart';
export 'buildings/currency_enum.dart';
export 'buildings_tables/building_tables.dart';
export 'buildings_tables/table_status_enum.dart';
export 'cateogrie/categorie.dart';
export 'employer/employer.dart';
export 'exceptions/endpoint_exceptions.dart';
export 'exceptions/exceptiont_enums.dart';
export 'order/order.dart';
export 'order/order_item.dart';
export 'order/order_item_status_enum.dart';
export 'order/order_status_enum.dart';
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

    if (t == _i2.Access) {
      return _i2.Access.fromJson(data) as T;
    }
    if (t == _i3.Article) {
      return _i3.Article.fromJson(data) as T;
    }
    if (t == _i4.Building) {
      return _i4.Building.fromJson(data) as T;
    }
    if (t == _i5.Currency) {
      return _i5.Currency.fromJson(data) as T;
    }
    if (t == _i6.BTable) {
      return _i6.BTable.fromJson(data) as T;
    }
    if (t == _i7.TableStatus) {
      return _i7.TableStatus.fromJson(data) as T;
    }
    if (t == _i8.Categorie) {
      return _i8.Categorie.fromJson(data) as T;
    }
    if (t == _i9.Employer) {
      return _i9.Employer.fromJson(data) as T;
    }
    if (t == _i10.AppException) {
      return _i10.AppException.fromJson(data) as T;
    }
    if (t == _i11.ExceptionType) {
      return _i11.ExceptionType.fromJson(data) as T;
    }
    if (t == _i12.Order) {
      return _i12.Order.fromJson(data) as T;
    }
    if (t == _i13.OrderItem) {
      return _i13.OrderItem.fromJson(data) as T;
    }
    if (t == _i14.OrderItemStatus) {
      return _i14.OrderItemStatus.fromJson(data) as T;
    }
    if (t == _i15.OrderStatus) {
      return _i15.OrderStatus.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Access?>()) {
      return (data != null ? _i2.Access.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Article?>()) {
      return (data != null ? _i3.Article.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Building?>()) {
      return (data != null ? _i4.Building.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Currency?>()) {
      return (data != null ? _i5.Currency.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.BTable?>()) {
      return (data != null ? _i6.BTable.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.TableStatus?>()) {
      return (data != null ? _i7.TableStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Categorie?>()) {
      return (data != null ? _i8.Categorie.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Employer?>()) {
      return (data != null ? _i9.Employer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.AppException?>()) {
      return (data != null ? _i10.AppException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.ExceptionType?>()) {
      return (data != null ? _i11.ExceptionType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Order?>()) {
      return (data != null ? _i12.Order.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.OrderItem?>()) {
      return (data != null ? _i13.OrderItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.OrderItemStatus?>()) {
      return (data != null ? _i14.OrderItemStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.OrderStatus?>()) {
      return (data != null ? _i15.OrderStatus.fromJson(data) : null) as T;
    }
    if (t == List<_i13.OrderItem>) {
      return (data as List).map((e) => deserialize<_i13.OrderItem>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i13.OrderItem>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i13.OrderItem>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i16.Access>) {
      return (data as List).map((e) => deserialize<_i16.Access>(e)).toList()
          as T;
    }
    if (t == List<_i17.Article>) {
      return (data as List).map((e) => deserialize<_i17.Article>(e)).toList()
          as T;
    }
    if (t ==
        _i1
            .getType<
              ({_i18.AuthSuccess authSuccess, _i19.Employer? employer})
            >()) {
      return (
            authSuccess: deserialize<_i18.AuthSuccess>(
              ((data as Map)['n'] as Map)['authSuccess'],
            ),
            employer: ((data)['n'] as Map)['employer'] == null
                ? null
                : deserialize<_i19.Employer>(data['n']['employer']),
          )
          as T;
    }
    if (t == List<_i20.Building>) {
      return (data as List).map((e) => deserialize<_i20.Building>(e)).toList()
          as T;
    }
    if (t == List<_i21.BTable>) {
      return (data as List).map((e) => deserialize<_i21.BTable>(e)).toList()
          as T;
    }
    if (t == List<_i22.Categorie>) {
      return (data as List).map((e) => deserialize<_i22.Categorie>(e)).toList()
          as T;
    }
    if (t == List<_i19.Employer>) {
      return (data as List).map((e) => deserialize<_i19.Employer>(e)).toList()
          as T;
    }
    if (t == List<_i23.Order>) {
      return (data as List).map((e) => deserialize<_i23.Order>(e)).toList()
          as T;
    }
    if (t == List<_i24.OrderItem>) {
      return (data as List).map((e) => deserialize<_i24.OrderItem>(e)).toList()
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    try {
      return _i25.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i18.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.Access => 'Access',
      _i3.Article => 'Article',
      _i4.Building => 'Building',
      _i5.Currency => 'Currency',
      _i6.BTable => 'BTable',
      _i7.TableStatus => 'TableStatus',
      _i8.Categorie => 'Categorie',
      _i9.Employer => 'Employer',
      _i10.AppException => 'AppException',
      _i11.ExceptionType => 'ExceptionType',
      _i12.Order => 'Order',
      _i13.OrderItem => 'OrderItem',
      _i14.OrderItemStatus => 'OrderItemStatus',
      _i15.OrderStatus => 'OrderStatus',
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
      case _i2.Access():
        return 'Access';
      case _i3.Article():
        return 'Article';
      case _i4.Building():
        return 'Building';
      case _i5.Currency():
        return 'Currency';
      case _i6.BTable():
        return 'BTable';
      case _i7.TableStatus():
        return 'TableStatus';
      case _i8.Categorie():
        return 'Categorie';
      case _i9.Employer():
        return 'Employer';
      case _i10.AppException():
        return 'AppException';
      case _i11.ExceptionType():
        return 'ExceptionType';
      case _i12.Order():
        return 'Order';
      case _i13.OrderItem():
        return 'OrderItem';
      case _i14.OrderItemStatus():
        return 'OrderItemStatus';
      case _i15.OrderStatus():
        return 'OrderStatus';
    }
    className = _i25.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i18.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'Access') {
      return deserialize<_i2.Access>(data['data']);
    }
    if (dataClassName == 'Article') {
      return deserialize<_i3.Article>(data['data']);
    }
    if (dataClassName == 'Building') {
      return deserialize<_i4.Building>(data['data']);
    }
    if (dataClassName == 'Currency') {
      return deserialize<_i5.Currency>(data['data']);
    }
    if (dataClassName == 'BTable') {
      return deserialize<_i6.BTable>(data['data']);
    }
    if (dataClassName == 'TableStatus') {
      return deserialize<_i7.TableStatus>(data['data']);
    }
    if (dataClassName == 'Categorie') {
      return deserialize<_i8.Categorie>(data['data']);
    }
    if (dataClassName == 'Employer') {
      return deserialize<_i9.Employer>(data['data']);
    }
    if (dataClassName == 'AppException') {
      return deserialize<_i10.AppException>(data['data']);
    }
    if (dataClassName == 'ExceptionType') {
      return deserialize<_i11.ExceptionType>(data['data']);
    }
    if (dataClassName == 'Order') {
      return deserialize<_i12.Order>(data['data']);
    }
    if (dataClassName == 'OrderItem') {
      return deserialize<_i13.OrderItem>(data['data']);
    }
    if (dataClassName == 'OrderItemStatus') {
      return deserialize<_i14.OrderItemStatus>(data['data']);
    }
    if (dataClassName == 'OrderStatus') {
      return deserialize<_i15.OrderStatus>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i25.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i18.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    if (record is ({_i18.AuthSuccess authSuccess, _i19.Employer? employer})) {
      return {
        "n": {
          "authSuccess": record.authSuccess,
          "employer": record.employer,
        },
      };
    }
    try {
      return _i25.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i18.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }

  /// Maps container types (like [List], [Map], [Set]) containing
  /// [Record]s or non-String-keyed [Map]s to their JSON representation.
  ///
  /// It should not be called for [SerializableModel] types. These
  /// handle the "[Record] in container" mapping internally already.
  ///
  /// It is only supposed to be called from generated protocol code.
  ///
  /// Returns either a `List<dynamic>` (for List, Sets, and Maps with
  /// non-String keys) or a `Map<String, dynamic>` in case the input was
  /// a `Map<String, …>`.
  Object? mapContainerToJson(Object obj) {
    if (obj is! Iterable && obj is! Map) {
      throw ArgumentError.value(
        obj,
        'obj',
        'The object to serialize should be of type List, Map, or Set',
      );
    }

    dynamic mapIfNeeded(Object? obj) {
      return switch (obj) {
        Record record => mapRecordToJson(record),
        Iterable iterable => mapContainerToJson(iterable),
        Map map => mapContainerToJson(map),
        Object? value => value,
      };
    }

    switch (obj) {
      case Map<String, dynamic>():
        return {
          for (var entry in obj.entries) entry.key: mapIfNeeded(entry.value),
        };
      case Map():
        return [
          for (var entry in obj.entries)
            {
              'k': mapIfNeeded(entry.key),
              'v': mapIfNeeded(entry.value),
            },
        ];

      case Iterable():
        return [
          for (var e in obj) mapIfNeeded(e),
        ];
    }

    return obj;
  }
}
