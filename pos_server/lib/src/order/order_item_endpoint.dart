import 'package:pos_server/src/generated/protocol.dart';
import '../article/article_endpoint.dart';
import '../helpers/session_extensions.dart';
import '../helpers/endpoint_helpers.dart';
import 'package:pos_server/src/order/order_endpoint.dart';
import 'package:serverpod/serverpod.dart' hide Order;
import 'package:serverpod_auth_idp_server/core.dart';

class OrderItemEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Appends new items to an existing unpaid order.
  /// Validates building configuration, employer permissions, and article existence.
  ///
  /// [session] Current user session.
  /// [appendItemDto] Order ID, building ID, and new item IDs to append.
  ///
  /// Returns the updated order with all items.
  Future<Order> appendItemsToOrder(
    Session session,
    AppendItemsDto appendItemDto,
  ) async {
    session.authorizedTo(['employer']);

    // Fetch employer with preloaded building and access data
    final employer = await EndpointHelpers.getEmployerByAuthUserId(
      session,
      session.authenticated!.authUserId,
    );
    // Ensure employer belongs to the target building
    EndpointHelpers.verifyEmployerBuilding(employer, appendItemDto.buildingId);
    final building = employer.building!;

    // Validate building allows appending items
    if (building.allowAppendingItemsToOrder == false) {
      throw AppException(
        errorType: ExceptionType.Forbidden,
        message: 'This building does not allow appending items to orders',
      );
    }

    // Verify employer has permission to append items
    EndpointHelpers.verifyEmployerAccess(
      employer,
      (access) => access.appendItems,
      'append items to orders',
    );

    // Validate at least one item is provided
    if (appendItemDto.itemIds.isEmpty) {
      throw AppException(
        errorType: ExceptionType.BadRequest,
        message: 'You must provide at least one new item to append',
      );
    }

    // Fetch order and verify it's not already paid
    Order order = await OrderEndpoint().getOrderById(
      session,
      appendItemDto.orderId,
    );
    if (order.status == OrderStatus.payed) {
      throw AppException(
        errorType: ExceptionType.Forbidden,
        message: 'Cannot append items to a paid order',
      );
    }
    // Validate articles exist and create order items
    final orderItem = <OrderItem>[];
    for (final articleId in appendItemDto.itemIds) {
      final existArticle = await ArticleEndpoint().getArticleById(
        session,
        articleId,
        building.id,
      );
      orderItem.add(
        OrderItem(
          article: existArticle,
          itemStatus: OrderItemStatus.progress,
          createdAt: DateTime.now(),
          passedById: employer.userProfileId,
        ),
      );
    }

    // Persist new order items to database
    final newOrderItems = await OrderItem.db.insert(
      session,
      orderItem,
    );

    // Link items to order and update timestamp
    await Order.db.attach.items(session, order, newOrderItems);
    order.updatedAt = DateTime.now();
    final orderUpdated = await Order.db.updateRow(
      session,
      order,
      columns: (t) => [t.updatedAt],
    );
    return orderUpdated;
  }

  /// Changes status of order items following workflow: progress → picked → ready → served.
  /// Enforces strict mode workflow if enabled. Requires appropriate access.
  ///
  /// [session] Current user session.
  /// [orderItemIds] List of item IDs to update.
  /// [newStatus] New status to set (picked, ready, served).
  /// [buildingId] Building ID for validation.
  ///
  /// Returns a list of updated order items.
  Future<List<OrderItem>> changeOrderItemsStatus(
    Session session,
    List<UuidValue> orderItemIds,
    OrderItemStatus newStatus,
    UuidValue buildingId,
  ) async {
    session.authorizedTo(['employer']);

    // Get employer with building included
    final employer = await EndpointHelpers.getEmployerByAuthUserId(
      session,
      session.authenticated!.authUserId,
    );
    // Verify employer belongs to this building
    EndpointHelpers.verifyEmployerBuilding(employer, buildingId);
    final building = employer.building!;

    // Check if employer has access to change the status
    if (newStatus case OrderItemStatus.ready || OrderItemStatus.picked) {
      EndpointHelpers.verifyEmployerAccess(
        employer,
        (access) => access.preparation,
        'change items status',
      );
    } else {
      EndpointHelpers.verifyEmployerAccess(
        employer,
        (access) => access.serveOrder,
        'change items status',
      );
    }

    // Fetch order items and update their status
    List<OrderItem> orderItems = await OrderItem.db.find(
      session,
      where: (val) => val.id.inSet(orderItemIds.toSet()),
    );
    for (OrderItem item in orderItems) {
      if (item.itemStatus != newStatus) {
        EndpointHelpers.verifyStrictModeWorkflow(
          building,
          item,
          newStatus,
        );
        item.itemStatus = newStatus;
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

  /// Marks specific order items as paid.
  /// In strict mode, items must be served before payment.
  ///
  /// [session] Current user session.
  /// [orderId] Order containing the items.
  /// [orderItemPayedIds] List of item IDs to mark as paid.
  /// [buildingId] Building ID for validation.
  ///
  /// Returns a list of paid order items.
  Future<List<OrderItem>> payOrderItem(
    Session session,
    UuidValue orderId,
    List<UuidValue> orderItemPayedIds,
    UuidValue buildingId,
  ) async {
    // verify employer access
    session.authorizedTo(['employer']);

    final employer = await EndpointHelpers.getEmployerByAuthUserId(
      session,
      session.authenticated!.authUserId,
    );
    // Verify employer belongs to this building
    EndpointHelpers.verifyEmployerBuilding(employer, buildingId);
    final building = employer.building!;

    EndpointHelpers.verifyEmployerAccess(
      employer,
      (access) => access.orderItemsPayment,
      'get the payment of the items',
    );

    // mark items as payed
    final order = await OrderEndpoint().getOrderById(session, orderId);
    for (var item in order.items!) {
      if (orderItemPayedIds.contains(item.id)) {
        if (building.strictMode) {
          if (item.itemStatus != OrderItemStatus.served) {
            throw AppException(
              errorType: ExceptionType.Forbidden,
              message:
                  'You have item must be delivered before paying in strict mode, item: ${item.article.name}',
            );
          }
        }
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

    // if all items are payed mark order as payed
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

  /// Pays all items in an order at once and marks order as complete.
  /// In strict mode, all items must be served before payment.
  ///
  /// [session] Current user session.
  /// [orderId] ID of the order to pay.
  /// [buildingId] Building ID for validation.
  ///
  /// Returns the completed and paid order.
  Future<Order> payAllItems(
    Session session,
    UuidValue orderId,
    UuidValue buildingId,
  ) async {
    // verify employer access
    session.authorizedTo(['employer']);

    final employer = await EndpointHelpers.getEmployerByAuthUserId(
      session,
      session.authenticated!.authUserId,
    );
    // Verify employer belongs to this building
    EndpointHelpers.verifyEmployerBuilding(employer, buildingId);
    final building = employer.building!;

    EndpointHelpers.verifyEmployerAccess(
      employer,
      (access) => access.orderItemsPayment,
      'get the payment of the order',
    );

    // mark all items as payed
    final order = await OrderEndpoint().getOrderById(session, orderId);
    if (building.strictMode) {
      if (order.items!.any(
        (item) => item.itemStatus != OrderItemStatus.served,
      )) {
        throw AppException(
          errorType: ExceptionType.Forbidden,
          message:
              'All items must be delivered before paying the order in strict mode',
        );
      }
    }
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
