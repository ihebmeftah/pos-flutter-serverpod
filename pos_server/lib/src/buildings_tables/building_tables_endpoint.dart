import 'package:pos_server/src/generated/protocol.dart';
import '../helpers/session_extensions.dart';
import 'package:pos_server/src/order/order_endpoint.dart';
import 'package:serverpod/serverpod.dart';

/// Building Tables Endpoint
/// All Endpoint required login
class BuildingTablesEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Get all tables for a building
  /// required [buildingId] buildingId The id of the building
  /// Returns a list of [BTable] tables
  /// allow for all type of users (admin, employee, customer)
  Future<List<BTable>> getTablesByBuildingId(
    Session session,
    UuidValue buildingId,
  ) async {
    List<BTable> tables = await BTable.db.find(
      session,
      where: (t) => t.buildingId.equals(buildingId),
    );
    for (BTable table in tables) {
      final haveOrder = await OrderEndpoint().getOrderCurrOfTable(
        session,
        table.id,
      );
      if (haveOrder != null) {
        table.status = TableStatus.occupied;
      } else {
        table.status = TableStatus.available;
      }
    }
    return tables;
  }

  /// Create multiple tables for a building
  /// required [nbtables] number of tables to create
  /// required [seatsMax] maximum number of seats per table
  /// required [buildingId] buildingId The id of the building
  /// Returns a list of created [BTable] tables
  /// allow for admin users only
  Future<List<BTable>> createTables(
    Session session, {
    required int nbtables,
    required int seatsMax,
    required UuidValue buildingId,
  }) async {
    session.authorizedTo(['owner']);
    int total = await BTable.db.count(
      session,
      where: (t) => t.buildingId.equals(buildingId),
    );
    List<BTable> bTables = [];
    for (var i = total; i < nbtables + total; i++) {
      bTables.add(
        BTable(
          number: i + 1,
          seatsMax: seatsMax,
          buildingId: buildingId,
        ),
      );
    }
    return await BTable.db.insert(
      session,
      bTables,
    );
  }
}
