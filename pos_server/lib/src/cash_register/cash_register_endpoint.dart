import 'package:pos_server/src/buildings/building_endpoint.dart';
import 'package:pos_server/src/employer/employer_endpoint.dart';
import '../generated/order/entity/order.dart' as orderentity;
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
        Order(column: k.start, orderDescending: true),
      ],
    );
  }

  Future<CashRegister> createCashRegister(
    Session session,
    UuidValue buildingId,
    double? startAmount,
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

    int todeyCashRegisterNb = await CashRegister.db.count(
      session,
      where: (t) =>
          t.buildingId.equals(buildingId) &
          t.start.between(
            DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
            ),
            DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
              23,
              59,
              59,
            ),
          ),
    );

    if (todeyCashRegisterNb >= building.cashRegisterLimitPerDay) {
      throw AppException(
        errorType: ExceptionType.Conflict,
        message:
            'Cash register limit per day reached for this building (${building.cashRegisterLimitPerDay})',
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
        startAmount: startAmount,
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
    double? endAmount,
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
    final current = await getCurrentCashRegister(session, employer.building!);
    final countUnpaidOrder = await orderentity.Order.db.count(
      session,
      where: (t) =>
          t.btable.buildingId.equals(buildingId) &
          t.cashRegisterId.equals(current!.id) &
          t.status.equals(OrderStatus.payed),
    );
    if (countUnpaidOrder > 0) {
      throw AppException(
        errorType: ExceptionType.Forbidden,
        message: 'Cannot close cash register while there are unpaid orders',
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
    cashRegister.endAmount = endAmount;
    cashRegister.end = DateTime.now();
    cashRegister.isClosed = true;
    final updatedCashRegister = await CashRegister.db.updateRow(
      session,
      cashRegister,
      columns: (cls) => [cls.isClosed, cls.end, cls.endAmount],
    );
    await session.messages.postMessage(
      '${cashRegisterChannel}_${buildingId.toString()}',
      updatedCashRegister,
    );
    return updatedCashRegister;
  }

  @doNotGenerate
  Future<CashRegister?> getCurrentCashRegister(
    Session session,
    Building building,
  ) async {
    if (!building.orderWithCashRegister) return null;
    final existe = await CashRegister.db.findFirstRow(
      session,
      where: (t) => t.buildingId.equals(building.id) & t.isClosed.equals(false),
    );
    if (building.orderWithCashRegister) {
      if (existe == null) {
        throw AppException(
          errorType: ExceptionType.NotFound,
          message:
              'No opened Cash register found for this building, please contact your administrator',
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
