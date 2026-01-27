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
import 'package:pos_client/src/protocol/article/entity/article.dart' as _i4;
import 'package:pos_client/src/protocol/article/dto/create_article.dto.dart'
    as _i5;
import 'package:pos_client/src/protocol/article/dto/update_article.dto.dart'
    as _i6;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i7;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i8;
import 'package:pos_client/src/protocol/employer/employer.dart' as _i9;
import 'package:pos_client/src/protocol/buildings/building.dart' as _i10;
import 'package:pos_client/src/protocol/buildings_tables/building_tables.dart'
    as _i11;
import 'package:pos_client/src/protocol/cash_register/cash_register.dart'
    as _i12;
import 'package:pos_client/src/protocol/cateogrie/entity/categorie.dart'
    as _i13;
import 'package:pos_client/src/protocol/cateogrie/dto/update_categorie.dto.dart'
    as _i14;
import 'package:pos_client/src/protocol/cateogrie/dto/create_categorie.dto.dart'
    as _i15;
import 'package:pos_client/src/protocol/employer/create_employer.dto.dart'
    as _i16;
import 'package:pos_client/src/protocol/ingredient/ingredient.dart' as _i17;
import 'package:pos_client/src/protocol/order/entity/order.dart' as _i18;
import 'package:pos_client/src/protocol/order/order_status_enum.dart' as _i19;
import 'package:pos_client/src/protocol/order/dto/create_order.dto.dart'
    as _i20;
import 'package:pos_client/src/protocol/order/dto/append_items.dto.dart'
    as _i21;
import 'package:pos_client/src/protocol/order/entity/order_item.dart' as _i22;
import 'package:pos_client/src/protocol/order/order_item_status_enum.dart'
    as _i23;
import 'package:pos_client/src/protocol/stats/stats.dart' as _i24;
import 'protocol.dart' as _i25;

