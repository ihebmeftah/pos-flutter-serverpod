import 'package:pos_server/src/employer/employer_endpoint.dart';
import 'package:pos_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
class EmailIdpEndpoint extends EmailIdpBaseEndpoint {
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
      throw Exception(
        'User profile for auth user id ${session.authenticated!.authUserId} not found',
      );
    }
    return userProfile;
  }

  /// A reworked login method that returns an Employer on successful login.
  /// If the logged-in user is an admin, it returns null.
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
        final employer = await EmployerEndpoint().getEmployerByIdentifier(
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

      /// Remove created token created in finishRegistration
      /// and create a new one with the correct scopes
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
