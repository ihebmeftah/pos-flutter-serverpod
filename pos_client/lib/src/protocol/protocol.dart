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
import 'article/dto/create_article.dto.dart' as _i3;
import 'article/dto/update_article.dto.dart' as _i4;
import 'article/entity/article.dart' as _i5;
import 'article/entity/article_composition.dart' as _i6;
import 'buildings/building.dart' as _i7;
import 'buildings/currency_enum.dart' as _i8;
import 'buildings_tables/building_tables.dart' as _i9;
import 'buildings_tables/table_status_enum.dart' as _i10;
import 'cash_register/cash_register.dart' as _i11;
import 'cateogrie/dto/create_categorie.dto.dart' as _i12;
import 'cateogrie/dto/update_categorie.dto.dart' as _i13;
import 'cateogrie/entity/categorie.dart' as _i14;
import 'employer/create_employer.dto.dart' as _i15;
import 'employer/employer.dart' as _i16;
import 'exceptions/endpoint_exceptions.dart' as _i17;
import 'exceptions/exceptiont_enums.dart' as _i18;
import 'ingredient/ingredient.dart' as _i19;
import 'ingredient/units_type.enum.dart' as _i20;
import 'order/dto/append_items.dto.dart' as _i21;
import 'order/dto/create_order.dto.dart' as _i22;
import 'order/entity/order.dart' as _i23;
import 'order/entity/order_item.dart' as _i24;
import 'order/entity/stream_actions_order.dart' as _i25;
import 'order/entity/stream_order.dart' as _i26;
import 'order/order_item_status_enum.dart' as _i27;
import 'order/order_status_enum.dart' as _i28;
import 'order/pay_methode_enum.dart' as _i29;
import 'stats/models/article_count.dart' as _i30;
import 'stats/models/building_detailed_stats.dart' as _i31;
import 'stats/models/cash_register_stats.dart' as _i32;
import 'stats/models/cash_register_summary.dart' as _i33;
import 'stats/models/category_count.dart' as _i34;
import 'stats/models/category_revenue.dart' as _i35;
import 'stats/models/daily_revenue.dart' as _i36;
import 'stats/models/employee_stats.dart' as _i37;
import 'stats/models/funds.dart' as _i38;
import 'stats/models/hourly_revenue.dart' as _i39;
import 'stats/models/stats.dart' as _i40;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i41;
import 'package:pos_client/src/protocol/access/access.dart' as _i42;
import 'package:pos_client/src/protocol/article/entity/article.dart' as _i43;
import 'package:pos_client/src/protocol/employer/employer.dart' as _i44;
import 'package:pos_client/src/protocol/buildings/building.dart' as _i45;
import 'package:pos_client/src/protocol/buildings_tables/building_tables.dart'
    as _i46;
import 'package:pos_client/src/protocol/cash_register/cash_register.dart'
    as _i47;
import 'package:pos_client/src/protocol/cateogrie/entity/categorie.dart'
    as _i48;
