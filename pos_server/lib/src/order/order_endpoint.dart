import 'package:pos_server/src/buildings/building_endpoint.dart';
import 'package:pos_server/src/employer/employer_endpoint.dart';
import 'package:pos_server/src/generated/protocol.dart';
import 'package:pos_server/src/helpers/authorizations_helpers.dart';
import 'package:serverpod/serverpod.dart' hide Order;
import 'package:serverpod/serverpod.dart' as s;
import 'package:serverpod_auth_idp_server/core.dart';

class OrderEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<Order>> getOrders(
    Session session,
    int buildingId,
    OrderStatus? orderStatus,
  ) async {
    Employer? employer;
    if (session.authenticated!.scopes.contains(Scope("employer"))) {
      employer = await EmployerEndpoint().getEmployerByIdentifier(
        session,
        session.authenticated!.authUserId,
      );
    }
    return await Order.db.find(
      session,
      orderByList: (k) => [
        s.Order(column: k.createdAt, orderDescending: true),
        s.Order(column: k.status, orderDescending: true),
      ],
      where: (t) {
        final base = t.btable.buildingId.equals(buildingId);
        final currentUser =
            (t.passedBy.authUserId.equals(session.authenticated!.authUserId) |
            t.closedby.authUserId.equals(session.authenticated!.authUserId) |
            t.items.any(
              (item) {
                return item.passedBy.authUserId.equals(
                  session.authenticated!.authUserId,
                );
              },
            ));
        if (session.authenticated!.scopes.contains(Scope("owner")) ||
            (employer?.access?.consultAllOrders ?? false)) {
          /// Owner can see all orders
          if (orderStatus != null) return base & t.status.equals(orderStatus);
          return base;
        } else {
          if (orderStatus != null) {
            return base & t.status.equals(orderStatus) & currentUser;
          }
          return base & currentUser;
        }
      },
      include: Order.include(
        btable: BTable.include(),
        passedBy: UserProfile.include(),
        items: OrderItem.includeList(),
      ),
    );
  }

  Future<Order> getOrderById(Session session, int id) async {
    Order? order = await Order.db.findFirstRow(
      session,
      where: (t) => t.id.equals(id),
      include: Order.include(
        passedBy: UserProfile.include(),
        closedby: UserProfile.include(),
        btable: BTable.include(),
        items: OrderItem.includeList(
          include: OrderItem.include(
            passedBy: UserProfile.include(),
            preparedBy: UserProfile.include(),
            payedTo: UserProfile.include(),
          ),
        ),
      ),
    );
    if (order == null) {
      throw Exception('Order with id or ref $id not found');
    }
    return order;
  }

  /// Create a new order
  /// Parameters:
  /// - [order]: The order to be created
  /// Returns:
  /// - The created order
  /// Only employer allowed for this endpoint
  /// Employer should have access to order creation
  Future<Order> createOrder(
    Session session,
    Order order,
  ) async {
    /// Only employer allowed for this endpoint
    await AuthorizationsHelpers().requiredScopes(session, ["employer"]);

    /// Employer should have access to order creation
    final employer = await EmployerEndpoint().getEmployerByIdentifier(
      session,
      session.authenticated!.authUserId,
    );
    if (employer.access != null && employer.access?.orderCreation == false) {
      throw AppException(
        errorType: ExceptionType.Forbidden,
        message: 'You don\'t have access to create orders',
      );
    }

    /// Order must have at least one item
    if (order.items == null || order.items!.isEmpty) {
      throw AppException(
        errorType: ExceptionType.BadRequest,
        message: 'Order must have at least one item',
      );
    }

    /// Check if table allows multi orders
    final building = await BuildingEndpoint().getBuildingById(
      session,
      order.btable!.buildingId!,
    );
    if (building.tableMultiOrder == false) {
      final currentTableStatus = await checkTableHaveOrder(
        session,
        order.btableId,
      );
      if (currentTableStatus == TableStatus.occupied) {
        throw AppException(
          errorType: ExceptionType.Forbidden,
          message: 'Table ${order.btable!.number} already has an ongoing order',
        );
      }
    }

    /// Create the order
    order.status = OrderStatus.progress;
    Order orderCreated = await Order.db.insertRow(
      session,
      order,
    );
    List<OrderItem> itemsCreated = await OrderItem.db.insert(
      session,
      order.items!,
    );

    /// Attach items to the order
    await Order.db.attach.items(session, orderCreated, itemsCreated);

    /// Send message to notify about the new order
    await session.messages.postMessage(
      'order_created-${order.btable!.buildingId!}',
      orderCreated,
    );
    return orderCreated;
  }

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
    session.log('Appending items to order ${orderItems.toString()}');

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
    Order order = await getOrderById(session, orderId);
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

    /// Send message to notify about the order update
    await session.messages.postMessage(
      'order_appendItems-${order.btable!.buildingId!}',
      order,
    );
    return orderUpdated;
  }

  Future<Order> payItem(
    Session session,
    int orderId,
    int orderItemId,
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
    Order order = await getOrderById(session, orderId);
    OrderItem? item = order.items!.firstWhere(
      (item) => item.id == orderItemId,
    );
    item.itemStatus = OrderItemStatus.payed;
    item.payedToId = employer.userProfileId;
    item.payedAt = DateTime.now();
    item.updatedAt = DateTime.now();
    if (!order.items!.any((i) => i.itemStatus != OrderItemStatus.payed)) {
      order.status = OrderStatus.payed;
      order.closedbyId = employer.userProfileId;
    }
    order.updatedAt = DateTime.now();
    await OrderItem.db.updateRow(session, item);
    await session.messages.postMessage(
      'order_updated-$buildingId',
      order,
    );
    return await Order.db.updateRow(session, order);
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
    Order order = await getOrderById(session, orderId);
    for (OrderItem item in order.items!) {
      if (item.itemStatus != OrderItemStatus.payed) {
        item.itemStatus = OrderItemStatus.payed;
        item.payedToId = employer.userProfileId;
        item.payedAt = DateTime.now();
        item.updatedAt = DateTime.now();
        await OrderItem.db.updateRow(session, item);
      }
    }

    /// mark order as payed
    order.status = OrderStatus.payed;
    order.updatedAt = DateTime.now();
    order.closedbyId = employer.userProfileId;
    await session.messages.postMessage(
      'order_updated-$buildingId',
      order,
    );
    return await Order.db.updateRow(session, order);
  }

  Future<Order> getOrderCurrOfTable(Session session, int tableId) async {
    await AuthorizationsHelpers().requiredScopes(session, [
      "owner",
      "employer",
    ]);
    Order? order = await Order.db.findFirstRow(
      session,
      where: (t) =>
          t.btableId.equals(tableId) & t.status.equals(OrderStatus.progress),
      include: Order.include(
        passedBy: UserProfile.include(),
        btable: BTable.include(),
        items: OrderItem.includeList(
          include: OrderItem.include(
            passedBy: UserProfile.include(),
            preparedBy: UserProfile.include(),
            payedTo: UserProfile.include(),
          ),
        ),
      ),
    );
    if (order == null) {
      throw AppException(
        errorType: ExceptionType.NotFound,
        message:
            'No existing order in progress for table ${order?.btable?.number}',
      );
    }
    return order;
  }

  Future<List<Order>> getOrdersOfTable(
    Session session,
    int tableId,
    OrderStatus? orderStatus,
  ) async {
    await AuthorizationsHelpers().requiredScopes(session, [
      "owner",
      "employer",
    ]);
    return await Order.db.find(
      session,
      where: (t) {
        if (orderStatus != null) {
          return t.btableId.equals(tableId) & t.status.equals(orderStatus);
        }
        return t.btableId.equals(tableId);
      },
      include: Order.include(
        passedBy: UserProfile.include(),
        btable: BTable.include(),
        items: OrderItem.includeList(),
      ),
    );
  }

  @doNotGenerate
  Future<TableStatus> checkTableHaveOrder(Session session, int tableId) async {
    Order? order = await Order.db.findFirstRow(
      session,
      where: (t) =>
          t.btableId.equals(tableId) & t.status.equals(OrderStatus.progress),
    );
    if (order != null && order.status == OrderStatus.progress) {
      return TableStatus.occupied;
    }
    return TableStatus.available;
  }

  Stream<Order> streamCreateOrder(Session session, int buildingId) async* {
    Stream<Order> msgStream = session.messages.createStream<Order>(
      'order_created-$buildingId',
    );
    await for (var message in msgStream) {
      yield message;
    }
  }

  Stream<Order> streamAppendItemsOrder(Session session, int buildingId) async* {
    Stream<Order> msgStream = session.messages.createStream<Order>(
      'order_appendItems-$buildingId',
    );
    await for (var message in msgStream) {
      yield message;
    }
  }

  Stream<Order> streamUpdateOrder(Session session, int buildingId) async* {
    Stream<Order> msgStream = session.messages.createStream<Order>(
      'order_updated-$buildingId',
    );
    await for (var message in msgStream) {
      yield message;
    }
  }
}
