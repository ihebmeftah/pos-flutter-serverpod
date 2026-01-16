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
import '../cateogrie/categorie_endpoint.dart' as _i8;
import '../employer/employer_endpoint.dart' as _i9;
import '../order/order_endpoint.dart' as _i10;
import '../order/order_item_endpoint.dart' as _i11;
import 'package:pos_server/src/generated/access/access.dart' as _i12;
import 'package:pos_server/src/generated/article/article.dart' as _i13;
import 'package:pos_server/src/generated/protocol.dart' as _i14;
import 'package:pos_server/src/generated/buildings/building.dart' as _i15;
import 'package:pos_server/src/generated/cateogrie/categorie.dart' as _i16;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i17;
import 'package:pos_server/src/generated/order/order_status_enum.dart' as _i18;
import 'package:pos_server/src/generated/order/order.dart' as _i19;
import 'package:pos_server/src/generated/order/order_item.dart' as _i20;
import 'package:pos_server/src/generated/order/order_item_status_enum.dart'
    as _i21;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i22;

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
      'categorie': _i8.CategorieEndpoint()
        ..initialize(
          server,
          'categorie',
          null,
        ),
      'employer': _i9.EmployerEndpoint()
        ..initialize(
          server,
          'employer',
          null,
        ),
      'order': _i10.OrderEndpoint()
        ..initialize(
          server,
          'order',
          null,
        ),
      'orderItem': _i11.OrderItemEndpoint()
        ..initialize(
          server,
          'orderItem',
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
              type: _i1.getType<_i12.Access>(),
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
              type: _i1.getType<_i12.Access>(),
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
        'getAllAccesses': _i1.MethodConnector(
          name: 'getAllAccesses',
          params: {
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['access'] as _i2.AccessEndpoint).getAllAccesses(
                    session,
                    params['buildingId'],
                  ),
        ),
        'getAccessById': _i1.MethodConnector(
          name: 'getAccessById',
          params: {
            'accessId': _i1.ParameterDescription(
              name: 'accessId',
              type: _i1.getType<int>(),
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
              type: _i1.getType<int>(),
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
        'assignAccessToEmployer': _i1.MethodConnector(
          name: 'assignAccessToEmployer',
          params: {
            'employerId': _i1.ParameterDescription(
              name: 'employerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'accessId': _i1.ParameterDescription(
              name: 'accessId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['access'] as _i2.AccessEndpoint)
                  .assignAccessToEmployer(
                    session,
                    params['employerId'],
                    params['accessId'],
                  ),
        ),
      },
    );
    connectors['article'] = _i1.EndpointConnector(
      name: 'article',
      endpoint: endpoints['article']!,
      methodConnectors: {
        'getArticles': _i1.MethodConnector(
          name: 'getArticles',
          params: {
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'categoryId': _i1.ParameterDescription(
              name: 'categoryId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['article'] as _i3.ArticleEndpoint).getArticles(
                    session,
                    params['buildingId'],
                    categoryId: params['categoryId'],
                  ),
        ),
        'createArticle': _i1.MethodConnector(
          name: 'createArticle',
          params: {
            'article': _i1.ParameterDescription(
              name: 'article',
              type: _i1.getType<_i13.Article>(),
              nullable: false,
            ),
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<int>(),
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
                    article: params['article'],
                    buildingId: params['buildingId'],
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
                  .then((record) => _i14.Protocol().mapRecordToJson(record)),
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
        'getAllBuildings': _i1.MethodConnector(
          name: 'getAllBuildings',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['building'] as _i6.BuildingEndpoint)
                  .getAllBuildings(session),
        ),
        'createBuilding': _i1.MethodConnector(
          name: 'createBuilding',
          params: {
            'building': _i1.ParameterDescription(
              name: 'building',
              type: _i1.getType<_i15.Building>(),
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
              type: _i1.getType<int>(),
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
              type: _i1.getType<_i15.Building>(),
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
      },
    );
    connectors['buildingTables'] = _i1.EndpointConnector(
      name: 'buildingTables',
      endpoint: endpoints['buildingTables']!,
      methodConnectors: {
        'getTables': _i1.MethodConnector(
          name: 'getTables',
          params: {
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['buildingTables'] as _i7.BuildingTablesEndpoint)
                      .getTables(
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
              type: _i1.getType<int>(),
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
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['categorie'] as _i8.CategorieEndpoint)
                  .getCategories(
                    session,
                    params['buildingId'],
                  ),
        ),
        'createCategorie': _i1.MethodConnector(
          name: 'createCategorie',
          params: {
            'categorie': _i1.ParameterDescription(
              name: 'categorie',
              type: _i1.getType<_i16.Categorie>(),
              nullable: false,
            ),
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['categorie'] as _i8.CategorieEndpoint)
                  .createCategorie(
                    session,
                    categorie: params['categorie'],
                    buildingId: params['buildingId'],
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
            'userProfileData': _i1.ParameterDescription(
              name: 'userProfileData',
              type: _i1.getType<_i17.UserProfileData>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'accessId': _i1.ParameterDescription(
              name: 'accessId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['employer'] as _i9.EmployerEndpoint)
                  .createEmployerAccount(
                    session,
                    params['userProfileData'],
                    params['password'],
                    params['buildingId'],
                    params['accessId'],
                  ),
        ),
        'getEmployers': _i1.MethodConnector(
          name: 'getEmployers',
          params: {
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['employer'] as _i9.EmployerEndpoint).getEmployers(
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
              ) async => (endpoints['employer'] as _i9.EmployerEndpoint)
                  .getEmployerByIdentifier(
                    session,
                    params['identifier'],
                  ),
        ),
      },
    );
    connectors['order'] = _i1.EndpointConnector(
      name: 'order',
      endpoint: endpoints['order']!,
      methodConnectors: {
        'getOrders': _i1.MethodConnector(
          name: 'getOrders',
          params: {
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'orderStatus': _i1.ParameterDescription(
              name: 'orderStatus',
              type: _i1.getType<_i18.OrderStatus?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['order'] as _i10.OrderEndpoint).getOrders(
                session,
                params['buildingId'],
                params['orderStatus'],
              ),
        ),
        'getOrderById': _i1.MethodConnector(
          name: 'getOrderById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['order'] as _i10.OrderEndpoint).getOrderById(
                    session,
                    params['id'],
                  ),
        ),
        'createOrder': _i1.MethodConnector(
          name: 'createOrder',
          params: {
            'order': _i1.ParameterDescription(
              name: 'order',
              type: _i1.getType<_i19.Order>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['order'] as _i10.OrderEndpoint).createOrder(
                session,
                params['order'],
              ),
        ),
        'getOrderCurrOfTable': _i1.MethodConnector(
          name: 'getOrderCurrOfTable',
          params: {
            'tableId': _i1.ParameterDescription(
              name: 'tableId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['order'] as _i10.OrderEndpoint)
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
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'orderStatus': _i1.ParameterDescription(
              name: 'orderStatus',
              type: _i1.getType<_i18.OrderStatus?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['order'] as _i10.OrderEndpoint).getOrdersOfTable(
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
            'orderId': _i1.ParameterDescription(
              name: 'orderId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'orderItems': _i1.ParameterDescription(
              name: 'orderItems',
              type: _i1.getType<List<_i20.OrderItem>>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['orderItem'] as _i11.OrderItemEndpoint)
                  .appendItemsToOrder(
                    session,
                    params['orderId'],
                    params['orderItems'],
                  ),
        ),
        'changeOrderItemsStatus': _i1.MethodConnector(
          name: 'changeOrderItemsStatus',
          params: {
            'orderItemIds': _i1.ParameterDescription(
              name: 'orderItemIds',
              type: _i1.getType<List<int>>(),
              nullable: false,
            ),
            'newStatus': _i1.ParameterDescription(
              name: 'newStatus',
              type: _i1.getType<_i21.OrderItemStatus>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['orderItem'] as _i11.OrderItemEndpoint)
                  .changeOrderItemsStatus(
                    session,
                    params['orderItemIds'],
                    params['newStatus'],
                  ),
        ),
        'payOrderItem': _i1.MethodConnector(
          name: 'payOrderItem',
          params: {
            'orderId': _i1.ParameterDescription(
              name: 'orderId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'orderItemPayedIds': _i1.ParameterDescription(
              name: 'orderItemPayedIds',
              type: _i1.getType<List<int>>(),
              nullable: false,
            ),
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['orderItem'] as _i11.OrderItemEndpoint)
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
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'buildingId': _i1.ParameterDescription(
              name: 'buildingId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['orderItem'] as _i11.OrderItemEndpoint)
                  .payAllItems(
                    session,
                    params['orderId'],
                    params['buildingId'],
                  ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _i22.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _i17.Endpoints()
      ..initializeEndpoints(server);
  }
}
