import 'package:pos_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class AccessEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;
  @override
  Set<Scope> get requiredScopes => {Scope("owner")};

  /// Creates a new access role for a building.
  /// Validates name uniqueness within the building. Owner only.
  ///
  /// [session] Current user session.
  /// [access] Access configuration to create.
  ///
  /// Returns the newly created access role.
  Future<Access> createAccess(Session session, Access access) async {
    await checkAccessNameExist(session, access.name, access.buildingId);
    return await Access.db.insertRow(session, access);
  }

  /// Updates an existing access role's permissions.
  /// Validates name uniqueness if name changed. Owner only.
  ///
  /// [session] Current user session.
  /// [access] Updated access configuration.
  ///
  /// Returns the updated access role.
  Future<Access> updateAccess(Session session, Access access) async {
    final oldAccess = await getAccessById(session, access.id);
    if (oldAccess.name != access.name) {
      await checkAccessNameExist(session, access.name, access.buildingId);
    }
    return await Access.db.updateRow(session, access);
  }

  @doNotGenerate
  Future<List<Access>> createListAccess(
    Session session,
    List<Access> access,
  ) async {
    final existingAccess = await Access.db.findFirstRow(
      session,
      where: (t) =>
          t.name.inSet(access.map((e) => e.name).toSet()) &
          t.buildingId.inSet(access.map((e) => e.buildingId).toSet()),
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
  Future<void> checkAccessNameExist(
    Session session,
    String name,
    UuidValue buildingId,
  ) async {
    final existingAccess = await Access.db.findFirstRow(
      session,
      where: (t) => t.name.ilike(name) & t.buildingId.equals(buildingId),
    );
    if (existingAccess != null) {
      throw AppException(
        errorType: ExceptionType.Conflict,
        message: 'Access with name $name already exists.',
      );
    }
  }

  /// Retrieves all access roles configured for a building.
  ///
  /// [session] Current user session.
  /// [buildingId] ID of the building.
  ///
  /// Returns a list of access roles for the building.
  Future<List<Access>> getAccessesByBuildingId(
    Session session,
    UuidValue buildingId,
  ) async {
    return await Access.db.find(
      session,
      where: (t) => t.buildingId.equals(buildingId),
    );
  }

  /// Fetches a specific access role by ID.
  ///
  /// [session] Current user session.
  /// [accessId] ID of the access role to fetch.
  ///
  /// Returns the access role if found.
  Future<Access> getAccessById(Session session, UuidValue accessId) async {
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

  /// Deletes an access role from a building.
  ///
  /// [session] Current user session.
  /// [accessId] ID of the access role to delete.
  ///
  /// Returns the deleted access role.
  Future<Access> deleteAccess(Session session, UuidValue accessId) async {
    final access = await getAccessById(
      session,
      accessId,
    );
    return await Access.db.deleteRow(session, access);
  }
}
