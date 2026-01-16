import 'package:pos_server/src/employer/employer_endpoint.dart';
import 'package:pos_server/src/generated/protocol.dart';
import 'package:pos_server/src/helpers/authorizations_helpers.dart';
import 'package:pos_server/src/order/order_endpoint.dart';
import 'package:serverpod/serverpod.dart' hide Order;
import 'package:serverpod_auth_idp_server/core.dart';

import '../buildings/building_endpoint.dart';

class OrderItemEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Append items to an existing order
  /// Parameters:
  /// - [orderId]: The id of the order to append items to
  /// - [orderItems]: The list of items to append to the order
  /// Returns:
  /// - The updated order with the appended items
  /// Employer should have access to append items
  Future<Order> appendItemsToOrder(
    Session session,
    int orderId,
    List<OrderItem> orderItems,
  ) async {
    /// Only employer allowed for this endpoint
    await AuthorizationsHelpers().requiredScopes(session, ["employer"]);

    /// Employer should have access to append items
    final employer = await EmployerEndpoint().getEmployerByIdentifier(
      session,
      session.authenticated!.authUserId,
    );
    if (employer.access != null && employer.access?.appendItems == false) {
      throw AppException(
        errorType: ExceptionType.Forbidden,
        message: 'You don\'t have access to append items to orders',
      );
    }

    /// Must provide at least one new item to append
    if (orderItems.isEmpty) {
      throw AppException(
        errorType: ExceptionType.BadRequest,
        message: 'You must provide at least one new item to append',
      );
    }

    /// Get the order by id
    Order order = await OrderEndpoint().getOrderById(session, orderId);
    if (order.status == OrderStatus.payed) {
      throw AppException(
        errorType: ExceptionType.Forbidden,
        message: 'Cannot append items to a paid order',
      );
    }

    /// Check if table allows appending items to order
    final building = await BuildingEndpoint().getBuildingById(
      session,
      order.btable!.buildingId!,
    );
    if (building.allowAppendingItemsToOrder == false) {
      throw AppException(
        errorType: ExceptionType.Forbidden,
        message: 'This building does not allow appending items to orders',
      );
    }

    /// Insert new items to the database
    final newOrderItems = await OrderItem.db.insert(
      session,
      orderItems,
    );

    /// Attach new items to the order
    await Order.db.attach.items(session, order, newOrderItems);

    /// Update the order's updatedAt field
    order.updatedAt = DateTime.now();
    final orderUpdated = await Order.db.updateRow(
      session,
      order,
      columns: (t) => [t.updatedAt],
    );
    return orderUpdated;
  }

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

  Future<List<OrderItem>> payOrderItem(
    Session session,
    int orderId,
    List<int> orderItemPayedIds,
    int buildingId,
  ) async {
    /// verify employer access
    await AuthorizationsHelpers().requiredScopes(session, ["employer"]);
    final employer = await EmployerEndpoint().getEmployerByIdentifier(
      session,
      session.authenticated!.authUserId,
    );
    if (employer.access != null &&
        employer.access?.orderItemsPayment == false) {
      throw AppException(
        errorType: ExceptionType.Forbidden,
        message: 'You don\'t have access to pay order items',
      );
    }

    /// mark items as payed
    final order = await OrderEndpoint().getOrderById(session, orderId);
    for (var item in order.items!) {
      if (orderItemPayedIds.contains(item.id)) {
        item.itemStatus = OrderItemStatus.payed;
        item.payedToId = employer.userProfileId;
        item.payedAt = DateTime.now();
        item.updatedAt = DateTime.now();
      }
    }
    final updatedItems = await OrderItem.db.update(
      session,
      order.items!,
      columns: (cls) => [
        cls.itemStatus,
        cls.payedToId,
        cls.payedAt,
        cls.updatedAt,
      ],
    );

    /// if all items are payed mark order as payed
    if (!order.items!.any((i) => i.itemStatus != OrderItemStatus.payed)) {
      await OrderEndpoint().makeOrderPayed(
        session,
        order,
        employer.userProfileId,
        buildingId,
      );
    }
    return updatedItems;
  }

  Future<Order> payAllItems(
    Session session,
    int orderId,
    int buildingId,
  ) async {
    /// verify employer access
    await AuthorizationsHelpers().requiredScopes(session, ["employer"]);
    final employer = await EmployerEndpoint().getEmployerByIdentifier(
      session,
      session.authenticated!.authUserId,
    );
    if (employer.access != null &&
        employer.access?.orderItemsPayment == false) {
      throw AppException(
        errorType: ExceptionType.Forbidden,
        message: 'You don\'t have access to pay order items',
      );
    }

    /// mark all items as payed
    final order = await OrderEndpoint().getOrderById(session, orderId);
    for (var item in order.items!) {
      if (item.itemStatus != OrderItemStatus.payed) {
        item.itemStatus = OrderItemStatus.payed;
        item.payedToId = employer.userProfileId;
        item.payedAt = DateTime.now();
        item.updatedAt = DateTime.now();
        await OrderItem.db.updateRow(session, item);
      }
    }
    return await OrderEndpoint().makeOrderPayed(
      session,
      order,
      employer.userProfileId,
      buildingId,
    );
  }
}
