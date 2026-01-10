import 'package:pos_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';

class EmployerEndpoint extends Endpoint {
  /// Get employers by buildingId
  /// Identifier can be a[buildingId]
  /// Returns list of [Employer]
  /// This enpoint need login and allowed only for admin
  Future<List<Employer>> getEmployers(
    Session session,
    int buildingId,
  ) async {
    return await Employer.db.find(
      session,
      include: Employer.include(userProfile: UserProfile.include()),
      where: (t) => t.buildingId.equals(buildingId),
    );
  }

  /// Get employer by identifier
  /// Identifier can be a[authId] or [UserProfileId]
  /// Returns [Employer] if found else throws exception
  /// This enpoint need login and allowed for all users
  Future<Employer> getEmployerByIdentifier(
    Session session,
    UuidValue identifier,
  ) async {
    final employer = await Employer.db.findFirstRow(
      session,
      include: Employer.include(
        userProfile: UserProfile.include(authUser: AuthUser.include()),
        building: Building.include(),
      ),
      where: (t) =>
          t.userProfile.authUserId.equals(identifier) |
          t.userProfileId.equals(identifier),
    );
    if (employer == null) {
      throw Exception('Employer with $identifier not found');
    }
    return employer;
  }
}
