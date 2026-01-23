import 'package:pos_server/src/article/article_endpoint.dart';
import 'package:pos_server/src/buildings/building_endpoint.dart';
import 'package:pos_server/src/cash_register/cash_register_endpoint.dart';
import 'package:pos_server/src/employer/employer_endpoint.dart';
import 'package:pos_server/src/generated/protocol.dart';
import '../helpers/session_extensions.dart';
import 'package:serverpod/serverpod.dart' hide Order;
import 'package:serverpod/serverpod.dart' as s;
import 'package:serverpod_auth_idp_server/core.dart';

import '../ingredient/ingredient_endpoint.dart';

class OrderEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Get all orders for a building
  /// Parameters:
  /// - [buildingId]: The id of the building
  /// - [orderStatus]: The status of the orders to filter by (optional)
  /// Returns:
  /// - A list of orders for the building
  /// Only owner and employers are allowed for this endpoint
  Future<List<Order>> getOrdersByBuilingId(
    Session session,
    UuidValue buildingId, [
    OrderStatus? orderStatus,
    UuidValue? cashRegisterId,
  ]) async {
    session.authorizedTo(['owner', 'employer']);
    Employer? employer;
    CashRegister? currentCashRegister;

    if (session.isEmployer) {
      employer = await EmployerEndpoint().getEmployerByIdentifier(
        session,
        session.authenticated!.authUserId,
      );
      if (employer.building!.orderWithCashRegister &&
          !employer.access!.consultAllOrders) {
        currentCashRegister = await CashRegisterEndpoint()
            .getCurrentCashRegister(
              session,
              employer.building!,
            );
      }
    }

    return await Order.db.find(
      session,
      orderByList: (k) => [
        s.Order(column: k.createdAt, orderDescending: true),
        s.Order(column: k.status, orderDescending: true),
      ],
      where: (t) {
        // Start with base building filter
        var condition = t.btable.buildingId.equals(buildingId);

        // Add order status filter if provided
        if (orderStatus != null) {
          condition = condition & t.status.equals(orderStatus);
        }

        // Add cash register filter if applicable
        if (currentCashRegister != null || cashRegisterId != null) {
          condition =
              condition &
              t.cashRegisterId.equals(
                currentCashRegister?.id ?? cashRegisterId,
              );
        }

        // Add user filter for non-owners without consultAllOrders permission
        final hasFullAccess =
            session.isOwner || (employer?.access?.consultAllOrders == true);

        if (!hasFullAccess) {
          final currentUserFilter =
              t.passedBy.authUserId.equals(session.authenticated!.authUserId) |
              t.closedby.authUserId.equals(session.authenticated!.authUserId) |
              t.items.any(
                (item) => item.passedBy.authUserId.equals(
                  session.authenticated!.authUserId,
                ),
              );
          condition = condition & currentUserFilter;
        }

        return condition;
      },
      include: Order.include(
        btable: BTable.include(),
        passedBy: UserProfile.include(),
        closedby: UserProfile.include(),
        items: OrderItem.includeList(),
      ),
    );
  }

  /// Get order by id
  /// Parameters:
  /// - [id]: The id of the order
  /// Returns:
  /// - The order with the given id
  Future<Order> getOrderById(Session session, UuidValue id) async {
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
      throw AppException(
        errorType: ExceptionType.NotFound,
        message: 'Order with id or ref $id not found',
      );
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
    CreateOrderDto orderDto,
  ) async {
    // Only employer allowed for this endpoint
    session.authorizedTo(['employer']);
    // CHeck buidling
    final building = await BuildingEndpoint().getBuildingById(
      session,
      orderDto.buildingId,
    );
    CashRegister? currentCashRegister;
    if (building.orderWithCashRegister) {
      currentCashRegister = await CashRegisterEndpoint().getCurrentCashRegister(
        session,
        building,
      );
    }
    // Check if table multi order is allowed
    if (building.tableMultiOrder == false) {
      final tableOrder = await OrderEndpoint().getOrderCurrOfTable(
        session,
        orderDto.btableId,
      );
      if (tableOrder != null) {
        throw AppException(
          errorType: ExceptionType.Forbidden,
          message:
              'Table ${tableOrder.btable!.number} already has an ongoing order',
        );
      }
    }
    // Employer should have access to order creation
    final employer = await EmployerEndpoint().getEmployerByIdentifier(
      session,
      session.authenticated!.authUserId,
    );
    // Check if employer belongs to the building
    if (building.id != employer.buildingId) {
      throw AppException(
        errorType: ExceptionType.Forbidden,
        message: 'You don\'t have access to create orders for this building',
      );
    }
    // Check if employer has access to order creation
    if (employer.access == null || employer.access?.orderCreation == false) {
      throw AppException(
        errorType: ExceptionType.Forbidden,
        message: 'You don\'t have access to create orders',
      );
    }
    // Order must have at least one item
    if (orderDto.itemsIds.isEmpty) {
      throw AppException(
        errorType: ExceptionType.BadRequest,
        message: 'Order must have at least one item',
      );
    }
    // Check if articles exist and belong to the building
    final articles = <Article>[];
    for (final articleId in orderDto.itemsIds) {
      final existArticle = await ArticleEndpoint().getArticleById(
        session,
        articleId,
        building.id,
      );
      articles.add(existArticle);
    }
    return await session.db.transaction((trs) async {
      // Create the order
      Order newOrder = Order(
        cashRegister: currentCashRegister,
        cashRegisterId: currentCashRegister?.id,
        btableId: orderDto.btableId,
        passedById: employer.userProfileId,
      );
      newOrder = await Order.db.insertRow(
        session,
        newOrder,
        transaction: trs,
      );
      // Create the order items
      List<OrderItem> newOrderItems = articles.map((article) {
        return OrderItem(
          orderId: newOrder.id,
          article: article,
          passedById: employer.userProfileId,
        );
      }).toList();
      newOrderItems = await OrderItem.db.insert(
        session,
        newOrderItems,
        transaction: trs,
      );
      newOrder.items = newOrderItems;
      // Attach items to the order
      await Order.db.attach.items(
        session,
        newOrder,
        newOrderItems,
        transaction: trs,
      );
      // Decrement the stock of the articles
      for (final article in articles) {
        // Count how many times this article appears in the order
        final articleCount = newOrderItems
            .where((item) => item.article.id == article.id)
            .length;
        for (final compo in article.composition ?? []) {
          await IngredientEndpoint().decrementStockInOrder(
            session,
            compo.ingredientId,
            building.id,
            compo.quantity * articleCount,
            transaction: trs,
          );
        }
      }
      return newOrder;
    });
  }

  @doNotGenerate
  Future<Order> makeOrderPayed(
    Session session,
    Order order,
    UuidValue userProfileId,
    UuidValue buildingId,
  ) async {
    order.status = OrderStatus.payed;
    order.closedbyId = userProfileId;
    order.updatedAt = DateTime.now();
    return await Order.db.updateRow(
      session,
      order,
      columns: (t) => [
        t.status,
        t.closedbyId,
        t.updatedAt,
      ],
    );
  }

  Future<Order?> getOrderCurrOfTable(Session session, UuidValue tableId) async {
    session.authorizedTo(["owner", "employer"]);
    return await Order.db.findFirstRow(
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
  }

  Future<List<Order>> getOrdersOfTable(
    Session session,
    UuidValue tableId,
    OrderStatus? orderStatus,
  ) async {
    session.authorizedTo(["owner", "employer"]);
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
}
