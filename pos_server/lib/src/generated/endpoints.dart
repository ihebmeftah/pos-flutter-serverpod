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
import '../access/access_endpoint.dart' as _i2;
import '../article/article_endpoint.dart' as _i3;
import '../auth/email_idp_endpoint.dart' as _i4;
import '../auth/jwt_refresh_endpoint.dart' as _i5;
import '../buildings/building_endpoint.dart' as _i6;
import '../buildings_tables/building_tables_endpoint.dart' as _i7;
import '../cash_register/cash_register_endpoint.dart' as _i8;
import '../cateogrie/categorie_endpoint.dart' as _i9;
import '../employer/employer_endpoint.dart' as _i10;
import '../ingredient/ingredient_endpoint.dart' as _i11;
import '../order/order_endpoint.dart' as _i12;
import '../order/order_item_endpoint.dart' as _i13;
import '../stats/stats_endpoint.dart' as _i14;
import 'package:pos_server/src/generated/access/access.dart' as _i15;
import 'package:pos_server/src/generated/article/dto/create_article.dto.dart'
    as _i16;
import 'package:pos_server/src/generated/article/dto/update_article.dto.dart'
    as _i17;
import 'package:pos_server/src/generated/protocol.dart' as _i18;
import 'package:pos_server/src/generated/buildings/building.dart' as _i19;
import 'package:pos_server/src/generated/cateogrie/dto/update_categorie.dto.dart'
    as _i20;
import 'package:pos_server/src/generated/cateogrie/dto/create_categorie.dto.dart'
    as _i21;
import 'package:pos_server/src/generated/employer/create_employer.dto.dart'
    as _i22;
import 'package:pos_server/src/generated/ingredient/ingredient.dart' as _i23;
import 'package:pos_server/src/generated/order/order_status_enum.dart' as _i24;
import 'package:pos_server/src/generated/order/dto/create_order.dto.dart'
    as _i25;
import 'package:pos_server/src/generated/order/dto/append_items.dto.dart'
    as _i26;
