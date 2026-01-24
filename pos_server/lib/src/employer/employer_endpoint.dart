import 'package:pos_server/src/access/access_endpoint.dart';
import 'package:pos_server/src/generated/protocol.dart';
import '../helpers/session_extensions.dart';
import '../helpers/endpoint_helpers.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

class EmployerEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Creates a new employer account with authentication credentials.
  /// Validates email/phone uniqueness and requires building ownership. Owner only.
  ///
  /// [session] Current user session.
  /// [createEmployerDto] Employer data including credentials and building assignment.
  ///
  /// Returns the newly created employer account with profile.
  Future<Employer> createEmployerAccount(
    Session session,
    CreateEmployerDTO createEmployerDto,
  ) async {
    session.authorizedTo(['owner']);
    final emailIdp = AuthServices.instance.emailIdp;
    return session.db.transaction<Employer>((transaction) async {
      final building = await EndpointHelpers.verifyBuildingAccess(
        session,
        createEmployerDto.buildingId,
        checkOwnership: true,
      );
      await _checkExistPersoEmail(session, createEmployerDto.persoEmail);
      await _checkExistPhone(session, createEmployerDto.phone);
      final authUser = await AuthServices.instance.authUsers.create(
        session,
        scopes: {Scope('employer')},
        transaction: transaction,
      );
      final userName = createEmployerDto.persoEmail.split('@').first;
      final email =
          "$userName@${building.name.replaceAll(RegExp(r'\s+'), '-').toLowerCase().trim()}.com";
      await emailIdp.admin.createEmailAuthentication(
        session,
        authUserId: authUser.id,
        email: email,
        password: createEmployerDto.password,
        transaction: transaction,
      );
      final userProfile = await UserProfile.db.insertRow(
        session,
        transaction: transaction,
        UserProfile(
          userName: userName,
          authUserId: authUser.id,
          email: email,
          fullName: createEmployerDto.displayName,
          createdAt: DateTime.now(),
        ),
      );
      return await Employer.db.insertRow(
        session,
        transaction: transaction,
        Employer(
          firstName: createEmployerDto.firstName,
          lastName: createEmployerDto.lastName,
          phone: createEmployerDto.phone,
          persoEmail: createEmployerDto.persoEmail,
          userProfileId: userProfile.id!,
          userProfile: userProfile,
          buildingId: createEmployerDto.buildingId,
          accessId: createEmployerDto.accessId,
        ),
      );
    });
  }

  @doNotGenerate
  Future<void> _checkExistPersoEmail(Session session, String persoEmail) async {
    final existpersoEmail = await Employer.db.findFirstRow(
      session,
      where: (t) => t.persoEmail.equals(persoEmail),
    );
    if (existpersoEmail != null) {
      throw AppException(
        errorType: ExceptionType.Conflict,
        message: 'Employer with personal email $persoEmail already exists',
      );
    }
  }

  @doNotGenerate
  Future<void> _checkExistPhone(Session session, int phone) async {
    final existPhone = await Employer.db.findFirstRow(
      session,
      where: (t) => t.phone.equals(phone),
    );
    if (existPhone != null) {
      throw AppException(
        errorType: ExceptionType.Conflict,
        message: 'Employer with personal phone $phone already exists',
      );
    }
  }

  /// Retrieves all employers for a specific building.
  /// Includes user profiles and access permissions. Owner only.
  ///
  /// [session] Current user session.
  /// [buildingId] ID of the building to fetch employers from.
  ///
  /// Returns a list of employers with profiles and access data.
  Future<List<Employer>> getEmployers(
    Session session,
    UuidValue buildingId,
  ) async {
    session.authorizedTo(['owner']);
    return await Employer.db.find(
      session,
      include: Employer.include(
        userProfile: UserProfile.include(),
        access: Access.include(),
      ),
      where: (t) => t.buildingId.equals(buildingId),
    );
  }

  /// Fetches an employer by authUserId, userProfileId, or employerId.
  /// Includes full profile, building, and access information.
  ///
  /// [session] Current user session.
  /// [identifier] Auth ID, profile ID, or employer ID.
  ///
  /// Returns the employer with all related data.
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
          t.userProfileId.equals(identifier) |
          t.id.equals(identifier),
    );
    if (employer == null) {
      throw AppException(
        errorType: ExceptionType.NotFound,
        message: 'Employer with $identifier not found',
      );
    }
    return employer;
  }

  /// Assigns or updates access permissions for an employer.
  ///
  /// [session] Current user session.
  /// [employerId] ID of the employer to update.
  /// [accessId] ID of the access configuration to assign.
  ///
  /// Returns the updated employer with new access settings.
  Future<Employer> assignAccessToEmployer(
    Session session,
    UuidValue employerId,
    UuidValue accessId,
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

  /// Blocks or unblocks an employer account and revokes all tokens.
  ///
  /// [session] Current user session.
  /// [identifier] Auth ID, profile ID, or employer ID.
  /// [isBlocked] True to block, false to unblock.
  ///
  /// Returns success status.
  Future<bool> blockEmployer(
    Session session,
    UuidValue identifier,
    bool isBlocked,
  ) async {
    session.authorizedTo(['owner']);
    final employer = await getEmployerByIdentifier(session, identifier);
    await AuthServices.instance.authUsers.update(
      session,
      authUserId: employer.userProfile!.authUserId,
      blocked: isBlocked,
    );
    await AuthServices.instance.tokenManager.revokeAllTokens(
      session,
      authUserId: employer.userProfile!.authUserId,
    );
    return true;
  }
}
