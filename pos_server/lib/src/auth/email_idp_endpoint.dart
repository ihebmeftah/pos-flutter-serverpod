import 'package:pos_server/src/generated/protocol.dart';
import 'package:pos_server/src/helpers/endpoint_helpers.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
class EmailIdpEndpoint extends EmailIdpBaseEndpoint {
  /// Retrieves the user profile for the currently authenticated user.
  /// Includes auth user and profile image information.
  ///
  /// [session] Current user session.
  ///
  /// Returns the user profile with related data.
  Future<UserProfile> getUserProfile(Session session) async {
    if (session.authenticated == null) {
      throw AppException(
        errorType: ExceptionType.Unauthorized,
        message: 'User not authenticated',
      );
    }
    final userProfile = await UserProfile.db.findFirstRow(
      session,
      include: UserProfile.include(
        authUser: AuthUser.include(),
        image: UserProfileImage.include(),
      ),
      where: (t) => t.authUserId.equals(session.authenticated!.authUserId),
    );
    if (userProfile == null) {
      throw AppException(
        errorType: ExceptionType.NotFound,
        message:
            'User profile for auth user id ${session.authenticated!.authUserId} not found',
      );
    }
    return userProfile;
  }

  /// Authenticates a user and returns employer data if applicable.
  /// Returns employer for employer scope, null for owner scope.
  ///
  /// [session] Current user session.
  /// [email] User's email address.
  /// [password] User's password.
  ///
  /// Returns auth success with employer data if user is an employer.
  Future<
    ({
      Employer? employer,
      AuthSuccess authSuccess,
    })
  >
  loginReworked(
    Session session, {
    required String email,
    required String password,
  }) async {
    try {
      final authSuccess = await super.login(
        session,
        email: email,
        password: password,
      );
      if (authSuccess.scopeNames.contains(Scope("employer").name)) {
        final employer = await EndpointHelpers.getEmployerByAuthUserId(
          session,
          authSuccess.authUserId,
        );
        return (employer: employer, authSuccess: authSuccess);
      }
      return (employer: null, authSuccess: authSuccess);
    } on EmailAccountLoginException catch (e) {
      if (e.reason == EmailAccountLoginExceptionReason.invalidCredentials) {
        throw AppException(
          errorType: ExceptionType.Unauthorized,
          message: 'Invalid email or password',
        );
      }
      rethrow;
    }
  }

  /// Initiates user registration by sending a verification code.
  /// Validates email uniqueness before starting registration.
  ///
  /// [session] Current user session.
  /// [email] Email address to register.
  ///
  /// Returns the account request ID for verification.
  Future<UuidValue> registerReworked(
    Session session, {
    required String email,
  }) async {
    final existAccount = await EmailAccount.db.findFirstRow(
      session,
      where: (t) => t.email.equals(email),
    );
    if (existAccount != null) {
      throw AppException(
        errorType: ExceptionType.Conflict,
        message: 'Email already registered',
      );
    }
    return await super.startRegistration(session, email: email);
  }

  /// Completes registration by verifying code and assigning owner scope.
  /// Revokes initial tokens and issues new ones with correct scopes.
  ///
  /// [session] Current user session.
  /// [accountRequestId] ID from registration start.
  /// [verificationCode] Code sent to user's email.
  /// [password] Password for the new account.
  ///
  /// Returns auth success with owner scope.
  Future<AuthSuccess> verifyRegistrationCodeReworked(
    Session session, {
    required UuidValue accountRequestId,
    required String verificationCode,
    required String password,
  }) async {
    try {
      String token = await super.verifyRegistrationCode(
        session,
        accountRequestId: accountRequestId,
        verificationCode: verificationCode,
      );
      AuthSuccess authSucessReg = await super.finishRegistration(
        session,
        registrationToken: token,
        password: password,
      );
      await AuthServices.instance.authUsers.update(
        session,
        authUserId: authSucessReg.authUserId,
        scopes: {Scope("owner")},
      );

      // Remove created token created in finishRegistration
      // and create a new one with the correct scopes
      await AuthServices.instance.tokenManager.revokeAllTokens(
        session,
        authUserId: authSucessReg.authUserId,
      );
      final authSucess = await AuthServices.instance.tokenManager.issueToken(
        session,
        method: "email",
        authUserId: authSucessReg.authUserId,
      );
      return authSucess;
    } catch (e) {
      rethrow;
    }
  }
}