import 'package:pos_server/src/generated/order/order_item_status_enum.dart'
    as _i27;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i28;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i29;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'access': _i2.AccessEndpoint()
        ..initialize(
          server,
          'access',
          null,
        ),
      'article': _i3.ArticleEndpoint()
        ..initialize(
          server,
          'article',
          null,
        ),
      'emailIdp': _i4.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _i5.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'building': _i6.BuildingEndpoint()
        ..initialize(
          server,
          'building',
          null,
        ),
      'buildingTables': _i7.BuildingTablesEndpoint()
        ..initialize(
          server,
          'buildingTables',
          null,
        ),
      'cashRegister': _i8.CashRegisterEndpoint()
        ..initialize(
          server,
          'cashRegister',
          null,
        ),
      'categorie': _i9.CategorieEndpoint()
        ..initialize(
          server,
          'categorie',
          null,
        ),
      'employer': _i10.EmployerEndpoint()
        ..initialize(
          server,
          'employer',
          null,
        ),
      'ingredient': _i11.IngredientEndpoint()
        ..initialize(
          server,
          'ingredient',
          null,
        ),
      'order': _i12.OrderEndpoint()
        ..initialize(
          server,
          'order',
          null,
        ),
      'orderItem': _i13.OrderItemEndpoint()
        ..initialize(
          server,
          'orderItem',
          null,
        ),
      'stats': _i14.StatsEndpoint()
        ..initialize(
          server,
          'stats',
          null,
        ),
    };
    connectors['access'] = _i1.EndpointConnector(
      name: 'access',
      endpoint: endpoints['access']!,
      methodConnectors: {
        'createAccess': _i1.MethodConnector(
          name: 'createAccess',
          params: {
            'access': _i1.ParameterDescription(
              name: 'access',
              type: _i1.getType<_i15.Access>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['access'] as _i2.AccessEndpoint).createAccess(
                    session,
                    params['access'],
                  ),
        ),
        'updateAccess': _i1.MethodConnector(
          name: 'updateAccess',
          params: {
            'access': _i1.ParameterDescription(
              name: 'access',
              type: _i1.getType<_i15.Access>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['access'] as _i2.AccessEndpoint).updateAccess(
                    session,
                    params['access'],
                  ),
        ),
        'getAccessesByBuildingId': _i1.MethodConnector(
          name: 'getAccessesByBuildingId',
          params: {
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['access'] as _i2.AccessEndpoint)
                  .getAccessesByBuildingId(
                    session,
                    params['buildingId'],
                  ),
        ),
        'getAccessById': _i1.MethodConnector(
          name: 'getAccessById',
          params: {
            'accessId': _i1.ParameterDescription(
              name: 'accessId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['access'] as _i2.AccessEndpoint).getAccessById(
                    session,
                    params['accessId'],
                  ),
        ),
        'deleteAccess': _i1.MethodConnector(
          name: 'deleteAccess',
          params: {
            'accessId': _i1.ParameterDescription(
              name: 'accessId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['access'] as _i2.AccessEndpoint).deleteAccess(
                    session,
                    params['accessId'],
                  ),
        ),
      },
    );
    connectors['article'] = _i1.EndpointConnector(
      name: 'article',
      endpoint: endpoints['article']!,
      methodConnectors: {
        'getArticlesByBuildingId': _i1.MethodConnector(
          name: 'getArticlesByBuildingId',
          params: {
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'categoryId': _i1.ParameterDescription(
              name: 'categoryId',
              type: _i1.getType<_i1.UuidValue?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['article'] as _i3.ArticleEndpoint)
                  .getArticlesByBuildingId(
                    session,
                    params['buildingId'],
                    categoryId: params['categoryId'],
                  ),
        ),
        'createArticle': _i1.MethodConnector(
          name: 'createArticle',
          params: {
            'articleDto': _i1.ParameterDescription(
              name: 'articleDto',
              type: _i1.getType<_i16.CreateArticleDto>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['article'] as _i3.ArticleEndpoint).createArticle(
                    session,
                    params['articleDto'],
                  ),
        ),
        'getArticleById': _i1.MethodConnector(
          name: 'getArticleById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['article'] as _i3.ArticleEndpoint).getArticleById(
                    session,
                    params['id'],
                    params['buildingId'],
                  ),
        ),
        'updateArticle': _i1.MethodConnector(
          name: 'updateArticle',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'articleDto': _i1.ParameterDescription(
              name: 'articleDto',
              type: _i1.getType<_i17.UpdateArticleDto>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['article'] as _i3.ArticleEndpoint).updateArticle(
                    session,
                    params['id'],
                    params['buildingId'],
                    params['articleDto'],
                  ),
        ),
      },
    );
    connectors['emailIdp'] = _i1.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'getUserProfile': _i1.MethodConnector(
          name: 'getUserProfile',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i4.EmailIdpEndpoint)
                  .getUserProfile(session),
        ),
        'loginReworked': _i1.MethodConnector(
          name: 'loginReworked',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i4.EmailIdpEndpoint)
                  .loginReworked(
                    session,
                    email: params['email'],
                    password: params['password'],
                  )
                  .then((record) => _i18.Protocol().mapRecordToJson(record)),
        ),
        'registerReworked': _i1.MethodConnector(
          name: 'registerReworked',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i4.EmailIdpEndpoint)
                  .registerReworked(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCodeReworked': _i1.MethodConnector(
          name: 'verifyRegistrationCodeReworked',
          params: {
            'accountRequestId': _i1.ParameterDescription(
              name: 'accountRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i4.EmailIdpEndpoint)
                  .verifyRegistrationCodeReworked(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                    password: params['password'],
                  ),
        ),
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i4.EmailIdpEndpoint).login(
                session,
                email: params['email'],
                password: params['password'],
              ),
        ),
        'startRegistration': _i1.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i4.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _i1.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _i1.ParameterDescription(
              name: 'accountRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i4.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _i1.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _i1.ParameterDescription(
              name: 'registrationToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i4.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _i1.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i4.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _i1.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _i1.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i4.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _i1.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _i1.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'newPassword': _i1.ParameterDescription(
              name: 'newPassword',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i4.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
      },
    );
    connectors['jwtRefresh'] = _i1.EndpointConnector(
      name: 'jwtRefresh',
      endpoint: endpoints['jwtRefresh']!,
      methodConnectors: {
        'refreshAccessToken': _i1.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _i1.ParameterDescription(
              name: 'refreshToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['jwtRefresh'] as _i5.JwtRefreshEndpoint)
                  .refreshAccessToken(
                    session,
                    refreshToken: params['refreshToken'],
                  ),
        ),
      },
    );
    connectors['building'] = _i1.EndpointConnector(
      name: 'building',
      endpoint: endpoints['building']!,
      methodConnectors: {
        'getBuildingsOfOwner': _i1.MethodConnector(
          name: 'getBuildingsOfOwner',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['building'] as _i6.BuildingEndpoint)
                  .getBuildingsOfOwner(session),
        ),
        'getBuildings': _i1.MethodConnector(
          name: 'getBuildings',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['building'] as _i6.BuildingEndpoint)
                  .getBuildings(session),
        ),
        'createBuilding': _i1.MethodConnector(
          name: 'createBuilding',
          params: {
            'building': _i1.ParameterDescription(
              name: 'building',
              type: _i1.getType<_i19.Building>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['building'] as _i6.BuildingEndpoint)
                  .createBuilding(
                    session,
                    params['building'],
                  ),
        ),
        'getBuildingById': _i1.MethodConnector(
          name: 'getBuildingById',
          params: {
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['building'] as _i6.BuildingEndpoint)
                  .getBuildingById(
                    session,
                    params['buildingId'],
                  ),
        ),
        'updateBuilding': _i1.MethodConnector(
          name: 'updateBuilding',
          params: {
            'building': _i1.ParameterDescription(
              name: 'building',
              type: _i1.getType<_i19.Building>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['building'] as _i6.BuildingEndpoint)
                  .updateBuilding(
                    session,
                    params['building'],
                  ),
        ),
        'watchUpdateBuildings': _i1.MethodStreamConnector(
          name: 'watchUpdateBuildings',
          params: {
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
                Map<String, Stream> streamParams,
              ) => (endpoints['building'] as _i6.BuildingEndpoint)
                  .watchUpdateBuildings(
                    session,
                    params['buildingId'],
                  ),
        ),
      },
    );
    connectors['buildingTables'] = _i1.EndpointConnector(
      name: 'buildingTables',
      endpoint: endpoints['buildingTables']!,
      methodConnectors: {
        'getTablesByBuildingId': _i1.MethodConnector(
          name: 'getTablesByBuildingId',
          params: {
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['buildingTables'] as _i7.BuildingTablesEndpoint)
                      .getTablesByBuildingId(
                        session,
                        params['buildingId'],
                      ),
        ),
        'createTables': _i1.MethodConnector(
          name: 'createTables',
          params: {
            'nbtables': _i1.ParameterDescription(
              name: 'nbtables',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'seatsMax': _i1.ParameterDescription(
              name: 'seatsMax',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['buildingTables'] as _i7.BuildingTablesEndpoint)
                      .createTables(
                        session,
                        nbtables: params['nbtables'],
                        seatsMax: params['seatsMax'],
                        buildingId: params['buildingId'],
                      ),
        ),
        'getTableById': _i1.MethodConnector(
          name: 'getTableById',
          params: {
            'tableId': _i1.ParameterDescription(
              name: 'tableId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['buildingTables'] as _i7.BuildingTablesEndpoint)
                      .getTableById(
                        session,
                        params['tableId'],
                        params['buildingId'],
                      ),
        ),
        'mangeTableActivation': _i1.MethodConnector(
          name: 'mangeTableActivation',
          params: {
            'tableId': _i1.ParameterDescription(
              name: 'tableId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['buildingTables'] as _i7.BuildingTablesEndpoint)
                      .mangeTableActivation(
                        session,
                        params['tableId'],
                        params['buildingId'],
                      ),
        ),
      },
    );
    connectors['cashRegister'] = _i1.EndpointConnector(
      name: 'cashRegister',
      endpoint: endpoints['cashRegister']!,
      methodConnectors: {
        'getCashRegisters': _i1.MethodConnector(
          name: 'getCashRegisters',
          params: {
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['cashRegister'] as _i8.CashRegisterEndpoint)
                  .getCashRegisters(
                    session,
                    params['buildingId'],
                  ),
        ),
        'createCashRegister': _i1.MethodConnector(
          name: 'createCashRegister',
          params: {
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'startAmount': _i1.ParameterDescription(
              name: 'startAmount',
              type: _i1.getType<double?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['cashRegister'] as _i8.CashRegisterEndpoint)
                  .createCashRegister(
                    session,
                    params['buildingId'],
                    params['startAmount'],
                  ),
        ),
        'closeLastCashRegister': _i1.MethodConnector(
          name: 'closeLastCashRegister',
          params: {
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'endAmount': _i1.ParameterDescription(
              name: 'endAmount',
              type: _i1.getType<double?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['cashRegister'] as _i8.CashRegisterEndpoint)
                  .closeLastCashRegister(
                    session,
                    params['buildingId'],
                    params['endAmount'],
                  ),
        ),
      },
    );
    connectors['categorie'] = _i1.EndpointConnector(
      name: 'categorie',
      endpoint: endpoints['categorie']!,
      methodConnectors: {
        'getCategories': _i1.MethodConnector(
          name: 'getCategories',
          params: {
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['categorie'] as _i9.CategorieEndpoint)
                  .getCategories(
                    session,
                    params['buildingId'],
                  ),
        ),
        'getCategorieById': _i1.MethodConnector(
          name: 'getCategorieById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['categorie'] as _i9.CategorieEndpoint)
                  .getCategorieById(
                    session,
                    params['id'],
                    params['buildingId'],
                  ),
        ),
        'createCategorie': _i1.MethodConnector(
          name: 'createCategorie',
          params: {
            'categorieDto': _i1.ParameterDescription(
              name: 'categorieDto',
              type: _i1.getType<_i20.CreateCategorieDto>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['categorie'] as _i9.CategorieEndpoint)
                  .createCategorie(
                    session,
                    params['categorieDto'],
                  ),
        ),
        'updateCategorie': _i1.MethodConnector(
          name: 'updateCategorie',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'categorieDto': _i1.ParameterDescription(
              name: 'categorieDto',
              type: _i1.getType<_i21.UpdateCategorieDto>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['categorie'] as _i9.CategorieEndpoint)
                  .updateCategorie(
                    session,
                    params['id'],
                    params['buildingId'],
                    params['categorieDto'],
                  ),
        ),
      },
    );
    connectors['employer'] = _i1.EndpointConnector(
      name: 'employer',
      endpoint: endpoints['employer']!,
      methodConnectors: {
        'createEmployerAccount': _i1.MethodConnector(
          name: 'createEmployerAccount',
          params: {
            'createEmployerDto': _i1.ParameterDescription(
              name: 'createEmployerDto',
              type: _i1.getType<_i22.CreateEmployerDTO>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['employer'] as _i10.EmployerEndpoint)
                  .createEmployerAccount(
                    session,
                    params['createEmployerDto'],
                  ),
        ),
        'getEmployers': _i1.MethodConnector(
          name: 'getEmployers',
          params: {
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['employer'] as _i10.EmployerEndpoint).getEmployers(
                    session,
                    params['buildingId'],
                  ),
        ),
        'getEmployerByIdentifier': _i1.MethodConnector(
          name: 'getEmployerByIdentifier',
          params: {
            'identifier': _i1.ParameterDescription(
              name: 'identifier',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['employer'] as _i10.EmployerEndpoint)
                  .getEmployerByIdentifier(
                    session,
                    params['identifier'],
                  ),
        ),
        'assignAccessToEmployer': _i1.MethodConnector(
          name: 'assignAccessToEmployer',
          params: {
            'employerId': _i1.ParameterDescription(
              name: 'employerId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'accessId': _i1.ParameterDescription(
              name: 'accessId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['employer'] as _i10.EmployerEndpoint)
                  .assignAccessToEmployer(
                    session,
                    params['employerId'],
                    params['accessId'],
                  ),
        ),
        'blockEmployer': _i1.MethodConnector(
          name: 'blockEmployer',
          params: {
            'identifier': _i1.ParameterDescription(
              name: 'identifier',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'isBlocked': _i1.ParameterDescription(
              name: 'isBlocked',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['employer'] as _i10.EmployerEndpoint)
                  .blockEmployer(
                    session,
                    params['identifier'],
                    params['isBlocked'],
                  ),
        ),
      },
    );
    connectors['ingredient'] = _i1.EndpointConnector(
      name: 'ingredient',
      endpoint: endpoints['ingredient']!,
      methodConnectors: {
        'getIngredientsByBuildingId': _i1.MethodConnector(
          name: 'getIngredientsByBuildingId',
          params: {
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['ingredient'] as _i11.IngredientEndpoint)
                  .getIngredientsByBuildingId(
                    session,
                    params['buildingId'],
                  ),
        ),
        'createIngredient': _i1.MethodConnector(
          name: 'createIngredient',
          params: {
            'ingredient': _i1.ParameterDescription(
              name: 'ingredient',
              type: _i1.getType<_i23.Ingredient>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['ingredient'] as _i11.IngredientEndpoint)
                  .createIngredient(
                    session,
                    params['ingredient'],
                  ),
        ),
        'getIngredintById': _i1.MethodConnector(
          name: 'getIngredintById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['ingredient'] as _i11.IngredientEndpoint)
                  .getIngredintById(
                    session,
                    params['id'],
                    params['buildingId'],
                  ),
        ),
      },
    );
    connectors['order'] = _i1.EndpointConnector(
      name: 'order',
      endpoint: endpoints['order']!,
      methodConnectors: {
        'getOrdersByBuilingId': _i1.MethodConnector(
          name: 'getOrdersByBuilingId',
          params: {
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'orderStatus': _i1.ParameterDescription(
              name: 'orderStatus',
              type: _i1.getType<_i24.OrderStatus?>(),
              nullable: true,
            ),
            'cashRegisterId': _i1.ParameterDescription(
              name: 'cashRegisterId',
              type: _i1.getType<_i1.UuidValue?>(),
              nullable: true,
            ),
            'fromDate': _i1.ParameterDescription(
              name: 'fromDate',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
            'toDate': _i1.ParameterDescription(
              name: 'toDate',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['order'] as _i12.OrderEndpoint)
                  .getOrdersByBuilingId(
                    session,
                    params['buildingId'],
                    params['orderStatus'],
                    params['cashRegisterId'],
                    params['fromDate'],
                    params['toDate'],
                  ),
        ),
        'getOrderById': _i1.MethodConnector(
          name: 'getOrderById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['order'] as _i12.OrderEndpoint).getOrderById(
                    session,
                    params['id'],
                  ),
        ),
        'createOrder': _i1.MethodConnector(
          name: 'createOrder',
          params: {
            'orderDto': _i1.ParameterDescription(
              name: 'orderDto',
              type: _i1.getType<_i25.CreateOrderDto>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['order'] as _i12.OrderEndpoint).createOrder(
                session,
                params['orderDto'],
              ),
        ),
        'getOrderCurrOfTable': _i1.MethodConnector(
          name: 'getOrderCurrOfTable',
          params: {
            'tableId': _i1.ParameterDescription(
              name: 'tableId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['order'] as _i12.OrderEndpoint)
                  .getOrderCurrOfTable(
                    session,
                    params['tableId'],
                  ),
        ),
        'getOrdersOfTable': _i1.MethodConnector(
          name: 'getOrdersOfTable',
          params: {
            'tableId': _i1.ParameterDescription(
              name: 'tableId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'orderStatus': _i1.ParameterDescription(
              name: 'orderStatus',
              type: _i1.getType<_i24.OrderStatus?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['order'] as _i12.OrderEndpoint).getOrdersOfTable(
                    session,
                    params['tableId'],
                    params['orderStatus'],
                  ),
        ),
      },
    );
    connectors['orderItem'] = _i1.EndpointConnector(
      name: 'orderItem',
      endpoint: endpoints['orderItem']!,
      methodConnectors: {
        'appendItemsToOrder': _i1.MethodConnector(
          name: 'appendItemsToOrder',
          params: {
            'appendItemDto': _i1.ParameterDescription(
              name: 'appendItemDto',
              type: _i1.getType<_i26.AppendItemsDto>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['orderItem'] as _i13.OrderItemEndpoint)
                  .appendItemsToOrder(
                    session,
                    params['appendItemDto'],
                  ),
        ),
        'changeOrderItemsStatus': _i1.MethodConnector(
          name: 'changeOrderItemsStatus',
          params: {
            'orderItemIds': _i1.ParameterDescription(
              name: 'orderItemIds',
              type: _i1.getType<List<_i1.UuidValue>>(),
              nullable: false,
            ),
            'newStatus': _i1.ParameterDescription(
              name: 'newStatus',
              type: _i1.getType<_i27.OrderItemStatus>(),
              nullable: false,
            ),
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['orderItem'] as _i13.OrderItemEndpoint)
                  .changeOrderItemsStatus(
                    session,
                    params['orderItemIds'],
                    params['newStatus'],
                    params['buildingId'],
                  ),
        ),
        'payOrderItem': _i1.MethodConnector(
          name: 'payOrderItem',
          params: {
            'orderId': _i1.ParameterDescription(
              name: 'orderId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'orderItemPayedIds': _i1.ParameterDescription(
              name: 'orderItemPayedIds',
              type: _i1.getType<List<_i1.UuidValue>>(),
              nullable: false,
            ),
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['orderItem'] as _i13.OrderItemEndpoint)
                  .payOrderItem(
                    session,
                    params['orderId'],
                    params['orderItemPayedIds'],
                    params['buildingId'],
                  ),
        ),
        'payAllItems': _i1.MethodConnector(
          name: 'payAllItems',
          params: {
            'orderId': _i1.ParameterDescription(
              name: 'orderId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['orderItem'] as _i13.OrderItemEndpoint)
                  .payAllItems(
                    session,
                    params['orderId'],
                    params['buildingId'],
                  ),
        ),
      },
    );
    connectors['stats'] = _i1.EndpointConnector(
      name: 'stats',
      endpoint: endpoints['stats']!,
      methodConnectors: {
        'getStats': _i1.MethodConnector(
          name: 'getStats',
          params: {
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['stats'] as _i14.StatsEndpoint).getStats(
                session,
                params['buildingId'],
              ),
        ),
        'getCashRegisterStats': _i1.MethodConnector(
          name: 'getCashRegisterStats',
          params: {
            'cashRegisterId': _i1.ParameterDescription(
              name: 'cashRegisterId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['stats'] as _i14.StatsEndpoint)
                  .getCashRegisterStats(
                    session,
                    params['cashRegisterId'],
                  ),
        ),
        'getBuildingDetailedStats': _i1.MethodConnector(
          name: 'getBuildingDetailedStats',
          params: {
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'startDate': _i1.ParameterDescription(
              name: 'startDate',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
            'endDate': _i1.ParameterDescription(
              name: 'endDate',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['stats'] as _i14.StatsEndpoint)
                  .getBuildingDetailedStats(
                    session,
                    params['buildingId'],
                    startDate: params['startDate'],
                    endDate: params['endDate'],
                  ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _i28.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _i29.Endpoints()
      ..initializeEndpoints(server);
  }
}
