import 'package:pos_server/src/buildings/building_endpoint.dart';
import 'package:pos_server/src/generated/protocol.dart';
import 'package:pos_server/src/helpers/authorizations_helpers.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

class UsersEndpoint extends Endpoint {
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
  ) async {
    await AuthorizationsHelpers().requiredScopes(session, ["admin"]);
    final building = await BuildingEndpoint().getBuildingById(
      session,
      buildingId,
    );
    final emailIdp = AuthServices.instance.emailIdp;
    final authUser = await AuthServices.instance.authUsers.create(
      session,
      scopes: {Scope('employer')},
    );
    await emailIdp.admin.createEmailAuthentication(
      session,
      authUserId: authUser.id,
      email: userProfileData.email!,
      password: password,
    );
    final userProfile = await UserProfile.db.insertRow(
      session,
      UserProfile(
        authUserId: authUser.id,
        email: userProfileData.email!,
        fullName: userProfileData.fullName,
        createdAt: DateTime.now(),
      ),
    );
    return await Employer.db.insertRow(
      session,
      Employer(
        userProfileId: userProfile.id!,
        userProfile: userProfile,
        buildingId: buildingId,
        building: building,
      ),
    );
  }
}
