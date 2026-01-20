import 'package:pos_server/src/article/article_endpoint.dart';
import 'package:pos_server/src/buildings/building_endpoint.dart';
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
    UuidValue buildingId,
    OrderStatus? orderStatus,
  ) async {
    session.authorizedTo(['owner', 'employer']);
    Employer? employer;
    if (session.isEmployer) {
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

        // Employer ih has access to consult all orders or only his own orders
        if (session.isOwner || (employer?.access?.consultAllOrders == true)) {
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
    Order order,
  ) async {
    // Only employer allowed for this endpoint
    session.authorizedTo(['employer']);

    // Employer should have access to order creation
    final employer = await EmployerEndpoint().getEmployerByIdentifier(
      session,
      session.authenticated!.authUserId,
    );
    if (employer.access == null || employer.access?.orderCreation == false) {
      throw AppException(
        errorType: ExceptionType.Forbidden,
        message: 'You don\'t have access to create orders',
      );
    }

    // Order must have at least one item
    if (order.items == null || order.items!.isEmpty) {
      throw AppException(
        errorType: ExceptionType.BadRequest,
        message: 'Order must have at least one item',
      );
    }

    // Check if table allows multi orders
    final building = await BuildingEndpoint().getBuildingById(
      session,
      order.btable!.buildingId,
    );
    if (building.tableMultiOrder == false) {
      final tableOrder = await OrderEndpoint().getOrderCurrOfTable(
        session,
        order.btableId,
      );
      if (tableOrder != null) {
        throw AppException(
          errorType: ExceptionType.Forbidden,
          message: 'Table ${order.btable!.number} already has an ongoing order',
        );
      }
    }
    final articles = <Article>[];
    for (final item in order.items!) {
      final existArticle = await ArticleEndpoint().getArticleById(
        session,
        item.article.id,
      );
      articles.add(existArticle);
    }
    session.log(articles.length.toString());

    return await session.db.transaction((trs) async {
      // Create the order
      order.status = OrderStatus.progress;
      Order orderCreated = await Order.db.insertRow(
        session,
        order,
        transaction: trs,
      );
      List<OrderItem> itemsCreated = await OrderItem.db.insert(
        session,
        order.items!,
        transaction: trs,
      );

      // Attach items to the order
      await Order.db.attach.items(
        session,
        orderCreated,
        itemsCreated,
        transaction: trs,
      );

      /// dec the stock of the articles
      for (final article in articles) {
        // Count how many times this article appears in the order
        final articleCount = order.items!
            .where((item) => item.article.id == article.id)
            .length;
        for (final compo in article.composition ?? []) {
          await IngredientEndpoint().decrementStockInOrder(
            session,
            compo.ingredientId,
            compo.quantity * articleCount,
            transaction: trs,
          );
        }
      }
      return orderCreated;
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
