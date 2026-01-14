import 'package:pos_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

/// this class contains helper methods for authorizations
/// it is used to check if the user is logged in and has the required scopes
/// DON'T USE THIS HELEPRS WITH @doNotGenerate METHODES
class AuthorizationsHelpers {
  Future<void> loggedIn(Session session) async {
    session.log("loggedIn methode called");
    if (session.isUserSignedIn) {
      throw AppException(
        errorType: ExceptionType.Unauthorized,
        message: 'User must be logged in to perform this action.',
      );
    }
  }

  Future<Set<Scope>> requiredScopes(
    Session session,
    List<String> scopes,
  ) async {
    final currScope = session.authenticated!.scopes;
    if (currScope.any(
          (scope) => scopes.contains(scope.name),
        ) ==
        false) {
      throw AppException(
        errorType: ExceptionType.Forbidden,
        message:
            '${scopes.map((e) => e).join(', ')} not authorized to perform this action.',
      );
    }
    return currScope;
  }
}
