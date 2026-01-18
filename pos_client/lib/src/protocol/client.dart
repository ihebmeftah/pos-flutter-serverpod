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
import 'dart:async' as _i2;
import 'package:pos_client/src/protocol/access/access.dart' as _i3;
import 'package:pos_client/src/protocol/article/article.dart' as _i4;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i5;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i6;
import 'package:pos_client/src/protocol/employer/employer.dart' as _i7;
import 'package:pos_client/src/protocol/buildings/building.dart' as _i8;
import 'package:pos_client/src/protocol/buildings_tables/building_tables.dart'
    as _i9;
import 'package:pos_client/src/protocol/caisse/caisse.dart' as _i10;
import 'package:pos_client/src/protocol/cateogrie/categorie.dart' as _i11;
import 'package:pos_client/src/protocol/employer/create_employer.dto.dart'
    as _i12;
import 'package:pos_client/src/protocol/order/order.dart' as _i13;
import 'package:pos_client/src/protocol/order/order_status_enum.dart' as _i14;
import 'package:pos_client/src/protocol/order/order_item.dart' as _i15;
import 'package:pos_client/src/protocol/order/order_item_status_enum.dart'
    as _i16;
import 'protocol.dart' as _i17;

/// {@category Endpoint}
class EndpointAccess extends _i1.EndpointRef {
  EndpointAccess(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'access';

  _i2.Future<_i3.Access> createAccess(_i3.Access access) =>
      caller.callServerEndpoint<_i3.Access>(
        'access',
        'createAccess',
        {'access': access},
      );

  _i2.Future<_i3.Access> updateAccess(_i3.Access access) =>
      caller.callServerEndpoint<_i3.Access>(
        'access',
        'updateAccess',
        {'access': access},
      );

  _i2.Future<List<_i3.Access>> getAccessesByBuildingId(
    _i1.UuidValue buildingId,
  ) => caller.callServerEndpoint<List<_i3.Access>>(
    'access',
    'getAccessesByBuildingId',
    {'buildingId': buildingId},
  );

  _i2.Future<_i3.Access> getAccessById(_i1.UuidValue accessId) =>
      caller.callServerEndpoint<_i3.Access>(
        'access',
        'getAccessById',
        {'accessId': accessId},
      );

  _i2.Future<_i3.Access> deleteAccess(_i1.UuidValue accessId) =>
      caller.callServerEndpoint<_i3.Access>(
        'access',
        'deleteAccess',
        {'accessId': accessId},
      );
}

/// {@category Endpoint}
class EndpointArticle extends _i1.EndpointRef {
  EndpointArticle(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'article';

  /// Get Articles by building id
  /// required [buildingId] buildingId The id of the building
  /// optional [categoryId] The id of the category
  /// Returns a list of [Article] articles
  _i2.Future<List<_i4.Article>> getArticlesByBuildingId(
    _i1.UuidValue buildingId, {
    _i1.UuidValue? categoryId,
  }) => caller.callServerEndpoint<List<_i4.Article>>(
    'article',
    'getArticlesByBuildingId',
    {
      'buildingId': buildingId,
      'categoryId': categoryId,
    },
  );

  /// Create new article
  /// required [article] The article to create
  /// Returns the created [Article] article
  /// allow for admin users only
  _i2.Future<_i4.Article> createArticle(_i4.Article article) =>
      caller.callServerEndpoint<_i4.Article>(
        'article',
        'createArticle',
        {'article': article},
      );

  /// Get article by id
  /// required [articleId] The id of the article
  /// Returns the [Article] article
  _i2.Future<_i4.Article> getArticleById(_i1.UuidValue id) =>
      caller.callServerEndpoint<_i4.Article>(
        'article',
        'getArticleById',
        {'id': id},
      );

  /// Update article
  /// required [article] The article to update
  /// Returns the updated [Article] article
  /// allow for owner users only
  _i2.Future<_i4.Article> updateArticle({required _i4.Article article}) =>
      caller.callServerEndpoint<_i4.Article>(
        'article',
        'updateArticle',
        {'article': article},
      );
}

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
/// {@category Endpoint}
class EndpointEmailIdp extends _i5.EndpointEmailIdpBase {
  EndpointEmailIdp(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'emailIdp';

  _i2.Future<_i6.UserProfile> getUserProfile() =>
      caller.callServerEndpoint<_i6.UserProfile>(
        'emailIdp',
        'getUserProfile',
        {},
      );

  /// A reworked login method that returns an Employer on successful login.
  /// If the logged-in user is an admin, it returns null.
  _i2.Future<({_i6.AuthSuccess authSuccess, _i7.Employer? employer})>
  loginReworked({
    required String email,
    required String password,
  }) =>
      caller.callServerEndpoint<
        ({_i6.AuthSuccess authSuccess, _i7.Employer? employer})
      >(
        'emailIdp',
        'loginReworked',
        {
          'email': email,
          'password': password,
        },
      );

  _i2.Future<_i1.UuidValue> registerReworked({required String email}) =>
      caller.callServerEndpoint<_i1.UuidValue>(
        'emailIdp',
        'registerReworked',
        {'email': email},
      );

  ///Reworked verify registration code to assign owner scope
  _i2.Future<_i6.AuthSuccess> verifyRegistrationCodeReworked({
    required _i1.UuidValue accountRequestId,
    required String verificationCode,
    required String password,
  }) => caller.callServerEndpoint<_i6.AuthSuccess>(
    'emailIdp',
    'verifyRegistrationCodeReworked',
    {
      'accountRequestId': accountRequestId,
      'verificationCode': verificationCode,
      'password': password,
    },
  );

  /// Logs in the user and returns a new session.
  ///
  /// Throws an [EmailAccountLoginException] in case of errors, with reason:
  /// - [EmailAccountLoginExceptionReason.invalidCredentials] if the email or
  ///   password is incorrect.
  /// - [EmailAccountLoginExceptionReason.tooManyAttempts] if there have been
  ///   too many failed login attempts.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _i2.Future<_i6.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_i6.AuthSuccess>(
    'emailIdp',
    'login',
    {
      'email': email,
      'password': password,
    },
  );

