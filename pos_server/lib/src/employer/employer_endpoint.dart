import 'package:pos_server/src/access/access_endpoint.dart';
import 'package:pos_server/src/buildings/building_endpoint.dart';
import 'package:pos_server/src/generated/protocol.dart';
import '../helpers/session_extensions.dart';
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
  /// allow for iwner users only
  Future<Employer> createEmployerAccount(
    Session session,
    CreateEmployerDTO createEmployerDto,
  ) async {
    session.authorizedTo(['owner']);
    final emailIdp = AuthServices.instance.emailIdp;
    return session.db.transaction<Employer>((transaction) async {
      final building = await BuildingEndpoint().getBuildingById(
        session,
        createEmployerDto.buildingId,
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

  /// Get employers by buildingId
  /// Identifier can be a[buildingId]
  /// Returns list of [Employer]
  /// This enpoint need login and allowed only for owner
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
