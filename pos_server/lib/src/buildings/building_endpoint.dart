import 'package:pos_server/src/access/access_endpoint.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';

import '../generated/protocol.dart';
import '../helpers/authorizations_helpers.dart';

class BuildingEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Get all buildings
  /// If current user is admin user, return only buildings created by the user
  /// else current user is customer, return all buildings
  /// Returns a list of [Building] buildings
  /// allow for all type of users (admin, customer)
  Future<List<Building>> getAllBuildings(Session session) async {
    final currentUserScope = await AuthorizationsHelpers().requiredScopes(
      session,
      ["admin", "customer"],
    );
    if (currentUserScope.any((scope) => scope.name == "admin")) {
      return await Building.db.find(
        session,
        where: (t) => t.authUserId.equals(
          session.authenticated?.authUserId,
        ),
      );
    }
    return await Building.db.find(session);
  }

  /// Create new building for the admin
  /// Returns  [Building] building
  /// allowed only for admins
  Future<Building> createBuilding(Session session, Building building) async {
    await AuthorizationsHelpers().requiredScopes(session, ["admin"]);
    building.authUserId = session.authenticated?.authUserId;
    final createdBuilding = await Building.db.insertRow(session, building);

    /// Create default access for the building
    final defaultAccess = [
      Access(
        name: 'waiter',
        orderCreation: true,
        orderPayment: false,
        orderItemsPayment: false,
        buildingId: createdBuilding.id!,
      ),
      Access(
        name: 'cashier',
        orderCreation: false,
        orderPayment: true,
        orderItemsPayment: true,
        buildingId: createdBuilding.id!,
      ),
      Access(
        name: 'barista',
        orderCreation: false,
        orderPayment: false,
        orderItemsPayment: false,
        orderCreationNotif: true,
        buildingId: createdBuilding.id!,
      ),
    ];
    await AccessEndpoint().createListAccess(session, defaultAccess);
    return createdBuilding;
  }

  /// Get a building by id
  /// required [buildingId] The id of the building
  /// Returns the [Building] building
  /// allow for all type of users (admin, customer)
  /// This method is not generated in client side
  @doNotGenerate
  Future<Building> getBuildingById(Session session, int buildingId) async {
    Building? building = await Building.db.findById(session, buildingId);
    if (building == null) {
      throw AppException(
        message: 'Building with id $buildingId not found',
        errorType: ExceptionType.NotFound,
      );
    }
    return building;
  }
}
