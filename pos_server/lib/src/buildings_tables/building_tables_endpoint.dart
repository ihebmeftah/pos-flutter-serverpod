import 'package:pos_server/src/generated/protocol.dart';
import 'package:pos_server/src/order/order_endpoint.dart';
import '../helpers/session_extensions.dart';
import 'package:serverpod/serverpod.dart';
import '../generated/order/entity/order.dart' as orderentity;

/// Building Tables Endpoint
/// All Endpoint required login
class BuildingTablesEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Fetches all tables for a building with current occupation status.
  /// Checks for active orders to determine availability.
  ///
  /// [session] Current user session.
  /// [buildingId] ID of the building to fetch tables from.
  ///
  /// Returns a list of tables with status (available/occupied).
  Future<List<BTable>> getTablesByBuildingId(
    Session session,
    UuidValue buildingId,
  ) async {
    // Fetch all tables
    List<BTable> tables = await BTable.db.find(
      session,
      orderBy: (col) => col.number,
      orderDescending: false,
      where: (t) {
        if (session.authenticated!.scopes.contains(Scope("employer"))) {
          return t.buildingId.equals(buildingId) & t.active.equals(true);
        }
        return t.buildingId.equals(buildingId);
      },
    );

    // Get all table IDs with active orders in one query
    final occupiedTables = await orderentity.Order.db.find(
      session,
      where: (o) =>
          o.btableId.inSet(tables.map((t) => t.id).toSet()) &
          o.status.equals(OrderStatus.progress),
    );

    // Create set of occupied table IDs for quick lookup
    final occupiedTableIds = occupiedTables.map((o) => o.btableId).toSet();

    // Update table statuses
    for (BTable table in tables) {
      table.status = occupiedTableIds.contains(table.id)
          ? TableStatus.occupied
          : TableStatus.available;
    }

    return tables;
  }

  /// Creates multiple tables for a building with sequential numbering.
  /// Continues numbering from existing table count. Owner only.
  ///
  /// [session] Current user session.
  /// [nbtables] Number of tables to create.
  /// [seatsMax] Maximum seats per table.
  /// [buildingId] ID of the building.
  ///
  /// Returns a list of newly created tables.
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

  Future<BTable> getTableById(
    Session session,
    UuidValue tableId,
    UuidValue buildingId,
  ) async {
    BTable? table = await BTable.db.findFirstRow(
      session,
      where: (t) => t.id.equals(tableId) & t.buildingId.equals(buildingId),
    );
    if (table == null) {
      throw AppException(
        errorType: ExceptionType.NotFound,
        message: 'Table not found',
      );
    }
    final order = await OrderEndpoint().getOrderCurrOfTable(session, table.id);
    if (order != null) {
      table.status = TableStatus.occupied;
    }
    return table;
  }

  Future<BTable> mangeTableActivation(
    Session session,
    UuidValue tableId,
    UuidValue buildingId,
  ) async {
    session.authorizedTo(['owner']);
    final table = await getTableById(session, tableId, buildingId);
    if (table.status == TableStatus.occupied) {
      throw AppException(
        errorType: ExceptionType.Forbidden,
        message: 'Cannot change activation status of an occupied table',
      );
    }
    final updatedTable = await BTable.db.updateById(
      session,
      table.id,
      columnValues: (cls) {
        return [cls.active(!table.active)];
      },
    );
    if (updatedTable == null) {
      throw AppException(
        errorType: ExceptionType.Forbidden,
        message: 'Somthing went wrong while table activation',
      );
    }
    return updatedTable;
  }
}