/// {@category Endpoint}
class EndpointAccess extends _i1.EndpointRef {
  EndpointAccess(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'access';

  /// Creates a new access role for a building.
  /// Validates name uniqueness within the building. Owner only.
  ///
  /// [session] Current user session.
  /// [access] Access configuration to create.
  ///
  /// Returns the newly created access role.
  _i2.Future<_i3.Access> createAccess(_i3.Access access) =>
      caller.callServerEndpoint<_i3.Access>(
        'access',
        'createAccess',
        {'access': access},
      );

  /// Updates an existing access role's permissions.
  /// Validates name uniqueness if name changed. Owner only.
  ///
  /// [session] Current user session.
  /// [access] Updated access configuration.
  ///
  /// Returns the updated access role.
  _i2.Future<_i3.Access> updateAccess(_i3.Access access) =>
      caller.callServerEndpoint<_i3.Access>(
        'access',
        'updateAccess',
        {'access': access},
      );

  /// Retrieves all access roles configured for a building.
  ///
  /// [session] Current user session.
  /// [buildingId] ID of the building.
  ///
  /// Returns a list of access roles for the building.
  _i2.Future<List<_i3.Access>> getAccessesByBuildingId(
    _i1.UuidValue buildingId,
  ) => caller.callServerEndpoint<List<_i3.Access>>(
    'access',
    'getAccessesByBuildingId',
    {'buildingId': buildingId},
  );

  /// Fetches a specific access role by ID.
  ///
  /// [session] Current user session.
  /// [accessId] ID of the access role to fetch.
  ///
  /// Returns the access role if found.
  _i2.Future<_i3.Access> getAccessById(_i1.UuidValue accessId) =>
      caller.callServerEndpoint<_i3.Access>(
        'access',
        'getAccessById',
        {'accessId': accessId},
      );

  /// Deletes an access role from a building.
  ///
  /// [session] Current user session.
  /// [accessId] ID of the access role to delete.
  ///
  /// Returns the deleted access role.
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

  /// Retrieves all articles for a specific building, optionally filtered by category.
  ///
  /// [session] Current user session.
  /// [buildingId] ID of the building to fetch articles from.
  /// [categoryId] Optional category ID to filter articles.
  ///
  /// Returns a list of articles with category information included.
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

  /// Creates a new article with validated ingredients and category.
  /// Requires owner authorization and verifies building ownership.
  ///
  /// [session] Current user session.
  /// [articleDto] Article data including name, price, category, and composition.
  ///
  /// Returns the newly created article with compositions attached.
  _i2.Future<_i4.Article> createArticle(_i5.CreateArticleDto articleDto) =>
      caller.callServerEndpoint<_i4.Article>(
        'article',
        'createArticle',
        {'articleDto': articleDto},
      );

  /// Retrieves a single article by ID with full details.
  /// Includes category and ingredient composition information.
  ///
  /// [session] Current user session.
  /// [id] Article ID to fetch.
  /// [buildingId] Building ID for access validation.
  ///
  /// Returns the article with all related data included.
  _i2.Future<_i4.Article> getArticleById(
    _i1.UuidValue id,
    _i1.UuidValue buildingId,
  ) => caller.callServerEndpoint<_i4.Article>(
    'article',
    'getArticleById',
    {
      'id': id,
      'buildingId': buildingId,
    },
  );

  /// Updates an existing article's information.
  /// Validates name uniqueness if changed. Requires owner authorization.
  ///
  /// [session] Current user session.
  /// [id] Article ID to update.
  /// [buildingId] Building ID for access validation.
  /// [articleDto] Updated article data.
  ///
  /// Returns the updated article.
  _i2.Future<_i4.Article> updateArticle(
    _i1.UuidValue id,
    _i1.UuidValue buildingId,
    _i6.UpdateArticleDto articleDto,
  ) => caller.callServerEndpoint<_i4.Article>(
    'article',
    'updateArticle',
    {
      'id': id,
      'buildingId': buildingId,
      'articleDto': articleDto,
    },
  );
}

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
/// {@category Endpoint}
class EndpointEmailIdp extends _i7.EndpointEmailIdpBase {
  EndpointEmailIdp(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'emailIdp';

  /// Retrieves the user profile for the currently authenticated user.
  /// Includes auth user and profile image information.
  ///
  /// [session] Current user session.
  ///
  /// Returns the user profile with related data.
  _i2.Future<_i8.UserProfile> getUserProfile() =>
      caller.callServerEndpoint<_i8.UserProfile>(
        'emailIdp',
        'getUserProfile',
        {},
      );

  /// Authenticates a user and returns employer data if applicable.
  /// Returns employer for employer scope, null for owner scope.
  ///
  /// [session] Current user session.
  /// [email] User's email address.
  /// [password] User's password.
  ///
  /// Returns auth success with employer data if user is an employer.
  _i2.Future<({_i8.AuthSuccess authSuccess, _i9.Employer? employer})>
  loginReworked({
    required String email,
    required String password,
  }) =>
      caller.callServerEndpoint<
        ({_i8.AuthSuccess authSuccess, _i9.Employer? employer})
      >(
        'emailIdp',
        'loginReworked',
        {
          'email': email,
          'password': password,
        },
      );

  /// Initiates user registration by sending a verification code.
  /// Validates email uniqueness before starting registration.
  ///
  /// [session] Current user session.
  /// [email] Email address to register.
  ///
  /// Returns the account request ID for verification.
  _i2.Future<_i1.UuidValue> registerReworked({required String email}) =>
      caller.callServerEndpoint<_i1.UuidValue>(
        'emailIdp',
        'registerReworked',
        {'email': email},
      );

  /// Completes registration by verifying code and assigning owner scope.
  /// Revokes initial tokens and issues new ones with correct scopes.
  ///
  /// [session] Current user session.
  /// [accountRequestId] ID from registration start.
  /// [verificationCode] Code sent to user's email.
  /// [password] Password for the new account.
  ///
  /// Returns auth success with owner scope.
  _i2.Future<_i8.AuthSuccess> verifyRegistrationCodeReworked({
    required _i1.UuidValue accountRequestId,
    required String verificationCode,
    required String password,
  }) => caller.callServerEndpoint<_i8.AuthSuccess>(
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
  _i2.Future<_i8.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_i8.AuthSuccess>(
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
  _i2.Future<_i8.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<_i8.AuthSuccess>(
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
class EndpointJwtRefresh extends _i8.EndpointRefreshJwtTokens {
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
  _i2.Future<_i8.AuthSuccess> refreshAccessToken({
    required String refreshToken,
  }) => caller.callServerEndpoint<_i8.AuthSuccess>(
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

  /// Retrieves all buildings owned by the authenticated owner.
  ///
  /// [session] Current user session.
  ///
  /// Returns a list of buildings owned by the user.
  _i2.Future<List<_i10.Building>> getBuildingsOfOwner() =>
      caller.callServerEndpoint<List<_i10.Building>>(
        'building',
        'getBuildingsOfOwner',
        {},
      );

  /// Fetches all buildings available in the system.
  /// Used by customers to browse available locations.
  ///
  /// [session] Current user session.
  ///
  /// Returns a list of all buildings.
  _i2.Future<List<_i10.Building>> getBuildings() =>
      caller.callServerEndpoint<List<_i10.Building>>(
        'building',
        'getBuildings',
        {},
      );

  /// Creates a new building with default access roles (waiter, cashier, barista).
  /// Owner only.
  ///
  /// [session] Current user session.
  /// [building] Building data to create.
  ///
  /// Returns the newly created building.
  _i2.Future<_i10.Building> createBuilding(_i10.Building building) =>
      caller.callServerEndpoint<_i10.Building>(
        'building',
        'createBuilding',
        {'building': building},
      );

  /// Retrieves a building by its ID.
  ///
  /// [session] Current user session.
  /// [buildingId] ID of the building to fetch.
  ///
  /// Returns the building if found.
  _i2.Future<_i10.Building> getBuildingById(_i1.UuidValue buildingId) =>
      caller.callServerEndpoint<_i10.Building>(
        'building',
        'getBuildingById',
        {'buildingId': buildingId},
      );

  /// Updates a building's information and broadcasts changes.
  /// Validates ownership before updating. Owner only.
  ///
  /// [session] Current user session.
  /// [building] Updated building data.
  ///
  /// Returns the updated building.
  _i2.Future<_i10.Building> updateBuilding(_i10.Building building) =>
      caller.callServerEndpoint<_i10.Building>(
        'building',
        'updateBuilding',
        {'building': building},
      );

  /// Streams real-time updates for a building's changes.
  ///
  /// [session] Current user session.
  /// [buildingId] ID of the building to watch.
  ///
  /// Returns a stream of building update events.
  _i2.Stream<_i10.Building> watchUpdateBuildings(
    _i1.UuidValue buildingId,
  ) => caller
      .callStreamingServerEndpoint<_i2.Stream<_i10.Building>, _i10.Building>(
        'building',
        'watchUpdateBuildings',
        {'buildingId': buildingId},
        {},
      );
}

/// Building Tables Endpoint
/// All Endpoint required login
/// {@category Endpoint}
class EndpointBuildingTables extends _i1.EndpointRef {
  EndpointBuildingTables(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'buildingTables';

  /// Fetches all tables for a building with current occupation status.
  /// Checks for active orders to determine availability.
  ///
  /// [session] Current user session.
  /// [buildingId] ID of the building to fetch tables from.
  ///
  /// Returns a list of tables with status (available/occupied).
  _i2.Future<List<_i11.BTable>> getTablesByBuildingId(
    _i1.UuidValue buildingId,
  ) => caller.callServerEndpoint<List<_i11.BTable>>(
    'buildingTables',
    'getTablesByBuildingId',
    {'buildingId': buildingId},
  );

  /// Creates multiple tables for a building with sequential numbering.
  /// Continues numbering from existing table count. Owner only.
  ///
  /// [session] Current user session.
  /// [nbtables] Number of tables to create.
  /// [seatsMax] Maximum seats per table.
  /// [buildingId] ID of the building.
  ///
  /// Returns a list of newly created tables.
  _i2.Future<List<_i11.BTable>> createTables({
    required int nbtables,
    required int seatsMax,
    required _i1.UuidValue buildingId,
  }) => caller.callServerEndpoint<List<_i11.BTable>>(
    'buildingTables',
    'createTables',
    {
      'nbtables': nbtables,
      'seatsMax': seatsMax,
      'buildingId': buildingId,
    },
  );

  _i2.Future<_i11.BTable> getTableById(
    _i1.UuidValue tableId,
    _i1.UuidValue buildingId,
  ) => caller.callServerEndpoint<_i11.BTable>(
    'buildingTables',
    'getTableById',
    {
      'tableId': tableId,
      'buildingId': buildingId,
    },
  );

  _i2.Future<_i11.BTable> mangeTableActivation(
    _i1.UuidValue tableId,
    _i1.UuidValue buildingId,
  ) => caller.callServerEndpoint<_i11.BTable>(
    'buildingTables',
    'mangeTableActivation',
    {
      'tableId': tableId,
      'buildingId': buildingId,
    },
  );
}

/// {@category Endpoint}
class EndpointCashRegister extends _i1.EndpointRef {
  EndpointCashRegister(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'cashRegister';

  /// Retrieves all cash registers for a building, ordered by start time.
  /// Requires cash register management permission for employers.
  ///
  /// [session] Current user session.
  /// [buildingId] ID of the building to fetch registers from.
  ///
  /// Returns a list of cash registers sorted by start time (descending).
  _i2.Future<List<_i12.CashRegister>> getCashRegisters(
    _i1.UuidValue buildingId,
  ) => caller.callServerEndpoint<List<_i12.CashRegister>>(
    'cashRegister',
    'getCashRegisters',
    {'buildingId': buildingId},
  );

  /// Creates a new cash register session for the day.
  /// Validates daily limit and ensures no other register is open. Employer only.
  ///
  /// [session] Current user session.
  /// [buildingId] ID of the building.
  /// [startAmount] Optional starting cash amount.
  ///
  /// Returns the newly created cash register.
  _i2.Future<_i12.CashRegister> createCashRegister(
    _i1.UuidValue buildingId,
    double? startAmount,
  ) => caller.callServerEndpoint<_i12.CashRegister>(
    'cashRegister',
    'createCashRegister',
    {
      'buildingId': buildingId,
      'startAmount': startAmount,
    },
  );

  /// Closes the currently open cash register.
  /// Validates all orders are paid before closing. Employer only.
  ///
  /// [session] Current user session.
  /// [buildingId] ID of the building.
  /// [endAmount] Optional ending cash amount.
  ///
  /// Returns the closed cash register with end time.
  _i2.Future<_i12.CashRegister> closeLastCashRegister(
    _i1.UuidValue buildingId,
    double? endAmount,
  ) => caller.callServerEndpoint<_i12.CashRegister>(
    'cashRegister',
    'closeLastCashRegister',
    {
      'buildingId': buildingId,
      'endAmount': endAmount,
    },
  );
}

/// {@category Endpoint}
class EndpointCategorie extends _i1.EndpointRef {
  EndpointCategorie(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'categorie';

  /// Fetches all categories belonging to a specific building.
  ///
  /// [session] Current user session.
  /// [buildingId] ID of the building to fetch categories from.
  ///
  /// Returns a list of all categories for the building.
  _i2.Future<List<_i13.Categorie>> getCategories(_i1.UuidValue buildingId) =>
      caller.callServerEndpoint<List<_i13.Categorie>>(
        'categorie',
        'getCategories',
        {'buildingId': buildingId},
      );

  /// Retrieves a specific category by ID.
  /// Validates that category belongs to the specified building.
  ///
  /// [session] Current user session.
  /// [id] Category ID to fetch.
  /// [buildingId] Building ID for access validation.
  ///
  /// Returns the category if found and belongs to building.
  _i2.Future<_i13.Categorie> getCategorieById(
    _i1.UuidValue id,
    _i1.UuidValue buildingId,
  ) => caller.callServerEndpoint<_i13.Categorie>(
    'categorie',
    'getCategorieById',
    {
      'id': id,
      'buildingId': buildingId,
    },
  );

  /// Creates a new category for a building.
  /// Validates name uniqueness and building ownership. Owner only.
  ///
  /// [session] Current user session.
  /// [categorieDto] Category data including name and description.
  ///
  /// Returns the newly created category.
  _i2.Future<_i13.Categorie> createCategorie(
    _i14.CreateCategorieDto categorieDto,
  ) => caller.callServerEndpoint<_i13.Categorie>(
    'categorie',
    'createCategorie',
    {'categorieDto': categorieDto},
  );

  /// Updates an existing category's information.
  /// Validates name uniqueness if changed. Owner only.
  ///
  /// [session] Current user session.
  /// [id] Category ID to update.
  /// [buildingId] Building ID for access validation.
  /// [categorieDto] Updated category data.
  ///
  /// Returns the updated category.
  _i2.Future<_i13.Categorie> updateCategorie(
    _i1.UuidValue id,
    _i1.UuidValue buildingId,
    _i15.UpdateCategorieDto categorieDto,
  ) => caller.callServerEndpoint<_i13.Categorie>(
    'categorie',
    'updateCategorie',
    {
      'id': id,
      'buildingId': buildingId,
      'categorieDto': categorieDto,
    },
  );
}

/// {@category Endpoint}
class EndpointEmployer extends _i1.EndpointRef {
  EndpointEmployer(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'employer';

  /// Creates a new employer account with authentication credentials.
  /// Validates email/phone uniqueness and requires building ownership. Owner only.
  ///
  /// [session] Current user session.
  /// [createEmployerDto] Employer data including credentials and building assignment.
  ///
  /// Returns the newly created employer account with profile.
  _i2.Future<_i9.Employer> createEmployerAccount(
    _i16.CreateEmployerDTO createEmployerDto,
  ) => caller.callServerEndpoint<_i9.Employer>(
    'employer',
    'createEmployerAccount',
    {'createEmployerDto': createEmployerDto},
  );

  /// Retrieves all employers for a specific building.
  /// Includes user profiles and access permissions. Owner only.
  ///
  /// [session] Current user session.
  /// [buildingId] ID of the building to fetch employers from.
  ///
  /// Returns a list of employers with profiles and access data.
  _i2.Future<List<_i9.Employer>> getEmployers(_i1.UuidValue buildingId) =>
      caller.callServerEndpoint<List<_i9.Employer>>(
        'employer',
        'getEmployers',
        {'buildingId': buildingId},
      );

  /// Fetches an employer by authUserId, userProfileId, or employerId.
  /// Includes full profile, building, and access information.
  ///
  /// [session] Current user session.
  /// [identifier] Auth ID, profile ID, or employer ID.
  ///
  /// Returns the employer with all related data.
  _i2.Future<_i9.Employer> getEmployerByIdentifier(_i1.UuidValue identifier) =>
      caller.callServerEndpoint<_i9.Employer>(
        'employer',
        'getEmployerByIdentifier',
        {'identifier': identifier},
      );

  /// Assigns or updates access permissions for an employer.
  ///
  /// [session] Current user session.
  /// [employerId] ID of the employer to update.
  /// [accessId] ID of the access configuration to assign.
  ///
  /// Returns the updated employer with new access settings.
  _i2.Future<_i9.Employer> assignAccessToEmployer(
    _i1.UuidValue employerId,
    _i1.UuidValue accessId,
  ) => caller.callServerEndpoint<_i9.Employer>(
    'employer',
    'assignAccessToEmployer',
    {
      'employerId': employerId,
      'accessId': accessId,
    },
  );

  /// Blocks or unblocks an employer account and revokes all tokens.
  ///
  /// [session] Current user session.
  /// [identifier] Auth ID, profile ID, or employer ID.
  /// [isBlocked] True to block, false to unblock.
  ///
  /// Returns success status.
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
class EndpointIngredient extends _i1.EndpointRef {
  EndpointIngredient(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'ingredient';

  /// Fetches all ingredients for a specific building.
  ///
  /// [session] Current user session.
  /// [buildingId] ID of the building to fetch ingredients from.
  ///
  /// Returns a list of all ingredients in the building.
  _i2.Future<List<_i17.Ingredient>> getIngredientsByBuildingId(
    _i1.UuidValue buildingId,
  ) => caller.callServerEndpoint<List<_i17.Ingredient>>(
    'ingredient',
    'getIngredientsByBuildingId',
    {'buildingId': buildingId},
  );

  /// Creates a new ingredient for a building.
  /// Validates stock levels and name uniqueness. Owner only.
  ///
  /// [session] Current user session.
  /// [ingredient] Ingredient data including stock levels.
  ///
  /// Returns the newly created ingredient.
  _i2.Future<_i17.Ingredient> createIngredient(_i17.Ingredient ingredient) =>
      caller.callServerEndpoint<_i17.Ingredient>(
        'ingredient',
        'createIngredient',
        {'ingredient': ingredient},
      );

  /// Retrieves a specific ingredient by ID.
  /// Validates that ingredient belongs to the specified building.
  ///
  /// [session] Current user session.
  /// [id] Ingredient ID to fetch.
  /// [buildingId] Building ID for access validation.
  ///
  /// Returns the ingredient if found and belongs to building.
  _i2.Future<_i17.Ingredient> getIngredintById(
    _i1.UuidValue id,
    _i1.UuidValue buildingId,
  ) => caller.callServerEndpoint<_i17.Ingredient>(
    'ingredient',
    'getIngredintById',
    {
      'id': id,
      'buildingId': buildingId,
    },
  );
}

/// {@category Endpoint}
class EndpointOrder extends _i1.EndpointRef {
  EndpointOrder(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'order';

  /// Fetches all orders for a building with optional filters.
  /// Employers see only their orders unless they have consultAllOrders permission.
  ///
  /// [session] Current user session.
  /// [buildingId] ID of the building to fetch orders from.
  /// [orderStatus] Optional status filter (payed, inprogress, etc.).
  /// [cashRegisterId] Optional cash register filter.
  ///
  /// Returns a list of orders with items and related data.
  _i2.Future<List<_i18.Order>> getOrdersByBuilingId(
    _i1.UuidValue buildingId, [
    _i19.OrderStatus? orderStatus,
    _i1.UuidValue? cashRegisterId,
  ]) => caller.callServerEndpoint<List<_i18.Order>>(
    'order',
    'getOrdersByBuilingId',
    {
      'buildingId': buildingId,
      'orderStatus': orderStatus,
      'cashRegisterId': cashRegisterId,
    },
  );

  /// Retrieves a single order with all details.
  /// Includes items, table info, and user profiles for who created/closed it.
  ///
  /// [session] Current user session.
  /// [id] Order ID to fetch.
  ///
  /// Returns the order with all related data.
  _i2.Future<_i18.Order> getOrderById(_i1.UuidValue id) =>
      caller.callServerEndpoint<_i18.Order>(
        'order',
        'getOrderById',
        {'id': id},
      );

  /// Creates a new order with articles for a table.
  /// Validates table availability, employer permissions, and article existence. Employer only.
  ///
  /// [session] Current user session.
  /// [orderDto] Order data including table, building, and article IDs.
  ///
  /// Returns the newly created order with items.
  _i2.Future<_i18.Order> createOrder(_i20.CreateOrderDto orderDto) =>
      caller.callServerEndpoint<_i18.Order>(
        'order',
        'createOrder',
        {'orderDto': orderDto},
      );

  /// Retrieves the current in-progress order for a specific table.
  ///
  /// [session] Current user session.
  /// [tableId] ID of the table to check.
  ///
  /// Returns the current order for the table or null if table has no active order.
  _i2.Future<_i18.Order?> getOrderCurrOfTable(_i1.UuidValue tableId) =>
      caller.callServerEndpoint<_i18.Order?>(
        'order',
        'getOrderCurrOfTable',
        {'tableId': tableId},
      );

  /// Fetches all orders (past and present) for a specific table.
  ///
  /// [session] Current user session.
  /// [tableId] ID of the table.
  /// [orderStatus] Optional status filter.
  ///
  /// Returns a list of orders for the table.
  _i2.Future<List<_i18.Order>> getOrdersOfTable(
    _i1.UuidValue tableId,
    _i19.OrderStatus? orderStatus,
  ) => caller.callServerEndpoint<List<_i18.Order>>(
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

  /// Appends new items to an existing unpaid order.
  /// Validates building configuration, employer permissions, and article existence.
  ///
  /// [session] Current user session.
  /// [appendItemDto] Order ID, building ID, and new item IDs to append.
  ///
  /// Returns the updated order with all items.
  _i2.Future<_i18.Order> appendItemsToOrder(
    _i21.AppendItemsDto appendItemDto,
  ) => caller.callServerEndpoint<_i18.Order>(
    'orderItem',
    'appendItemsToOrder',
    {'appendItemDto': appendItemDto},
  );

  /// Changes status of order items following workflow: progress → picked → ready → served.
  /// Enforces strict mode workflow if enabled. Requires appropriate access.
  ///
  /// [session] Current user session.
  /// [orderItemIds] List of item IDs to update.
  /// [newStatus] New status to set (picked, ready, served).
  /// [buildingId] Building ID for validation.
  ///
  /// Returns a list of updated order items.
  _i2.Future<List<_i22.OrderItem>> changeOrderItemsStatus(
    List<_i1.UuidValue> orderItemIds,
    _i23.OrderItemStatus newStatus,
    _i1.UuidValue buildingId,
  ) => caller.callServerEndpoint<List<_i22.OrderItem>>(
    'orderItem',
    'changeOrderItemsStatus',
    {
      'orderItemIds': orderItemIds,
      'newStatus': newStatus,
      'buildingId': buildingId,
    },
  );

  /// Marks specific order items as paid.
  /// In strict mode, items must be served before payment.
  ///
  /// [session] Current user session.
  /// [orderId] Order containing the items.
  /// [orderItemPayedIds] List of item IDs to mark as paid.
  /// [buildingId] Building ID for validation.
  ///
  /// Returns a list of paid order items.
  _i2.Future<List<_i22.OrderItem>> payOrderItem(
    _i1.UuidValue orderId,
    List<_i1.UuidValue> orderItemPayedIds,
    _i1.UuidValue buildingId,
  ) => caller.callServerEndpoint<List<_i22.OrderItem>>(
    'orderItem',
    'payOrderItem',
    {
      'orderId': orderId,
      'orderItemPayedIds': orderItemPayedIds,
      'buildingId': buildingId,
    },
  );

  /// Pays all items in an order at once and marks order as complete.
  /// In strict mode, all items must be served before payment.
  ///
  /// [session] Current user session.
  /// [orderId] ID of the order to pay.
  /// [buildingId] Building ID for validation.
  ///
  /// Returns the completed and paid order.
  _i2.Future<_i18.Order> payAllItems(
    _i1.UuidValue orderId,
    _i1.UuidValue buildingId,
  ) => caller.callServerEndpoint<_i18.Order>(
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

  /// Compute stats from paid orders
  _i2.Future<_i24.Stats> getStats(_i1.UuidValue buildingId) =>
      caller.callServerEndpoint<_i24.Stats>(
        'stats',
        'getStats',
        {'buildingId': buildingId},
      );
}

class Modules {
  Modules(Client client) {
    serverpod_auth_idp = _i7.Caller(client);
    serverpod_auth_core = _i8.Caller(client);
  }

  late final _i7.Caller serverpod_auth_idp;

  late final _i8.Caller serverpod_auth_core;
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
         _i25.Protocol(),
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
    cashRegister = EndpointCashRegister(this);
    categorie = EndpointCategorie(this);
    employer = EndpointEmployer(this);
    ingredient = EndpointIngredient(this);
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

  late final EndpointCashRegister cashRegister;

  late final EndpointCategorie categorie;

  late final EndpointEmployer employer;

  late final EndpointIngredient ingredient;

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
    'cashRegister': cashRegister,
    'categorie': categorie,
    'employer': employer,
    'ingredient': ingredient,
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
