import 'package:pos_server/src/article/article_endpoint.dart';
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
    int? buildingId,
    OrderStatus? orderStatus,
  ) async {
    if (orderStatus != null) {
      return await Order.db.find(
        session,
        orderByList: (k) => [
          s.Order(column: k.createdAt, orderDescending: true),
          s.Order(column: k.status, orderDescending: true),
        ],
        where: (t) =>
            t.btable.buildingId.equals(buildingId) &
            t.status.equals(orderStatus),
        include: Order.include(
          btable: BTable.include(),
          passedBy: UserProfile.include(),
          items: OrderItem.includeList(),
        ),
      );
    }
    return await Order.db.find(
      session,
      orderByList: (k) => [
        s.Order(column: k.createdAt, orderDescending: true),
        s.Order(column: k.status, orderDescending: true),
      ],
      where: (t) => t.btable.buildingId.equals(buildingId),
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
    await AuthorizationsHelpers().requiredScopes(session, ["employer"]);
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
    if (order.items == null || order.items!.isEmpty) {
      throw AppException(
        errorType: ExceptionType.BadRequest,
        message: 'Order must have at least one item',
      );
    }
    await checkTableHaveOrder(session, order.btableId);
    List<OrderItem> orderItem = [];
    for (OrderItem item in order.items!) {
      await ArticleEndpoint().getArticleById(
        session,
        item.article.id!,
        order.btable!.buildingId!,
      );
      item.passedById = employer.userProfileId;
      orderItem.add(item);
    }
    order.status = OrderStatus.progress;
    Order orderCreated = await Order.db.insertRow(
      session,
      order,
    );
    List<OrderItem> itemsCreated = await OrderItem.db.insert(
      session,
      orderItem,
    );
    await Order.db.attach.items(session, orderCreated, itemsCreated);
    await session.messages.postMessage(
      'order_created-${order.btable!.buildingId!}',
      orderCreated,
    );
    return orderCreated;
  }

  Future<Order> payItem(
    Session session,
    int orderId,
    int orderItemId,
    int buildingId,
  ) async {
    await AuthorizationsHelpers().requiredScopes(session, ["employer"]);
    Order order = await getOrderById(session, orderId);
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
    OrderItem? item = order.items!.firstWhere(
      (item) => item.id == orderItemId,
    );
    item.payed = true;
    if (!order.items!.any((i) => i.payed == false)) {
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
    await AuthorizationsHelpers().requiredScopes(session, ["employer"]);
    Order order = await getOrderById(session, orderId);
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
    for (OrderItem item in order.items!) {
      if (!item.payed) {
        item.payed = true;
        await OrderItem.db.updateRow(session, item);
      }
    }
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
      "admin",
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
      "admin",
      "employer",
    ]);
    if (orderStatus != null) {
      return await Order.db.find(
        session,
        where: (t) => t.btableId.equals(tableId) & t.status.equals(orderStatus),
        include: Order.include(
          btable: BTable.include(),
          passedBy: UserProfile.include(),
          items: OrderItem.includeList(),
        ),
      );
    }
    return await Order.db.find(
      session,
      where: (t) => t.btableId.equals(tableId),
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

  Stream<Order> streamUpdateOrder(Session session, int buildingId) async* {
    Stream<Order> msgStream = session.messages.createStream<Order>(
      'order_updated-$buildingId',
    );
    await for (var message in msgStream) {
      yield message;
    }
  }
}
