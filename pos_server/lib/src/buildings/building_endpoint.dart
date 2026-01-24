import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';

import '../generated/protocol.dart';
import '../helpers/session_extensions.dart';

class BuildingEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Retrieves all buildings owned by the authenticated owner.
  ///
  /// [session] Current user session.
  ///
  /// Returns a list of buildings owned by the user.
  Future<List<Building>> getBuildingsOfOwner(Session session) async {
    session.authorizedTo(['owner']);
    return await Building.db.find(
      session,
      where: (t) => t.authUserId.equals(
        session.authenticated?.authUserId,
      ),
    );
  }

  /// Fetches all buildings available in the system.
  /// Used by customers to browse available locations.
  ///
  /// [session] Current user session.
  ///
  /// Returns a list of all buildings.
  Future<List<Building>> getBuildings(Session session) async {
    session.authorizedTo(['customer']);
    return await Building.db.find(session);
  }

  /// Creates a new building with default access roles (waiter, cashier, barista).
  /// Owner only.
  ///
  /// [session] Current user session.
  /// [building] Building data to create.
  ///
  /// Returns the newly created building.
  Future<Building> createBuilding(Session session, Building building) async {
    session.authorizedTo(["owner"]);
    final createdBuilding = await Building.db.insertRow(session, building);
    return createdBuilding;
  }

  /// Retrieves a building by its ID.
  ///
  /// [session] Current user session.
  /// [buildingId] ID of the building to fetch.
  ///
  /// Returns the building if found.
  Future<Building> getBuildingById(
    Session session,
    UuidValue buildingId,
  ) async {
    Building? building = await Building.db.findById(session, buildingId);
    if (building == null) {
      throw AppException(
        message: 'Building with id $buildingId not found',
        errorType: ExceptionType.NotFound,
      );
    }
    return building;
  }

  /// Updates a building's information and broadcasts changes.
  /// Validates ownership before updating. Owner only.
  ///
  /// [session] Current user session.
  /// [building] Updated building data.
  ///
  /// Returns the updated building.
  Future<Building> updateBuilding(Session session, Building building) async {
    session.authorizedTo(["owner"]);
    final existingBuilding = await getBuildingById(session, building.id);
    if (existingBuilding.authUserId != session.authenticated?.authUserId) {
      throw AppException(
        message: 'You are not authorized to update this building',
        errorType: ExceptionType.Unauthorized,
      );
    }
    final updatedBuilding = await Building.db.updateRow(session, building);
    await session.messages.postMessage(
      '${updateBuildingChannel}_${building.id}',
      updatedBuilding,
    );
    return updatedBuilding;
  }

  final String updateBuildingChannel = 'buildings_update';

  /// Streams real-time updates for a building's changes.
  ///
  /// [session] Current user session.
  /// [buildingId] ID of the building to watch.
  ///
  /// Returns a stream of building update events.
  Stream<Building> watchUpdateBuildings(
    Session session,
    UuidValue buildingId,
  ) async* {
    final stream = session.messages.createStream<Building>(
      '${updateBuildingChannel}_${buildingId.toString()}',
    );
    await for (final message in stream) {
      yield message;
    }
  }
}
