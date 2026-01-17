import 'package:pos_server/src/access/access_endpoint.dart';
import 'package:pos_server/src/generated/protocol.dart';
import 'package:pos_server/src/helpers/authorizations_helpers.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

class EmployerEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Create new employer account
  /// required [userProfileData] The user profile data
  /// required [password] The password for the account
  /// required [buildingId] buildingId The id of the building
  /// Returns the created [Employer] employer account
  /// allow for admin users only
  Future<Employer> createEmployerAccount(
    Session session,
    UserProfileData userProfileData,
    String password,
    int buildingId,
    int? accessId,
  ) async {
    await AuthorizationsHelpers().requiredScopes(session, ["owner"]);
    final emailIdp = AuthServices.instance.emailIdp;
    return session.db.transaction<Employer>((transaction) async {
      final authUser = await AuthServices.instance.authUsers.create(
        session,
        scopes: {Scope('employer')},
        transaction: transaction,
      );
      await emailIdp.admin.createEmailAuthentication(
        session,
        authUserId: authUser.id,
        email: userProfileData.email!,
        password: password,
        transaction: transaction,
      );
      final userProfile = await UserProfile.db.insertRow(
        session,
        transaction: transaction,
        UserProfile(
          authUserId: authUser.id,
          email: userProfileData.email!,
          fullName: userProfileData.fullName,
          createdAt: DateTime.now(),
        ),
      );
      return await Employer.db.insertRow(
        session,
        transaction: transaction,
        Employer(
          userProfileId: userProfile.id!,
          userProfile: userProfile,
          buildingId: buildingId,
          accessId: accessId,
        ),
      );
    });
  }

  /// Get employers by buildingId
  /// Identifier can be a[buildingId]
  /// Returns list of [Employer]
  /// This enpoint need login and allowed only for admin
  Future<List<Employer>> getEmployers(
    Session session,
    int buildingId,
  ) async {
    await AuthorizationsHelpers().requiredScopes(session, ["owner"]);
    return await Employer.db.find(
      session,
      include: Employer.include(
        userProfile: UserProfile.include(),
        access: Access.include(),
      ),
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
        access: Access.include(),
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

  Future<Employer> assignAccessToEmployer(
    Session session,
    int employerId,
    int accessId,
  ) async {
    final employer = await Employer.db.findById(session, employerId);
    if (employer == null) {
      throw AppException(
        errorType: ExceptionType.NotFound,
        message: 'Employer with id $employerId not found.',
      );
    }
    final access = await AccessEndpoint().getAccessById(session, accessId);
    employer.accessId = access.id;
    employer.access = access;
    return await Employer.db.updateRow(
      session,
      employer,
      columns: (t) => [t.accessId],
    );
  }
}
