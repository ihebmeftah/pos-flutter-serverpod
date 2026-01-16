import 'package:pos_server/src/employer/employer_endpoint.dart';
import 'package:pos_server/src/generated/protocol.dart';
import 'package:pos_server/src/helpers/authorizations_helpers.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';

class OrderItemEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Change status of order items
  /// items status should have this workflow (progress -> picked -> ready -> delivered)
  /// Parameters:
  /// - [orderItemIds]: List of order item IDs to be updated
  /// - [newStatus]: The new status to be set for the order items
  /// Returns:
  /// - A list of updated OrderItem objects
  Future<List<OrderItem>> changeOrderItemsStatus(
    Session session,
    List<int> orderItemIds,
    OrderItemStatus newStatus,
  ) async {
    await AuthorizationsHelpers().requiredScopes(session, ["employer"]);

    /// Check if employer has access to change the status
    final employer = await EmployerEndpoint().getEmployerByIdentifier(
      session,
      session.authenticated!.authUserId,
    );
    if (newStatus case OrderItemStatus.ready || OrderItemStatus.picked) {
      if (((employer.access?.preparation ?? false) == false)) {
        throw AppException(
          errorType: ExceptionType.Forbidden,
          message: 'You are not authorized to change items status',
        );
      }
    } else {
      if ((employer.access?.takeOrder ?? false) == false) {
        throw AppException(
          errorType: ExceptionType.Forbidden,
          message: 'You are not authorized to change items status',
        );
      }
    }

    /// Fetch order items and update their status
    List<OrderItem> orderItems = await OrderItem.db.find(
      session,
      where: (val) => val.id.inSet(orderItemIds.toSet()),
    );
    for (OrderItem item in orderItems) {
      if (item.itemStatus != newStatus) {
        item.itemStatus = newStatus;
        item.preparedById = employer.userProfile!.id;
        item.preaparedAt = DateTime.now();
        item.updatedAt = DateTime.now();
      }
    }
    return await OrderItem.db.update(
      session,
      orderItems,
      columns: (cls) => [
        cls.itemStatus,
        cls.preparedById,
        cls.preaparedAt,
        cls.updatedAt,
      ],
    );
  }
}
