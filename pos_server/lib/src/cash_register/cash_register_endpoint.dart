import 'package:pos_server/src/buildings/building_endpoint.dart';
import 'package:pos_server/src/employer/employer_endpoint.dart';
import '../helpers/session_extensions.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';

import '../generated/protocol.dart' hide Order;

class CashRegisterEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;
  Future<List<CashRegister>> getCashRegisters(
    Session session,
    UuidValue buildingId,
  ) async {
    final currScope = session.authorizedTo(['employer', 'owner']);
    if (currScope.contains(Scope('employer'))) {
      Employer employer = await EmployerEndpoint().getEmployerByIdentifier(
        session,
        session.authenticated!.authUserId,
      );
      if (employer.access == null ||
          employer.access?.cashRegisterManagement == false) {
        throw AppException(
          errorType: ExceptionType.Forbidden,
          message: 'You don\'t have access to manage CashRegisters',
        );
      }
    }
    return await CashRegister.db.find(
      session,
      where: (t) => t.buildingId.equals(buildingId),
      orderByList: (k) => [
        Order(column: k.createdAt, orderDescending: true),
      ],
    );
  }

  Future<CashRegister> createCashRegister(
    Session session,
    UuidValue buildingId,
  ) async {
    session.authorizedTo(['employer']);
    final Building building = await BuildingEndpoint().getBuildingById(
      session,
      buildingId,
    );
    if (!building.orderWithCashRegister) {
      throw AppException(
        errorType: ExceptionType.Forbidden,
        message: 'The building is not configured to use cash register system',
      );
    }
    Employer employer = await EmployerEndpoint().getEmployerByIdentifier(
      session,
      session.authenticated!.authUserId,
    );
    if (employer.access == null ||
        employer.access?.cashRegisterManagement == false) {
      throw AppException(
        errorType: ExceptionType.Forbidden,
        message: 'You don\'t have access to manage CashRegisters',
      );
    }
    final existCashRegisterNotClosed = await CashRegister.db.findFirstRow(
      session,
      where: (t) => t.buildingId.equals(buildingId) & t.isClosed.equals(false),
    );
    if (existCashRegisterNotClosed != null) {
      throw AppException(
        errorType: ExceptionType.Conflict,
        message: 'There is already an opened CashRegister for this building',
      );
    }
    final newCashRegister = await CashRegister.db.insertRow(
      session,
      CashRegister(
        start: DateTime.now(),
        isClosed: false,
        buildingId: buildingId,
      ),
    );
    await session.messages.postMessage(
      '${cashRegisterChannel}_${buildingId.toString()}',
      newCashRegister,
    );
    return newCashRegister;
  }

  Future<CashRegister> closeLastCashRegister(
    Session session,
    UuidValue buildingId,
  ) async {
    session.authorizedTo(['employer']);
    Employer employer = await EmployerEndpoint().getEmployerByIdentifier(
      session,
      session.authenticated!.authUserId,
    );
    if (employer.access == null ||
        employer.access?.cashRegisterManagement == false) {
      throw AppException(
        errorType: ExceptionType.Forbidden,
        message: 'You don\'t have access to manage CashRegisters',
      );
    }
    final cashRegister = await CashRegister.db.findFirstRow(
      session,
      where: (t) => t.buildingId.equals(buildingId) & t.isClosed.equals(false),
    );
    if (cashRegister == null) {
      throw AppException(
        errorType: ExceptionType.NotFound,
        message: 'No opened CashRegister found for this building',
      );
    }
    cashRegister.end = DateTime.now();
    cashRegister.isClosed = true;
    final updatedCashRegister = await CashRegister.db.updateRow(
      session,
      cashRegister,
      columns: (cls) => [cls.isClosed, cls.end],
    );
    await session.messages.postMessage(
      '${cashRegisterChannel}_${buildingId.toString()}',
      updatedCashRegister,
    );
    return updatedCashRegister;
  }

  Future<CashRegister?> getCurrentCashRegister(
    Session session,
    UuidValue buildingId,
  ) async {
    session.authorizedTo(['employer', 'owner']);
    final Building building = await BuildingEndpoint().getBuildingById(
      session,
      buildingId,
    );
    if (!building.orderWithCashRegister) return null;
    final existe = await CashRegister.db.findFirstRow(
      session,
      where: (t) => t.buildingId.equals(buildingId) & t.isClosed.equals(false),
    );
    if (building.orderWithCashRegister) {
      if (existe == null) {
        throw AppException(
          errorType: ExceptionType.NotFound,
          message: 'No opened CashRegister found for this building',
        );
      }
    }
    return existe;
  }

  final String cashRegisterChannel = 'cashRegisters';
  Stream<CashRegister> watchCashRegisters(
    Session session,
    UuidValue buildingId,
  ) async* {
    final stream = session.messages.createStream<CashRegister>(
      '${cashRegisterChannel}_${buildingId.toString()}',
    );
    await for (final message in stream) {
      yield message;
    }
  }
}
