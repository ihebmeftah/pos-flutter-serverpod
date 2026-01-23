import 'package:pos_server/src/access/access_endpoint.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';

import '../generated/protocol.dart';
import '../helpers/session_extensions.dart';

class BuildingEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Get buildings of the owner
  /// Returns a list of [Building] buildings
  /// allow for owners users
  Future<List<Building>> getBuildingsOfOwner(Session session) async {
    session.authorizedTo(['owner']);
    return await Building.db.find(
      session,
      where: (t) => t.authUserId.equals(
        session.authenticated?.authUserId,
      ),
    );
  }

  /// Get buildings
  /// Returns a list of [Building] buildings
  /// allow for customer users
  Future<List<Building>> getBuildings(Session session) async {
    session.authorizedTo(['customer']);
    return await Building.db.find(session);
  }

  /// Create new building for the admin
  /// Returns  [Building] building
  /// allowed only for owner
  Future<Building> createBuilding(Session session, Building building) async {
    session.authorizedTo(["owner"]);
    final createdBuilding = await Building.db.insertRow(session, building);
    // Create default access for the building
    final defaultAccess = [
      Access(
        name: 'waiter',
        orderCreation: true,
        orderPayment: false,
        orderItemsPayment: false,
        consultAllOrders: false,
        orderCreationNotif: false,
        preparation: false,
        appendItems: false,
        serveOrder: true,
        cashRegisterManagement: false,
        buildingId: createdBuilding.id,
      ),
      Access(
        name: 'cashier',
        orderCreation: false,
        orderPayment: true,
        orderItemsPayment: true,
        consultAllOrders: true,
        cashRegisterManagement: true,
        orderCreationNotif: false,
        preparation: false,
        appendItems: false,
        serveOrder: false,
        buildingId: createdBuilding.id,
      ),
      Access(
        name: 'barista',
        orderCreation: false,
        orderPayment: false,
        orderItemsPayment: false,
        consultAllOrders: false,
        orderCreationNotif: false,
        preparation: true,
        appendItems: false,
        cashRegisterManagement: false,
        serveOrder: false,
        buildingId: createdBuilding.id,
      ),
    ];
    await AccessEndpoint().createListAccess(session, defaultAccess);
    return createdBuilding;
  }

  /// Get a building by id
  /// required [buildingId] The id of the building
  /// Returns the [Building] building
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
