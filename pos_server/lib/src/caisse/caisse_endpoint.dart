import 'package:pos_server/src/employer/employer_endpoint.dart';
import '../helpers/session_extensions.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';

import '../generated/protocol.dart' hide Order;

class CaisseEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;
  Future<List<Caisse>> getCaisses(Session session, UuidValue buildingId) async {
    session.authorizedTo(['employer']);
    Employer employer = await EmployerEndpoint().getEmployerByIdentifier(
      session,
      session.authenticated!.authUserId,
    );
    if (employer.access == null || employer.access?.caisseManagement == false) {
      throw AppException(
        errorType: ExceptionType.Forbidden,
        message: 'You don\'t have access to manage caisses',
      );
    }
    return await Caisse.db.find(
      session,
      where: (t) => t.buildingId.equals(buildingId),
      orderByList: (k) => [
        Order(column: k.createdAt, orderDescending: true),
      ],
    );
  }

  Future<Caisse> createCaisse(Session session, UuidValue buildingId) async {
    await _closeLastCaisse(session, buildingId);
    return await Caisse.db.insertRow(
      session,
      Caisse(
        start: DateTime.now(),
        isClosed: false,
        buildingId: buildingId,
      ),
    );
  }

  @doNotGenerate
  Future<bool> _closeLastCaisse(Session session, UuidValue buildingId) async {
    session.authorizedTo(['employer']);

    Employer employer = await EmployerEndpoint().getEmployerByIdentifier(
      session,
      session.authenticated!.authUserId,
    );
    if (employer.access == null || employer.access?.caisseManagement == false) {
      throw AppException(
        errorType: ExceptionType.Forbidden,
        message: 'You don\'t have access to manage caisses',
      );
    }
    Caisse? caisse = await Caisse.db.findFirstRow(
      session,
      where: (t) => t.buildingId.equals(buildingId) & t.isClosed.equals(false),
    );
    if (caisse == null) return false;
    caisse.end = DateTime.now();
    caisse.isClosed = true;
    await Caisse.db.updateRow(
      session,
      caisse,
      columns: (cls) => [cls.isClosed, cls.end],
    );
    return true;
  }
}
