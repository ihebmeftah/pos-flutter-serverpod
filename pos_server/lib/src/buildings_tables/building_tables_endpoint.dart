import 'package:pos_server/src/generated/protocol.dart';
import 'package:pos_server/src/helpers/authorizations_helpers.dart';
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
  Future<List<BTable>> getTables(Session session, int buildingId) async {
    List<BTable> tables = await BTable.db.find(
      session,
      where: (t) => t.buildingId.equals(buildingId),
    );
    for (BTable table in tables) {
      table.status = await OrderEndpoint().checkTableHaveOrder(
        session,
        table.id!,
      );
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
    required int buildingId,
  }) async {
    await AuthorizationsHelpers().requiredScopes(session, ["admin"]);
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

  /// Get a table by its id
  /// required [tableId] The id of the table
  /// optional [buildingId] The id of the building
  /// Returns the [BTable] table
  /// allow for all type of users (admin, employee, customer)
  Future<BTable> getTableById(
    Session session,
    int tableId, [
    int? buildingId,
  ]) async {
    if (buildingId != null) {
      BTable? table = await BTable.db.findFirstRow(
        session,
        where: (t) => t.id.equals(tableId) & t.buildingId.equals(buildingId),
      );
      if (table == null) {
        throw AppException(
          message: 'Table with id $tableId not found',
          errorType: ExceptionType.NotFound,
        );
      }
      return table;
    }
    BTable? table = await BTable.db.findFirstRow(
      session,
      where: (t) => t.id.equals(tableId) & t.buildingId.equals(buildingId),
    );
    if (table == null) {
      throw AppException(
        errorType: ExceptionType.NotFound,
        message: 'Table with id $tableId not found',
      );
    }
    return table;
  }
}
