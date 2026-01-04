import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';

import '../generated/buildings/building.dart';

class BuildingEndpoint extends Endpoint {
  Future<List<Building>> getAllBuildings(Session session) async {
    if (session.isUserSignedIn) {
      return await Building.db.find(
        session,
        where: (t) => t.authUserId.equals(
          session.authenticated?.authUserId,
        ),
      );
    }
    return await Building.db.find(session);
  }

  Future<Building> createBuilding(Session session, Building building) async {
    if (!session.isUserSignedIn) {
      throw AuthUserNotFoundException();
    }
    building.authUserId = session.authenticated?.authUserId;
    return await Building.db.insertRow(session, building);
  }
}