  /// Starts the registration for a new user account with an email-based login
  /// associated to it.
  ///
  /// Upon successful completion of this method, an email will have been
  /// sent to [email] with a verification link, which the user must open to
  /// complete the registration.
  ///
  /// Always returns a account request ID, which can be used to complete the
  /// registration. If the email is already registered, the returned ID will not
  /// be valid.
  @override
  _i2.Future<_i1.UuidValue> startRegistration({required String email}) =>
      caller.callServerEndpoint<_i1.UuidValue>(
        'emailIdp',
        'startRegistration',
        {'email': email},
      );

  /// Verifies an account request code and returns a token
  /// that can be used to complete the account creation.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if no request exists
  ///   for the given [accountRequestId] or [verificationCode] is invalid.
  @override
  _i2.Future<String> verifyRegistrationCode({
    required _i1.UuidValue accountRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyRegistrationCode',
    {
      'accountRequestId': accountRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a new account registration, creating a new auth user with a
  /// profile and attaching the given email account to it.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if the [registrationToken]
  ///   is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  ///
  /// Returns a session for the newly created user.
  @override
  _i2.Future<_i6.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<_i6.AuthSuccess>(
    'emailIdp',
    'finishRegistration',
    {
      'registrationToken': registrationToken,
      'password': password,
    },
  );

  /// Requests a password reset for [email].
  ///
  /// If the email address is registered, an email with reset instructions will
  /// be send out. If the email is unknown, this method will have no effect.
  ///
  /// Always returns a password reset request ID, which can be used to complete
  /// the reset. If the email is not registered, the returned ID will not be
  /// valid.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to request a password reset.
  ///
  @override
  _i2.Future<_i1.UuidValue> startPasswordReset({required String email}) =>
      caller.callServerEndpoint<_i1.UuidValue>(
        'emailIdp',
        'startPasswordReset',
        {'email': email},
      );

  /// Verifies a password reset code and returns a finishPasswordResetToken
  /// that can be used to finish the password reset.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to verify the password reset.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// If multiple steps are required to complete the password reset, this endpoint
  /// should be overridden to return credentials for the next step instead
  /// of the credentials for setting the password.
  @override
  _i2.Future<String> verifyPasswordResetCode({
    required _i1.UuidValue passwordResetRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyPasswordResetCode',
    {
      'passwordResetRequestId': passwordResetRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a password reset request by setting a new password.
  ///
  /// The [verificationCode] returned from [verifyPasswordResetCode] is used to
  /// validate the password reset request.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.policyViolation] if the new
  ///   password does not comply with the password policy.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _i2.Future<void> finishPasswordReset({
    required String finishPasswordResetToken,
    required String newPassword,
  }) => caller.callServerEndpoint<void>(
    'emailIdp',
    'finishPasswordReset',
    {
      'finishPasswordResetToken': finishPasswordResetToken,
      'newPassword': newPassword,
    },
  );
}

/// By extending [RefreshJwtTokensEndpoint], the JWT token refresh endpoint
/// is made available on the server and enables automatic token refresh on the client.
/// {@category Endpoint}
class EndpointJwtRefresh extends _i6.EndpointRefreshJwtTokens {
  EndpointJwtRefresh(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'jwtRefresh';

  /// Creates a new token pair for the given [refreshToken].
  ///
  /// Can throw the following exceptions:
  /// -[RefreshTokenMalformedException]: refresh token is malformed and could
  ///   not be parsed. Not expected to happen for tokens issued by the server.
  /// -[RefreshTokenNotFoundException]: refresh token is unknown to the server.
  ///   Either the token was deleted or generated by a different server.
  /// -[RefreshTokenExpiredException]: refresh token has expired. Will happen
  ///   only if it has not been used within configured `refreshTokenLifetime`.
  /// -[RefreshTokenInvalidSecretException]: refresh token is incorrect, meaning
  ///   it does not refer to the current secret refresh token. This indicates
  ///   either a malfunctioning client or a malicious attempt by someone who has
  ///   obtained the refresh token. In this case the underlying refresh token
  ///   will be deleted, and access to it will expire fully when the last access
  ///   token is elapsed.
  ///
  /// This endpoint is unauthenticated, meaning the client won't include any
  /// authentication information with the call.
  @override
  _i2.Future<_i6.AuthSuccess> refreshAccessToken({
    required String refreshToken,
  }) => caller.callServerEndpoint<_i6.AuthSuccess>(
    'jwtRefresh',
    'refreshAccessToken',
    {'refreshToken': refreshToken},
    authenticated: false,
  );
}

/// {@category Endpoint}
class EndpointBuilding extends _i1.EndpointRef {
  EndpointBuilding(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'building';

  /// Get buildings of the owner
  /// Returns a list of [Building] buildings
  /// allow for owners users
  _i2.Future<List<_i8.Building>> getBuildingsOfOwner() =>
      caller.callServerEndpoint<List<_i8.Building>>(
        'building',
        'getBuildingsOfOwner',
        {},
      );

  /// Get buildings
  /// Returns a list of [Building] buildings
  /// allow for customer users
  _i2.Future<List<_i8.Building>> getBuildings() =>
      caller.callServerEndpoint<List<_i8.Building>>(
        'building',
        'getBuildings',
        {},
      );

  /// Create new building for the admin
  /// Returns  [Building] building
  /// allowed only for owner
  _i2.Future<_i8.Building> createBuilding(_i8.Building building) =>
      caller.callServerEndpoint<_i8.Building>(
        'building',
        'createBuilding',
        {'building': building},
      );

  /// Get a building by id
  /// required [buildingId] The id of the building
  /// Returns the [Building] building
  _i2.Future<_i8.Building> getBuildingById(_i1.UuidValue buildingId) =>
      caller.callServerEndpoint<_i8.Building>(
        'building',
        'getBuildingById',
        {'buildingId': buildingId},
      );

  _i2.Future<_i8.Building> updateBuilding(_i8.Building building) =>
      caller.callServerEndpoint<_i8.Building>(
        'building',
        'updateBuilding',
        {'building': building},
      );
}

/// Building Tables Endpoint
/// All Endpoint required login
/// {@category Endpoint}
class EndpointBuildingTables extends _i1.EndpointRef {
  EndpointBuildingTables(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'buildingTables';

  /// Get all tables for a building
  /// required [buildingId] buildingId The id of the building
  /// Returns a list of [BTable] tables
  /// allow for all type of users (admin, employee, customer)
  _i2.Future<List<_i9.BTable>> getTablesByBuildingId(
    _i1.UuidValue buildingId,
  ) => caller.callServerEndpoint<List<_i9.BTable>>(
    'buildingTables',
    'getTablesByBuildingId',
    {'buildingId': buildingId},
  );

  /// Create multiple tables for a building
  /// required [nbtables] number of tables to create
  /// required [seatsMax] maximum number of seats per table
  /// required [buildingId] buildingId The id of the building
  /// Returns a list of created [BTable] tables
  /// allow for admin users only
  _i2.Future<List<_i9.BTable>> createTables({
    required int nbtables,
    required int seatsMax,
    required _i1.UuidValue buildingId,
  }) => caller.callServerEndpoint<List<_i9.BTable>>(
    'buildingTables',
    'createTables',
    {
      'nbtables': nbtables,
      'seatsMax': seatsMax,
      'buildingId': buildingId,
    },
  );
}

/// {@category Endpoint}
class EndpointCaisse extends _i1.EndpointRef {
  EndpointCaisse(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'caisse';

  _i2.Future<List<_i10.Caisse>> getCaisses(_i1.UuidValue buildingId) =>
      caller.callServerEndpoint<List<_i10.Caisse>>(
        'caisse',
        'getCaisses',
        {'buildingId': buildingId},
      );

  _i2.Future<_i10.Caisse> createCaisse(_i1.UuidValue buildingId) =>
      caller.callServerEndpoint<_i10.Caisse>(
        'caisse',
        'createCaisse',
        {'buildingId': buildingId},
      );
}

/// {@category Endpoint}
class EndpointCategorie extends _i1.EndpointRef {
  EndpointCategorie(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'categorie';

  /// Get all categories for a building
  /// required [buildingId] buildingId The id of the building
  /// Returns a list of [Categorie] categories
  _i2.Future<List<_i11.Categorie>> getCategories(_i1.UuidValue buildingId) =>
      caller.callServerEndpoint<List<_i11.Categorie>>(
        'categorie',
        'getCategories',
        {'buildingId': buildingId},
      );

  /// Get categorie by id
  /// required [id] The id of the categorie
  /// Returns the [Categorie] categorie
  _i2.Future<_i11.Categorie> getCategorieById(_i1.UuidValue id) =>
      caller.callServerEndpoint<_i11.Categorie>(
        'categorie',
        'getCategorieById',
        {'id': id},
      );

  /// Create new categorie
  /// required [categorie] The categorie to create
  /// Returns the created [Categorie] categorie
  /// allow for owner users only
  _i2.Future<_i11.Categorie> createCategorie(_i11.Categorie categorie) =>
      caller.callServerEndpoint<_i11.Categorie>(
        'categorie',
        'createCategorie',
        {'categorie': categorie},
      );

  /// Update categorie
  /// required [categorie] The categorie to update
  /// Returns the updated [Categorie] categorie
  /// allow for owner users only
  _i2.Future<_i11.Categorie> updateCategorie(_i11.Categorie categorie) =>
      caller.callServerEndpoint<_i11.Categorie>(
        'categorie',
        'updateCategorie',
        {'categorie': categorie},
      );
}

/// {@category Endpoint}
class EndpointEmployer extends _i1.EndpointRef {
  EndpointEmployer(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'employer';

  /// Create new employer account
  /// required [userProfileData] The user profile data
  /// required [password] The password for the account
  /// required [buildingId] buildingId The id of the building
  /// Returns the created [Employer] employer account
  /// allow for iwner users only
  _i2.Future<_i7.Employer> createEmployerAccount(
    _i12.CreateEmployerDTO createEmployerDto,
  ) => caller.callServerEndpoint<_i7.Employer>(
    'employer',
    'createEmployerAccount',
    {'createEmployerDto': createEmployerDto},
  );

  /// Get employers by buildingId
  /// Identifier can be a[buildingId]
  /// Returns list of [Employer]
  /// This enpoint need login and allowed only for owner
  _i2.Future<List<_i7.Employer>> getEmployers(_i1.UuidValue buildingId) =>
      caller.callServerEndpoint<List<_i7.Employer>>(
        'employer',
        'getEmployers',
        {'buildingId': buildingId},
      );

  /// Get employer by identifier
  /// Identifier can be a[authId] or [UserProfileId]
  /// Returns [Employer] if found else throws exception
  /// This enpoint need login and allowed for all users
  _i2.Future<_i7.Employer> getEmployerByIdentifier(_i1.UuidValue identifier) =>
      caller.callServerEndpoint<_i7.Employer>(
        'employer',
        'getEmployerByIdentifier',
        {'identifier': identifier},
      );

  _i2.Future<_i7.Employer> assignAccessToEmployer(
    _i1.UuidValue employerId,
    _i1.UuidValue accessId,
  ) => caller.callServerEndpoint<_i7.Employer>(
    'employer',
    'assignAccessToEmployer',
    {
      'employerId': employerId,
      'accessId': accessId,
    },
  );

  _i2.Future<bool> blockEmployer(
    _i1.UuidValue identifier,
    bool isBlocked,
  ) => caller.callServerEndpoint<bool>(
    'employer',
    'blockEmployer',
    {
      'identifier': identifier,
      'isBlocked': isBlocked,
    },
  );
}

/// {@category Endpoint}
class EndpointOrder extends _i1.EndpointRef {
  EndpointOrder(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'order';

  /// Get all orders for a building
  /// Parameters:
  /// - [buildingId]: The id of the building
  /// - [orderStatus]: The status of the orders to filter by (optional)
  /// Returns:
  /// - A list of orders for the building
  /// Only owner and employers are allowed for this endpoint
  _i2.Future<List<_i13.Order>> getOrdersByBuilingId(
    _i1.UuidValue buildingId,
    _i14.OrderStatus? orderStatus,
  ) => caller.callServerEndpoint<List<_i13.Order>>(
    'order',
    'getOrdersByBuilingId',
    {
      'buildingId': buildingId,
      'orderStatus': orderStatus,
    },
  );

  /// Get order by id
  /// Parameters:
  /// - [id]: The id of the order
  /// Returns:
  /// - The order with the given id
  _i2.Future<_i13.Order> getOrderById(_i1.UuidValue id) =>
      caller.callServerEndpoint<_i13.Order>(
        'order',
        'getOrderById',
        {'id': id},
      );

  /// Create a new order
  /// Parameters:
  /// - [order]: The order to be created
  /// Returns:
  /// - The created order
  /// Only employer allowed for this endpoint
  /// Employer should have access to order creation
  _i2.Future<_i13.Order> createOrder(_i13.Order order) =>
      caller.callServerEndpoint<_i13.Order>(
        'order',
        'createOrder',
        {'order': order},
      );

  _i2.Future<_i13.Order?> getOrderCurrOfTable(_i1.UuidValue tableId) =>
      caller.callServerEndpoint<_i13.Order?>(
        'order',
        'getOrderCurrOfTable',
        {'tableId': tableId},
      );

  _i2.Future<List<_i13.Order>> getOrdersOfTable(
    _i1.UuidValue tableId,
    _i14.OrderStatus? orderStatus,
  ) => caller.callServerEndpoint<List<_i13.Order>>(
    'order',
    'getOrdersOfTable',
    {
      'tableId': tableId,
      'orderStatus': orderStatus,
    },
  );
}

/// {@category Endpoint}
class EndpointOrderItem extends _i1.EndpointRef {
  EndpointOrderItem(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'orderItem';

  /// Append items to an existing order
  /// Parameters:
  /// - [orderId]: The id of the order to append items to
  /// - [orderItems]: The list of items to append to the order
  /// Returns:
  /// - The updated order with the appended items
  /// Employer should have access to append items
  _i2.Future<_i13.Order> appendItemsToOrder(
    _i1.UuidValue orderId,
    List<_i15.OrderItem> orderItems,
  ) => caller.callServerEndpoint<_i13.Order>(
    'orderItem',
    'appendItemsToOrder',
    {
      'orderId': orderId,
      'orderItems': orderItems,
    },
  );

  /// Change status of order items
  /// items status should have this workflow (progress -> picked -> ready -> delivered)
  /// Parameters:
  /// - [orderItemIds]: List of order item IDs to be updated
  /// - [newStatus]: The new status to be set for the order items
  /// Returns:
  /// - A list of updated OrderItem objects
  _i2.Future<List<_i15.OrderItem>> changeOrderItemsStatus(
    List<_i1.UuidValue> orderItemIds,
    _i16.OrderItemStatus newStatus,
    _i1.UuidValue buildingId,
  ) => caller.callServerEndpoint<List<_i15.OrderItem>>(
    'orderItem',
    'changeOrderItemsStatus',
    {
      'orderItemIds': orderItemIds,
      'newStatus': newStatus,
      'buildingId': buildingId,
    },
  );

  _i2.Future<List<_i15.OrderItem>> payOrderItem(
    _i1.UuidValue orderId,
    List<_i1.UuidValue> orderItemPayedIds,
    _i1.UuidValue buildingId,
  ) => caller.callServerEndpoint<List<_i15.OrderItem>>(
    'orderItem',
    'payOrderItem',
    {
      'orderId': orderId,
      'orderItemPayedIds': orderItemPayedIds,
      'buildingId': buildingId,
    },
  );

  _i2.Future<_i13.Order> payAllItems(
    _i1.UuidValue orderId,
    _i1.UuidValue buildingId,
  ) => caller.callServerEndpoint<_i13.Order>(
    'orderItem',
    'payAllItems',
    {
      'orderId': orderId,
      'buildingId': buildingId,
    },
  );
}

/// {@category Endpoint}
class EndpointStats extends _i1.EndpointRef {
  EndpointStats(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'stats';
}

class Modules {
  Modules(Client client) {
    serverpod_auth_idp = _i5.Caller(client);
    serverpod_auth_core = _i6.Caller(client);
  }

  late final _i5.Caller serverpod_auth_idp;

  late final _i6.Caller serverpod_auth_core;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    @Deprecated(
      'Use authKeyProvider instead. This will be removed in future releases.',
    )
    super.authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
         host,
         _i17.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    access = EndpointAccess(this);
    article = EndpointArticle(this);
    emailIdp = EndpointEmailIdp(this);
    jwtRefresh = EndpointJwtRefresh(this);
    building = EndpointBuilding(this);
    buildingTables = EndpointBuildingTables(this);
    caisse = EndpointCaisse(this);
    categorie = EndpointCategorie(this);
    employer = EndpointEmployer(this);
    order = EndpointOrder(this);
    orderItem = EndpointOrderItem(this);
    stats = EndpointStats(this);
    modules = Modules(this);
  }

  late final EndpointAccess access;

  late final EndpointArticle article;

  late final EndpointEmailIdp emailIdp;

  late final EndpointJwtRefresh jwtRefresh;

  late final EndpointBuilding building;

  late final EndpointBuildingTables buildingTables;

  late final EndpointCaisse caisse;

  late final EndpointCategorie categorie;

  late final EndpointEmployer employer;

  late final EndpointOrder order;

  late final EndpointOrderItem orderItem;

  late final EndpointStats stats;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
    'access': access,
    'article': article,
    'emailIdp': emailIdp,
    'jwtRefresh': jwtRefresh,
    'building': building,
    'buildingTables': buildingTables,
    'caisse': caisse,
    'categorie': categorie,
    'employer': employer,
    'order': order,
    'orderItem': orderItem,
    'stats': stats,
  };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_idp': modules.serverpod_auth_idp,
    'serverpod_auth_core': modules.serverpod_auth_core,
  };
}
