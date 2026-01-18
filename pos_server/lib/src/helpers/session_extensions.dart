import 'package:pos_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

extension SessionExtensions on Session {
  Set<Scope> get currScope => authenticated!.scopes;

  bool get isOwner {
    return currScope.any((scope) => scope.name == 'owner');
  }

  bool get isCustomer {
    return currScope.any((scope) => scope.name == 'customer');
  }

  bool get isAdmin {
    return currScope.any((scope) => scope.name == 'admin');
  }

  bool get isEmployer {
    return currScope.any((scope) => scope.name == 'employer');
  }

  Set<Scope> authorizedTo(List<String> scopes) {
    if (currScope.any(
          (scope) => scopes.contains(scope.name),
        ) ==
        false) {
      throw AppException(
        errorType: ExceptionType.Forbidden,
        message:
            '${currScope.map((e) => e.name).join(', ')} not authorized to perform this action.',
      );
    }
    return currScope;
  }

  void currUserRessource() {}
}
