import 'package:pos_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class AccessEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;
  @override
  Set<Scope> get requiredScopes => {Scope("admin")};

  Future<Access> createAccess(Session session, Access access) async {
    await checkAccessExist(session, access);
    return await Access.db.insertRow(session, access);
  }

  @doNotGenerate
  Future<List<Access>> createListAccess(
    Session session,
    List<Access> access,
  ) async {
    final existingAccess = await Access.db.findFirstRow(
      session,
      where: (t) => t.name.inSet(access.map((e) => e.name).toSet()),
    );
    if (existingAccess != null) {
      throw AppException(
        errorType: ExceptionType.Conflict,
        message: 'Access with name ${existingAccess.name} already exists.',
      );
    }
    return await Access.db.insert(session, access);
  }

  @doNotGenerate
  Future<void> checkAccessExist(Session session, Access access) async {
    final existingAccess = await Access.db.findFirstRow(
      session,
      where: (t) => t.name.equals(access.name),
    );
    if (existingAccess != null) {
      throw AppException(
        errorType: ExceptionType.Conflict,
        message: 'Access with name ${access.name} already exists.',
      );
    }
  }

  Future<List<Access>> getAllAccesses(Session session, int buildingId) async {
    return await Access.db.find(
      session,
      where: (t) => t.buildingId.equals(buildingId),
    );
  }

  Future<Access> getAccessById(Session session, int accessId) async {
    final access = await Access.db.findById(
      session,
      accessId,
    );
    if (access == null) {
      throw AppException(
        errorType: ExceptionType.NotFound,
        message: 'Access with id $accessId not found.',
      );
    }
    return access;
  }

  Future<Access> deleteAccess(Session session, int accessId) async {
    final access = await getAccessById(
      session,
      accessId,
    );
    return await Access.db.deleteRow(session, access);
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
    final access = await getAccessById(session, accessId);
    employer.accessId = access.id;
    return await Employer.db.updateRow(session, employer);
  }
}