import 'package:pos_client/src/protocol/ingredient/ingredient.dart' as _i49;
import 'package:pos_client/src/protocol/order/entity/order.dart' as _i50;
import 'package:pos_client/src/protocol/order/entity/order_item.dart' as _i51;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i52;
export 'access/access.dart';
export 'article/dto/create_article.dto.dart';
export 'article/dto/update_article.dto.dart';
export 'article/entity/article.dart';
export 'article/entity/article_composition.dart';
export 'buildings/building.dart';
export 'buildings/currency_enum.dart';
export 'buildings_tables/building_tables.dart';
export 'buildings_tables/table_status_enum.dart';
export 'cash_register/cash_register.dart';
export 'cateogrie/dto/create_categorie.dto.dart';
export 'cateogrie/dto/update_categorie.dto.dart';
export 'cateogrie/entity/categorie.dart';
export 'employer/create_employer.dto.dart';
export 'employer/employer.dart';
export 'exceptions/endpoint_exceptions.dart';
export 'exceptions/exceptiont_enums.dart';
export 'ingredient/ingredient.dart';
export 'ingredient/units_type.enum.dart';
export 'order/dto/append_items.dto.dart';
export 'order/dto/create_order.dto.dart';
export 'order/entity/order.dart';
export 'order/entity/order_item.dart';
export 'order/entity/stream_actions_order.dart';
export 'order/entity/stream_order.dart';
export 'order/order_item_status_enum.dart';
export 'order/order_status_enum.dart';
export 'order/pay_methode_enum.dart';
export 'stats/models/article_count.dart';
export 'stats/models/building_detailed_stats.dart';
export 'stats/models/cash_register_stats.dart';
export 'stats/models/cash_register_summary.dart';
export 'stats/models/category_count.dart';
export 'stats/models/category_revenue.dart';
export 'stats/models/daily_revenue.dart';
export 'stats/models/employee_stats.dart';
export 'stats/models/funds.dart';
export 'stats/models/hourly_revenue.dart';
export 'stats/models/stats.dart';
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
    if (t == _i3.CreateArticleDto) {
      return _i3.CreateArticleDto.fromJson(data) as T;
    }
    if (t == _i4.UpdateArticleDto) {
      return _i4.UpdateArticleDto.fromJson(data) as T;
    }
    if (t == _i5.Article) {
      return _i5.Article.fromJson(data) as T;
    }
    if (t == _i6.ArticleComposition) {
      return _i6.ArticleComposition.fromJson(data) as T;
    }
    if (t == _i7.Building) {
      return _i7.Building.fromJson(data) as T;
    }
    if (t == _i8.Currency) {
      return _i8.Currency.fromJson(data) as T;
    }
    if (t == _i9.BTable) {
      return _i9.BTable.fromJson(data) as T;
    }
    if (t == _i10.TableStatus) {
      return _i10.TableStatus.fromJson(data) as T;
    }
    if (t == _i11.CashRegister) {
      return _i11.CashRegister.fromJson(data) as T;
    }
    if (t == _i12.UpdateCategorieDto) {
      return _i12.UpdateCategorieDto.fromJson(data) as T;
    }
    if (t == _i13.CreateCategorieDto) {
      return _i13.CreateCategorieDto.fromJson(data) as T;
    }
    if (t == _i14.Categorie) {
      return _i14.Categorie.fromJson(data) as T;
    }
    if (t == _i15.CreateEmployerDTO) {
      return _i15.CreateEmployerDTO.fromJson(data) as T;
    }
    if (t == _i16.Employer) {
      return _i16.Employer.fromJson(data) as T;
    }
    if (t == _i17.AppException) {
      return _i17.AppException.fromJson(data) as T;
    }
    if (t == _i18.ExceptionType) {
      return _i18.ExceptionType.fromJson(data) as T;
    }
    if (t == _i19.Ingredient) {
      return _i19.Ingredient.fromJson(data) as T;
    }
    if (t == _i20.UnitsType) {
      return _i20.UnitsType.fromJson(data) as T;
    }
    if (t == _i21.AppendItemsDto) {
      return _i21.AppendItemsDto.fromJson(data) as T;
    }
    if (t == _i22.CreateOrderDto) {
      return _i22.CreateOrderDto.fromJson(data) as T;
    }
    if (t == _i23.Order) {
      return _i23.Order.fromJson(data) as T;
    }
    if (t == _i24.OrderItem) {
      return _i24.OrderItem.fromJson(data) as T;
    }
    if (t == _i25.StreamActionsOrder) {
      return _i25.StreamActionsOrder.fromJson(data) as T;
    }
    if (t == _i26.StreamOrder) {
      return _i26.StreamOrder.fromJson(data) as T;
    }
    if (t == _i27.OrderItemStatus) {
      return _i27.OrderItemStatus.fromJson(data) as T;
    }
    if (t == _i28.OrderStatus) {
      return _i28.OrderStatus.fromJson(data) as T;
    }
    if (t == _i29.PayMethode) {
      return _i29.PayMethode.fromJson(data) as T;
    }
    if (t == _i30.ArticleCount) {
      return _i30.ArticleCount.fromJson(data) as T;
    }
    if (t == _i31.BuildingDetailedStats) {
      return _i31.BuildingDetailedStats.fromJson(data) as T;
    }
    if (t == _i32.CashRegisterStats) {
      return _i32.CashRegisterStats.fromJson(data) as T;
    }
    if (t == _i33.CashRegisterSummary) {
      return _i33.CashRegisterSummary.fromJson(data) as T;
    }
    if (t == _i34.CategoryCount) {
      return _i34.CategoryCount.fromJson(data) as T;
    }
    if (t == _i35.CategoryRevenue) {
      return _i35.CategoryRevenue.fromJson(data) as T;
    }
    if (t == _i36.DailyRevenue) {
      return _i36.DailyRevenue.fromJson(data) as T;
    }
    if (t == _i37.EmployeeStats) {
      return _i37.EmployeeStats.fromJson(data) as T;
    }
    if (t == _i38.Funds) {
      return _i38.Funds.fromJson(data) as T;
    }
    if (t == _i39.HourlyRevenue) {
      return _i39.HourlyRevenue.fromJson(data) as T;
    }
    if (t == _i40.Stats) {
      return _i40.Stats.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Access?>()) {
      return (data != null ? _i2.Access.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.CreateArticleDto?>()) {
      return (data != null ? _i3.CreateArticleDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.UpdateArticleDto?>()) {
      return (data != null ? _i4.UpdateArticleDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Article?>()) {
      return (data != null ? _i5.Article.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.ArticleComposition?>()) {
      return (data != null ? _i6.ArticleComposition.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Building?>()) {
      return (data != null ? _i7.Building.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Currency?>()) {
      return (data != null ? _i8.Currency.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.BTable?>()) {
      return (data != null ? _i9.BTable.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.TableStatus?>()) {
      return (data != null ? _i10.TableStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.CashRegister?>()) {
      return (data != null ? _i11.CashRegister.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.UpdateCategorieDto?>()) {
      return (data != null ? _i12.UpdateCategorieDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i13.CreateCategorieDto?>()) {
      return (data != null ? _i13.CreateCategorieDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i14.Categorie?>()) {
      return (data != null ? _i14.Categorie.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.CreateEmployerDTO?>()) {
      return (data != null ? _i15.CreateEmployerDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.Employer?>()) {
      return (data != null ? _i16.Employer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.AppException?>()) {
      return (data != null ? _i17.AppException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.ExceptionType?>()) {
      return (data != null ? _i18.ExceptionType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.Ingredient?>()) {
      return (data != null ? _i19.Ingredient.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.UnitsType?>()) {
      return (data != null ? _i20.UnitsType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.AppendItemsDto?>()) {
      return (data != null ? _i21.AppendItemsDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.CreateOrderDto?>()) {
      return (data != null ? _i22.CreateOrderDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.Order?>()) {
      return (data != null ? _i23.Order.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.OrderItem?>()) {
      return (data != null ? _i24.OrderItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.StreamActionsOrder?>()) {
      return (data != null ? _i25.StreamActionsOrder.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i26.StreamOrder?>()) {
      return (data != null ? _i26.StreamOrder.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.OrderItemStatus?>()) {
      return (data != null ? _i27.OrderItemStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.OrderStatus?>()) {
      return (data != null ? _i28.OrderStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.PayMethode?>()) {
      return (data != null ? _i29.PayMethode.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.ArticleCount?>()) {
      return (data != null ? _i30.ArticleCount.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.BuildingDetailedStats?>()) {
      return (data != null ? _i31.BuildingDetailedStats.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i32.CashRegisterStats?>()) {
      return (data != null ? _i32.CashRegisterStats.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.CashRegisterSummary?>()) {
      return (data != null ? _i33.CashRegisterSummary.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i34.CategoryCount?>()) {
      return (data != null ? _i34.CategoryCount.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.CategoryRevenue?>()) {
      return (data != null ? _i35.CategoryRevenue.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.DailyRevenue?>()) {
      return (data != null ? _i36.DailyRevenue.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.EmployeeStats?>()) {
      return (data != null ? _i37.EmployeeStats.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i38.Funds?>()) {
      return (data != null ? _i38.Funds.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i39.HourlyRevenue?>()) {
      return (data != null ? _i39.HourlyRevenue.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i40.Stats?>()) {
      return (data != null ? _i40.Stats.fromJson(data) : null) as T;
    }
    if (t == List<_i6.ArticleComposition>) {
      return (data as List)
              .map((e) => deserialize<_i6.ArticleComposition>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i6.ArticleComposition>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i6.ArticleComposition>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i1.UuidValue>) {
      return (data as List).map((e) => deserialize<_i1.UuidValue>(e)).toList()
          as T;
    }
    if (t == List<_i24.OrderItem>) {
      return (data as List).map((e) => deserialize<_i24.OrderItem>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i24.OrderItem>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i24.OrderItem>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i41.UserProfile?>) {
      return (data as List)
              .map((e) => deserialize<_i41.UserProfile?>(e))
              .toList()
          as T;
    }
    if (t == List<_i33.CashRegisterSummary>) {
      return (data as List)
              .map((e) => deserialize<_i33.CashRegisterSummary>(e))
              .toList()
          as T;
    }
    if (t == List<_i30.ArticleCount>) {
      return (data as List)
              .map((e) => deserialize<_i30.ArticleCount>(e))
              .toList()
          as T;
    }
    if (t == List<_i34.CategoryCount>) {
      return (data as List)
              .map((e) => deserialize<_i34.CategoryCount>(e))
              .toList()
          as T;
    }
    if (t == List<_i35.CategoryRevenue>) {
      return (data as List)
              .map((e) => deserialize<_i35.CategoryRevenue>(e))
              .toList()
          as T;
    }
    if (t == List<_i36.DailyRevenue>) {
      return (data as List)
              .map((e) => deserialize<_i36.DailyRevenue>(e))
              .toList()
          as T;
    }
    if (t == List<_i39.HourlyRevenue>) {
      return (data as List)
              .map((e) => deserialize<_i39.HourlyRevenue>(e))
              .toList()
          as T;
    }
    if (t == List<_i37.EmployeeStats>) {
      return (data as List)
              .map((e) => deserialize<_i37.EmployeeStats>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i37.EmployeeStats>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i37.EmployeeStats>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i42.Access>) {
      return (data as List).map((e) => deserialize<_i42.Access>(e)).toList()
          as T;
    }
    if (t == List<_i43.Article>) {
      return (data as List).map((e) => deserialize<_i43.Article>(e)).toList()
          as T;
    }
    if (t ==
        _i1
            .getType<
              ({_i41.AuthSuccess authSuccess, _i44.Employer? employer})
            >()) {
      return (
            authSuccess: deserialize<_i41.AuthSuccess>(
              ((data as Map)['n'] as Map)['authSuccess'],
            ),
            employer: ((data)['n'] as Map)['employer'] == null
                ? null
                : deserialize<_i44.Employer>(data['n']['employer']),
          )
          as T;
    }
    if (t == List<_i45.Building>) {
      return (data as List).map((e) => deserialize<_i45.Building>(e)).toList()
          as T;
    }
    if (t == List<_i46.BTable>) {
      return (data as List).map((e) => deserialize<_i46.BTable>(e)).toList()
          as T;
    }
    if (t == List<_i47.CashRegister>) {
      return (data as List)
              .map((e) => deserialize<_i47.CashRegister>(e))
              .toList()
          as T;
    }
    if (t == List<_i48.Categorie>) {
      return (data as List).map((e) => deserialize<_i48.Categorie>(e)).toList()
          as T;
    }
    if (t == List<_i44.Employer>) {
      return (data as List).map((e) => deserialize<_i44.Employer>(e)).toList()
          as T;
    }
    if (t == List<_i49.Ingredient>) {
      return (data as List).map((e) => deserialize<_i49.Ingredient>(e)).toList()
          as T;
    }
    if (t == List<_i50.Order>) {
      return (data as List).map((e) => deserialize<_i50.Order>(e)).toList()
          as T;
    }
    if (t == List<_i51.OrderItem>) {
      return (data as List).map((e) => deserialize<_i51.OrderItem>(e)).toList()
          as T;
    }
    if (t == List<_i1.UuidValue>) {
      return (data as List).map((e) => deserialize<_i1.UuidValue>(e)).toList()
          as T;
    }
    try {
      return _i52.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i41.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.Access => 'Access',
      _i3.CreateArticleDto => 'CreateArticleDto',
      _i4.UpdateArticleDto => 'UpdateArticleDto',
      _i5.Article => 'Article',
      _i6.ArticleComposition => 'ArticleComposition',
      _i7.Building => 'Building',
      _i8.Currency => 'Currency',
      _i9.BTable => 'BTable',
      _i10.TableStatus => 'TableStatus',
      _i11.CashRegister => 'CashRegister',
      _i12.UpdateCategorieDto => 'UpdateCategorieDto',
      _i13.CreateCategorieDto => 'CreateCategorieDto',
      _i14.Categorie => 'Categorie',
      _i15.CreateEmployerDTO => 'CreateEmployerDTO',
      _i16.Employer => 'Employer',
      _i17.AppException => 'AppException',
      _i18.ExceptionType => 'ExceptionType',
      _i19.Ingredient => 'Ingredient',
      _i20.UnitsType => 'UnitsType',
      _i21.AppendItemsDto => 'AppendItemsDto',
      _i22.CreateOrderDto => 'CreateOrderDto',
      _i23.Order => 'Order',
      _i24.OrderItem => 'OrderItem',
      _i25.StreamActionsOrder => 'StreamActionsOrder',
      _i26.StreamOrder => 'StreamOrder',
      _i27.OrderItemStatus => 'OrderItemStatus',
      _i28.OrderStatus => 'OrderStatus',
      _i29.PayMethode => 'PayMethode',
      _i30.ArticleCount => 'ArticleCount',
      _i31.BuildingDetailedStats => 'BuildingDetailedStats',
      _i32.CashRegisterStats => 'CashRegisterStats',
      _i33.CashRegisterSummary => 'CashRegisterSummary',
      _i34.CategoryCount => 'CategoryCount',
      _i35.CategoryRevenue => 'CategoryRevenue',
      _i36.DailyRevenue => 'DailyRevenue',
      _i37.EmployeeStats => 'EmployeeStats',
      _i38.Funds => 'Funds',
      _i39.HourlyRevenue => 'HourlyRevenue',
      _i40.Stats => 'Stats',
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
      case _i3.CreateArticleDto():
        return 'CreateArticleDto';
      case _i4.UpdateArticleDto():
        return 'UpdateArticleDto';
      case _i5.Article():
        return 'Article';
      case _i6.ArticleComposition():
        return 'ArticleComposition';
      case _i7.Building():
        return 'Building';
      case _i8.Currency():
        return 'Currency';
      case _i9.BTable():
        return 'BTable';
      case _i10.TableStatus():
        return 'TableStatus';
      case _i11.CashRegister():
        return 'CashRegister';
      case _i12.UpdateCategorieDto():
        return 'UpdateCategorieDto';
      case _i13.CreateCategorieDto():
        return 'CreateCategorieDto';
      case _i14.Categorie():
        return 'Categorie';
      case _i15.CreateEmployerDTO():
        return 'CreateEmployerDTO';
      case _i16.Employer():
        return 'Employer';
      case _i17.AppException():
        return 'AppException';
      case _i18.ExceptionType():
        return 'ExceptionType';
      case _i19.Ingredient():
        return 'Ingredient';
      case _i20.UnitsType():
        return 'UnitsType';
      case _i21.AppendItemsDto():
        return 'AppendItemsDto';
      case _i22.CreateOrderDto():
        return 'CreateOrderDto';
      case _i23.Order():
        return 'Order';
      case _i24.OrderItem():
        return 'OrderItem';
      case _i25.StreamActionsOrder():
        return 'StreamActionsOrder';
      case _i26.StreamOrder():
        return 'StreamOrder';
      case _i27.OrderItemStatus():
        return 'OrderItemStatus';
      case _i28.OrderStatus():
        return 'OrderStatus';
      case _i29.PayMethode():
        return 'PayMethode';
      case _i30.ArticleCount():
        return 'ArticleCount';
      case _i31.BuildingDetailedStats():
        return 'BuildingDetailedStats';
      case _i32.CashRegisterStats():
        return 'CashRegisterStats';
      case _i33.CashRegisterSummary():
        return 'CashRegisterSummary';
      case _i34.CategoryCount():
        return 'CategoryCount';
      case _i35.CategoryRevenue():
        return 'CategoryRevenue';
      case _i36.DailyRevenue():
        return 'DailyRevenue';
      case _i37.EmployeeStats():
        return 'EmployeeStats';
      case _i38.Funds():
        return 'Funds';
      case _i39.HourlyRevenue():
        return 'HourlyRevenue';
      case _i40.Stats():
        return 'Stats';
    }
    className = _i52.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i41.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'CreateArticleDto') {
      return deserialize<_i3.CreateArticleDto>(data['data']);
    }
    if (dataClassName == 'UpdateArticleDto') {
      return deserialize<_i4.UpdateArticleDto>(data['data']);
    }
    if (dataClassName == 'Article') {
      return deserialize<_i5.Article>(data['data']);
    }
    if (dataClassName == 'ArticleComposition') {
      return deserialize<_i6.ArticleComposition>(data['data']);
    }
    if (dataClassName == 'Building') {
      return deserialize<_i7.Building>(data['data']);
    }
    if (dataClassName == 'Currency') {
      return deserialize<_i8.Currency>(data['data']);
    }
    if (dataClassName == 'BTable') {
      return deserialize<_i9.BTable>(data['data']);
    }
    if (dataClassName == 'TableStatus') {
      return deserialize<_i10.TableStatus>(data['data']);
    }
    if (dataClassName == 'CashRegister') {
      return deserialize<_i11.CashRegister>(data['data']);
    }
    if (dataClassName == 'UpdateCategorieDto') {
      return deserialize<_i12.UpdateCategorieDto>(data['data']);
    }
    if (dataClassName == 'CreateCategorieDto') {
      return deserialize<_i13.CreateCategorieDto>(data['data']);
    }
    if (dataClassName == 'Categorie') {
      return deserialize<_i14.Categorie>(data['data']);
    }
    if (dataClassName == 'CreateEmployerDTO') {
      return deserialize<_i15.CreateEmployerDTO>(data['data']);
    }
    if (dataClassName == 'Employer') {
      return deserialize<_i16.Employer>(data['data']);
    }
    if (dataClassName == 'AppException') {
      return deserialize<_i17.AppException>(data['data']);
    }
    if (dataClassName == 'ExceptionType') {
      return deserialize<_i18.ExceptionType>(data['data']);
    }
    if (dataClassName == 'Ingredient') {
      return deserialize<_i19.Ingredient>(data['data']);
    }
    if (dataClassName == 'UnitsType') {
      return deserialize<_i20.UnitsType>(data['data']);
    }
    if (dataClassName == 'AppendItemsDto') {
      return deserialize<_i21.AppendItemsDto>(data['data']);
    }
    if (dataClassName == 'CreateOrderDto') {
      return deserialize<_i22.CreateOrderDto>(data['data']);
    }
    if (dataClassName == 'Order') {
      return deserialize<_i23.Order>(data['data']);
    }
    if (dataClassName == 'OrderItem') {
      return deserialize<_i24.OrderItem>(data['data']);
    }
    if (dataClassName == 'StreamActionsOrder') {
      return deserialize<_i25.StreamActionsOrder>(data['data']);
    }
    if (dataClassName == 'StreamOrder') {
      return deserialize<_i26.StreamOrder>(data['data']);
    }
    if (dataClassName == 'OrderItemStatus') {
      return deserialize<_i27.OrderItemStatus>(data['data']);
    }
    if (dataClassName == 'OrderStatus') {
      return deserialize<_i28.OrderStatus>(data['data']);
    }
    if (dataClassName == 'PayMethode') {
      return deserialize<_i29.PayMethode>(data['data']);
    }
    if (dataClassName == 'ArticleCount') {
      return deserialize<_i30.ArticleCount>(data['data']);
    }
    if (dataClassName == 'BuildingDetailedStats') {
      return deserialize<_i31.BuildingDetailedStats>(data['data']);
    }
    if (dataClassName == 'CashRegisterStats') {
      return deserialize<_i32.CashRegisterStats>(data['data']);
    }
    if (dataClassName == 'CashRegisterSummary') {
      return deserialize<_i33.CashRegisterSummary>(data['data']);
    }
    if (dataClassName == 'CategoryCount') {
      return deserialize<_i34.CategoryCount>(data['data']);
    }
    if (dataClassName == 'CategoryRevenue') {
      return deserialize<_i35.CategoryRevenue>(data['data']);
    }
    if (dataClassName == 'DailyRevenue') {
      return deserialize<_i36.DailyRevenue>(data['data']);
    }
    if (dataClassName == 'EmployeeStats') {
      return deserialize<_i37.EmployeeStats>(data['data']);
    }
    if (dataClassName == 'Funds') {
      return deserialize<_i38.Funds>(data['data']);
    }
    if (dataClassName == 'HourlyRevenue') {
      return deserialize<_i39.HourlyRevenue>(data['data']);
    }
    if (dataClassName == 'Stats') {
      return deserialize<_i40.Stats>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i52.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i41.Protocol().deserializeByClassName(data);
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
    if (record is ({_i41.AuthSuccess authSuccess, _i44.Employer? employer})) {
      return {
        "n": {
          "authSuccess": record.authSuccess,
          "employer": record.employer,
        },
      };
    }
    try {
      return _i52.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i41.Protocol().mapRecordToJson(record);
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
