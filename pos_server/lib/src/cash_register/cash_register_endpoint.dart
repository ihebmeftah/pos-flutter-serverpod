import '../generated/order/entity/order.dart' as orderentity;
import '../helpers/session_extensions.dart';
import '../helpers/endpoint_helpers.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import '../generated/protocol.dart' hide Order;

class CashRegisterEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Retrieves all cash registers for a building, ordered by start time.
  /// Requires cash register management permission for employers.
  ///
  /// [session] Current user session.
  /// [buildingId] ID of the building to fetch registers from.
  ///
  /// Returns a list of cash registers sorted by start time (descending).
  Future<List<CashRegister>> getCashRegisters(
    Session session,
    UuidValue buildingId,
  ) async {
    final currScope = session.authorizedTo(['employer', 'owner']);
    if (currScope.contains(Scope('employer'))) {
      Employer employer = await EndpointHelpers.getEmployerByAuthUserId(
        session,
        session.authenticated!.authUserId,
      );
      EndpointHelpers.verifyEmployerAccess(
        employer,
        (access) => access.cashRegisterManagement,
        'manage CashRegisters',
      );
    }
    return await CashRegister.db.find(
      session,
      where: (t) {
        // employer see all cash registers of current day only
        if (currScope.contains(Scope("employer"))) {
          return t.buildingId.equals(buildingId) &
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
              );
        }
        return t.buildingId.equals(buildingId);
      },
      orderByList: (k) => [
        Order(column: k.start, orderDescending: true),
      ],
    );
  }

  /// Creates a new cash register session for the day.
  /// Validates daily limit and ensures no other register is open. Employer only.
  ///
  /// [session] Current user session.
  /// [buildingId] ID of the building.
  /// [startAmount] Optional starting cash amount.
  ///
  /// Returns the newly created cash register.
  Future<CashRegister> createCashRegister(
    Session session,
    UuidValue buildingId,
    double? startAmount,
  ) async {
    session.authorizedTo(['employer']);
    // Get employer with building included
    Employer employer = await EndpointHelpers.getEmployerByAuthUserId(
      session,
      session.authenticated!.authUserId,
    );
    // Verify employer has access to manage cash registers
    EndpointHelpers.verifyEmployerAccess(
      employer,
      (access) => access.cashRegisterManagement,
      'manage CashRegisters',
    );
    // Verify employer belongs to this building
    EndpointHelpers.verifyEmployerBuilding(employer, buildingId);
    final building = employer.building!;
    if (!building.orderWithCashRegister) {
      throw AppException(
        errorType: ExceptionType.Forbidden,
        message: 'The building is not configured to use cash register system',
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

    if (building.cashRegisterLimitPerDay != null) {
      if (todeyCashRegisterNb >= building.cashRegisterLimitPerDay!) {
        throw AppException(
          errorType: ExceptionType.Conflict,
          message:
              'Cash register limit per day reached for this building (${building.cashRegisterLimitPerDay})',
        );
      }
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
    return newCashRegister;
  }

  /// Closes the currently open cash register.
  /// Validates all orders are paid before closing. Employer only.
  ///
  /// [session] Current user session.
  /// [buildingId] ID of the building.
  /// [endAmount] Optional ending cash amount.
  ///
  /// Returns the closed cash register with end time.
  Future<CashRegister> closeLastCashRegister(
    Session session,
    UuidValue buildingId,
    double? endAmount,
  ) async {
    session.authorizedTo(['employer']);
    Employer employer = await EndpointHelpers.getEmployerByAuthUserId(
      session,
      session.authenticated!.authUserId,
    );
    EndpointHelpers.verifyEmployerAccess(
      employer,
      (access) => access.cashRegisterManagement,
      'manage CashRegisters',
    );
    final current = await EndpointHelpers.getCurrentCashRegister(
      session,
      employer.building!,
    );
    if (current == null) {
      throw AppException(
        errorType: ExceptionType.NotFound,
        message: 'No opened CashRegister found for this building',
      );
    }
    // Verify no unpaid orders exist
    final countUnpaidOrder = await orderentity.Order.db.count(
      session,
      where: (t) =>
          t.btable.buildingId.equals(buildingId) &
          t.cashRegisterId.equals(current.id) &
          t.status.notEquals(OrderStatus.payed),
    );
    if (countUnpaidOrder > 0) {
      throw AppException(
        errorType: ExceptionType.Forbidden,
        message: 'Cannot close cash register while there are unpaid orders',
      );
    }
    // Use the current cash register we already fetched
    current.endAmount = endAmount;
    current.end = DateTime.now();
    current.isClosed = true;
    final updatedCashRegister = await CashRegister.db.updateRow(
      session,
      current,
      columns: (cls) => [cls.isClosed, cls.end, cls.endAmount],
    );
    return updatedCashRegister;
  }
}
