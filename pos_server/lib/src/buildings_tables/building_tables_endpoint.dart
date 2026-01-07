import 'package:pos_server/src/generated/protocol.dart';
import 'package:pos_server/src/order/order_endpoint.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';

class BuildingTablesEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

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

  Future<List<BTable>> createTables(
    Session session, {
    required int nbtables,
    required int seatsMax,
    required int buildingId,
  }) async {
    if (!session.isUserSignedIn) throw AuthUserNotFoundException();
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

  @doNotGenerate
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
        throw Exception('Table with id $tableId not found');
      }
      return table;
    }
    BTable? table = await BTable.db.findFirstRow(
      session,
      where: (t) => t.id.equals(tableId) & t.buildingId.equals(buildingId),
    );
    if (table == null) {
      throw Exception('Table with id $tableId not found');
    }
    return table;
  }
}
