import 'package:pos_server/src/article/article_endpoint.dart';
import 'package:pos_server/src/auth/email_idp_endpoint.dart';
import 'package:pos_server/src/buildings/building_endpoint.dart';
import 'package:pos_server/src/buildings_tables/building_tables_endpoint.dart';
import 'package:pos_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart' hide Order;
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

  Future<Order> createOrder(
    Session session,
    Order order,
  ) async {
    Building building = await BuildingEndpoint().getBuildingById(
      session,
      order.btable!.buildingId!,
    );
    await BuildingTablesEndpoint().getTableById(
      session,
      order.btable!.id!,
      building.id!,
    );

    if (order.items == null || order.items!.isEmpty) {
      throw Exception('Order must have at least one item');
    }
    List<OrderItem> orderItem = [];
    for (OrderItem item in order.items!) {
      await ArticleEndpoint().getArticleById(
        session,
        item.article.id!,
        building.id!,
      );
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
      'order_created-${building.id!}',
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
    Order order = await getOrderById(session, orderId);
    OrderItem? item = order.items!.firstWhere(
      (item) => item.id == orderItemId,
    );
    item.payed = true;
    if (!order.items!.any((i) => i.payed == false)) {
      order.status = OrderStatus.payed;
      final UserProfile userProfile = await EmailIdpEndpoint().getUserProfile(
        session,
      );
      order.closedbyId = userProfile.id!;
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
    final profile = await EmailIdpEndpoint().getUserProfile(session);
    Order order = await getOrderById(session, orderId);
    for (OrderItem item in order.items!) {
      if (!item.payed) {
        item.payed = true;
        await OrderItem.db.updateRow(session, item);
      }
    }
    order.status = OrderStatus.payed;
    order.updatedAt = DateTime.now();
    order.closedbyId = profile.id!;
    await session.messages.postMessage(
      'order_updated-$buildingId',
      order,
    );
    return await Order.db.updateRow(session, order);
  }

  Future<Order> getOrderCurrOfTable(Session session, int tableId) async {
    BTable table = await BuildingTablesEndpoint().getTableById(
      session,
      tableId,
    );
    Order? order = await Order.db.findFirstRow(
      session,
      where: (t) =>
          t.btableId.equals(table.id) & t.status.equals(OrderStatus.progress),
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
      throw Exception('No active order for table id $tableId');
    }
    return order;
  }

  Future<List<Order>> getOrdersOfTable(
    Session session,
    int tableId,
    OrderStatus? orderStatus,
  ) async {
    BTable table = await BuildingTablesEndpoint().getTableById(
      session,
      tableId,
    );
    if (orderStatus != null) {
      return await Order.db.find(
        session,
        where: (t) =>
            t.btableId.equals(table.id) & t.status.equals(orderStatus),
        include: Order.include(
          btable: BTable.include(),
          items: OrderItem.includeList(),
        ),
      );
    }
    return await Order.db.find(
      session,
      where: (t) => t.btableId.equals(table.id),
      include: Order.include(
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
