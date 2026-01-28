import 'package:serverpod/serverpod.dart';
import 'package:pos_server/src/generated/protocol.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

/// Database seeder to initialize the database with sample data
class DatabaseSeeder {
  /// Seeds the database with initial data
  static Future<void> seed(Session session) async {
    session.log('🌱 Starting database seeding...');

    try {
      // Check if data already exists
      final existingBuildings = await Building.db.find(session, limit: 1);
      if (existingBuildings.isNotEmpty) {
        session.log('⚠️  Database already seeded. Skipping...');
        return;
      }

      // Create 3 cafe owner accounts
      final owners = await _createOwners(session);
      session.log('✅ Created ${owners.length} cafe owners');

      // Create buildings with different configurations
      final buildings = await _createBuildings(session, owners);
      session.log('✅ Created ${buildings.length} buildings');

      // Create access permissions
      final accesses = await _createAccesses(session, buildings);
      session.log('✅ Created ${accesses.length} access permissions');

      // Create employers
      final employers = await _createEmployers(session, buildings, accesses);
      session.log('✅ Created ${employers.length} employers');

      // Create ingredients for each building
      final ingredients = await _createIngredients(session, buildings);
      session.log('✅ Created ${ingredients.length} ingredients');

      // Create categories
      final categories = await _createCategories(session, buildings);
      session.log('✅ Created ${categories.length} categories');

      // Create articles with compositions
      final articles = await _createArticles(session, categories, ingredients);
      session.log('✅ Created ${articles.length} articles');

      session.log('🎉 Database seeding completed successfully!');
    } catch (e, stackTrace) {
      session.log('❌ Error seeding database: $e');
      session.log('Stack trace: $stackTrace');
      rethrow;
    }
  }

  /// Creates 3 cafe owner user accounts
  static Future<List<AuthUserModel>> _createOwners(Session session) async {
    final owners = <AuthUserModel>[];

    final ownersData = [
      {
        'email': 'owner1@b1.com',
        'password': 'Owner123!',
        'userName': 'owner1',
        'fullName': 'John Dream',
      },
      {
        'email': 'owner2@b2.tn',
        'password': 'Owner123!',
        'userName': 'owner2',
        'fullName': 'Ahmed Zitouna',
      },
      {
        'email': 'owner3@b3.fr',
        'password': 'Owner123!',
        'userName': 'owner3',
        'fullName': 'Marie Dupont',
      },
    ];

    for (final data in ownersData) {
      final owner = await _createAuthUser(
        session,
        email: data['email']!,
        password: data['password']!,
        userName: data['userName']!,
        scopes: {Scope('owner')},
      );

      // Create user profile for owner
      final userProfile = UserProfile(
        userName: data['userName']!,
        authUserId: owner.id,
        email: data['email']!,
        fullName: data['fullName']!,
        createdAt: DateTime.now(),
      );
      await UserProfile.db.insertRow(session, userProfile);

      owners.add(owner);
    }

    return owners;
  }

  /// Helper to create authenticated user with email/password
  static Future<AuthUserModel> _createAuthUser(
    Session session, {
    required String email,
    required String password,
    required String userName,
    required Set<Scope> scopes,
  }) async {
    final emailIdp = AuthServices.instance.emailIdp;

    // Create auth user through AuthServices
    final authUser = await AuthServices.instance.authUsers.create(
      session,
      scopes: scopes,
    );

    // Create email authentication
    await emailIdp.admin.createEmailAuthentication(
      session,
      authUserId: authUser.id,
      email: email,
      password: password,
    );

    return authUser;
  }

  /// Creates buildings with different configurations (one per owner)
  static Future<List<Building>> _createBuildings(
    Session session,
    List<AuthUserModel> owners,
  ) async {
    final buildings = <Building>[];

    // Building 1: Flexible configuration
    final building1 = Building(
      name: 'Café Dream',
      address: '123 Main Street, New York, NY 10001',
      openingTime: DateTime(2024, 1, 1, 7, 0),
      closingTime: DateTime(2024, 1, 1, 22, 0),
      authUserId: owners[0].id,
      tableMultiOrder: true,
      orderWithCashRegister: true,
      cashRegisterLimitPerDay: 5,
      allowAppendingItemsToOrder: true,
      autoCloseOrdersAtClosingTime: true,
      strictMode: false,
      currencyCode: Currency.USD,
      lat: 40.7128,
      long: -74.0060,
    );
    buildings.add(await Building.db.insertRow(session, building1));

    // Building 2: Strict mode
    final building2 = Building(
      name: 'Café Zitouna',
      address: 'Avenue Habib Bourguiba, Tunis 1000',
      openingTime: DateTime(2024, 1, 1, 6, 0),
      closingTime: DateTime(2024, 1, 1, 23, 30),
      authUserId: owners[1].id,
      tableMultiOrder: false,
      orderWithCashRegister: true,
      cashRegisterLimitPerDay: 3,
      allowAppendingItemsToOrder: false,
      autoCloseOrdersAtClosingTime: true,
      strictMode: true,
      currencyCode: Currency.TND,
      lat: 36.8065,
      long: 10.1815,
    );
    buildings.add(await Building.db.insertRow(session, building2));

    // Building 3: No cash register
    final building3 = Building(
      name: 'Bistro Paris',
      address: '45 Avenue des Champs-Élysées, 75008 Paris',
      openingTime: DateTime(2024, 1, 1, 8, 0),
      closingTime: DateTime(2024, 1, 1, 23, 0),
      authUserId: owners[2].id,
      tableMultiOrder: true,
      orderWithCashRegister: false,
      cashRegisterLimitPerDay: null,
      allowAppendingItemsToOrder: true,
      autoCloseOrdersAtClosingTime: false,
      strictMode: false,
      currencyCode: Currency.EUR,
      lat: 48.8698,
      long: 2.3078,
    );
    buildings.add(await Building.db.insertRow(session, building3));

    return buildings;
  }

  /// Creates access permissions for each building
  static Future<List<Access>> _createAccesses(
    Session session,
    List<Building> buildings,
  ) async {
    final accesses = <Access>[];

    for (final building in buildings) {
      // Manager Access
      final managerAccess = Access(
        name: 'Manager',
        consultAllOrders: true,
        orderCreation: true,
        orderCreationNotif: true,
        orderPayment: true,
        orderItemsPayment: true,
        appendItems: true,
        preparation: true,
        serveOrder: true,
        cashRegisterManagement: true,
        buildingId: building.id,
      );
      accesses.add(await Access.db.insertRow(session, managerAccess));

      // Waiter Access
      final waiterAccess = Access(
        name: 'Waiter',
        consultAllOrders: true,
        orderCreation: true,
        orderCreationNotif: true,
        orderPayment: false,
        orderItemsPayment: false,
        appendItems: true,
        preparation: false,
        serveOrder: true,
        cashRegisterManagement: false,
        buildingId: building.id,
      );
      accesses.add(await Access.db.insertRow(session, waiterAccess));

      // Chef Access
      final chefAccess = Access(
        name: 'Chef',
        consultAllOrders: true,
        orderCreation: false,
        orderCreationNotif: false,
        orderPayment: false,
        orderItemsPayment: false,
        appendItems: false,
        preparation: true,
        serveOrder: false,
        cashRegisterManagement: false,
        buildingId: building.id,
      );
      accesses.add(await Access.db.insertRow(session, chefAccess));
    }

    return accesses;
  }

  /// Creates employers for each building
  static Future<List<Employer>> _createEmployers(
    Session session,
    List<Building> buildings,
    List<Access> accesses,
  ) async {
    final employers = <Employer>[];

    // Group accesses by building
    final accessByBuilding = <UuidValue, List<Access>>{};
    for (final access in accesses) {
      accessByBuilding.putIfAbsent(access.buildingId, () => []).add(access);
    }

    int counter = 1;
    for (final building in buildings) {
      final buildingAccesses = accessByBuilding[building.id] ?? [];

      // Create manager
      final managerAccess = buildingAccesses.firstWhere(
        (a) => a.name == 'Manager',
      );
      employers.add(
        await _createEmployer(
          session,
          firstName: 'John',
          lastName: 'Manager$counter',
          phone: 1234560000 + counter,
          email: 'manager$counter@example.com',
          buildingId: building.id,
          accessId: managerAccess.id,
        ),
      );

      // Create waiter
      final waiterAccess = buildingAccesses.firstWhere(
        (a) => a.name == 'Waiter',
      );
      employers.add(
        await _createEmployer(
          session,
          firstName: 'Emma',
          lastName: 'Waiter$counter',
          phone: 1234570000 + counter,
          email: 'waiter$counter@example.com',
          buildingId: building.id,
          accessId: waiterAccess.id,
        ),
      );

      // Create chef
      final chefAccess = buildingAccesses.firstWhere((a) => a.name == 'Chef');
      employers.add(
        await _createEmployer(
          session,
          firstName: 'Oliver',
          lastName: 'Chef$counter',
          phone: 1234580000 + counter,
          email: 'chef$counter@example.com',
          buildingId: building.id,
          accessId: chefAccess.id,
        ),
      );

      counter++;
    }

    return employers;
  }

  /// Helper to create an employer
  static Future<Employer> _createEmployer(
    Session session, {
    required String firstName,
    required String lastName,
    required int phone,
    required String email,
    required UuidValue buildingId,
    UuidValue? accessId,
  }) async {
    // Create auth user for employer
    final authUser = await _createAuthUser(
      session,
      email: email,
      password: 'Employee123!',
      userName: email.split('@').first,
      scopes: {Scope('employer')},
    );

    // Create user profile
    final userProfile = UserProfile(
      userName: email.split('@').first,
      authUserId: authUser.id,
      email: email,
      fullName: '$firstName $lastName',
      createdAt: DateTime.now(),
    );
    final savedProfile = await UserProfile.db.insertRow(session, userProfile);

    // Create employer
    final employer = Employer(
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      phoneVerified: true,
      persoEmail: email,
      persoEmailVerified: true,
      userProfileId: savedProfile.id!,
      buildingId: buildingId,
      accessId: accessId,
    );

    return await Employer.db.insertRow(session, employer);
  }

  /// Creates ingredients for each building
  static Future<List<Ingredient>> _createIngredients(
    Session session,
    List<Building> buildings,
  ) async {
    final ingredients = <Ingredient>[];

    final ingredientData = [
      {
        'name': 'Espresso Coffee',
        'unit': UnitsType.kg,
        'stock': 10.0,
        'threshold': 2.0,
      },
      {
        'name': 'Milk',
        'unit': UnitsType.liter,
        'stock': 50.0,
        'threshold': 10.0,
      },
      {'name': 'Sugar', 'unit': UnitsType.kg, 'stock': 20.0, 'threshold': 5.0},
      {
        'name': 'Bread',
        'unit': UnitsType.piece,
        'stock': 100.0,
        'threshold': 20.0,
      },
      {'name': 'Cheese', 'unit': UnitsType.kg, 'stock': 5.0, 'threshold': 1.0},
      {
        'name': 'Tomatoes',
        'unit': UnitsType.kg,
        'stock': 15.0,
        'threshold': 3.0,
      },
      {
        'name': 'Lettuce',
        'unit': UnitsType.piece,
        'stock': 30.0,
        'threshold': 10.0,
      },
      {
        'name': 'Chicken',
        'unit': UnitsType.kg,
        'stock': 20.0,
        'threshold': 5.0,
      },
      {
        'name': 'Chocolate',
        'unit': UnitsType.kg,
        'stock': 8.0,
        'threshold': 2.0,
      },
      {
        'name': 'Orange Juice',
        'unit': UnitsType.liter,
        'stock': 25.0,
        'threshold': 5.0,
      },
    ];

    for (final building in buildings) {
      for (final data in ingredientData) {
        final ingredient = Ingredient(
          name: data['name'] as String,
          unit: data['unit'] as UnitsType,
          currentStock: data['stock'] as double,
          thresholdStock: data['threshold'] as double,
          buildingId: building.id,
        );
        ingredients.add(await Ingredient.db.insertRow(session, ingredient));
      }
    }

    return ingredients;
  }

  /// Creates 5 categories per building
  static Future<List<Categorie>> _createCategories(
    Session session,
    List<Building> buildings,
  ) async {
    final categories = <Categorie>[];

    final categoryData = [
      {'name': 'Hot Beverages', 'desc': 'Coffee, tea, and hot drinks'},
      {'name': 'Cold Beverages', 'desc': 'Iced drinks and juices'},
      {'name': 'Sandwiches', 'desc': 'Fresh sandwiches'},
      {'name': 'Salads', 'desc': 'Healthy salads'},
      {'name': 'Desserts', 'desc': 'Sweet treats'},
    ];

    for (final building in buildings) {
      for (final data in categoryData) {
        final category = Categorie(
          name: data['name']!,
          description: data['desc'],
          buildingId: building.id,
        );
        categories.add(await Categorie.db.insertRow(session, category));
      }
    }

    return categories;
  }

  /// Creates 3 articles per category with compositions
  static Future<List<Article>> _createArticles(
    Session session,
    List<Categorie> categories,
    List<Ingredient> ingredients,
  ) async {
    final articles = <Article>[];

    // Group categories by building
    final categoriesByBuilding = <UuidValue, List<Categorie>>{};
    for (final category in categories) {
      categoriesByBuilding
          .putIfAbsent(category.buildingId, () => [])
          .add(category);
    }

    // Group ingredients by building
    final ingredientsByBuilding = <UuidValue, List<Ingredient>>{};
    for (final ingredient in ingredients) {
      ingredientsByBuilding
          .putIfAbsent(ingredient.buildingId, () => [])
          .add(ingredient);
    }

    for (final entry in categoriesByBuilding.entries) {
      final buildingId = entry.key;
      final buildingCategories = entry.value;
      final buildingIngredients = ingredientsByBuilding[buildingId] ?? [];

      for (final category in buildingCategories) {
        final categoryArticles = await _createArticlesForCategory(
          session,
          category,
          buildingIngredients,
        );
        articles.addAll(categoryArticles);
      }
    }

    return articles;
  }

  /// Helper to create 3 articles for a category
  static Future<List<Article>> _createArticlesForCategory(
    Session session,
    Categorie category,
    List<Ingredient> ingredients,
  ) async {
    final articles = <Article>[];

    // Define articles based on category
    List<Map<String, dynamic>> articleData;

    switch (category.name) {
      case 'Hot Beverages':
        articleData = [
          {'name': 'Espresso', 'price': 2.5},
          {'name': 'Cappuccino', 'price': 3.5},
          {'name': 'Latte', 'price': 4.0},
        ];
        break;
      case 'Cold Beverages':
        articleData = [
          {'name': 'Iced Coffee', 'price': 4.0},
          {'name': 'Orange Juice', 'price': 3.0},
          {'name': 'Lemonade', 'price': 2.5},
        ];
        break;
      case 'Sandwiches':
        articleData = [
          {'name': 'Club Sandwich', 'price': 8.0},
          {'name': 'Cheese Sandwich', 'price': 6.0},
          {'name': 'Chicken Sandwich', 'price': 7.5},
        ];
        break;
      case 'Salads':
        articleData = [
          {'name': 'Caesar Salad', 'price': 9.0},
          {'name': 'Greek Salad', 'price': 8.5},
          {'name': 'Chicken Salad', 'price': 10.0},
        ];
        break;
      case 'Desserts':
        articleData = [
          {'name': 'Chocolate Cake', 'price': 5.0},
          {'name': 'Cheesecake', 'price': 5.5},
          {'name': 'Brownie', 'price': 4.0},
        ];
        break;
      default:
        articleData = [
          {'name': '${category.name} Item 1', 'price': 5.0},
          {'name': '${category.name} Item 2', 'price': 6.0},
          {'name': '${category.name} Item 3', 'price': 7.0},
        ];
    }

    for (final data in articleData) {
      final article = Article(
        name: data['name'] as String,
        description: 'Delicious ${data['name']}',
        price: (data['price'] as num).toDouble(),
        categorieId: category.id,
      );
      final savedArticle = await Article.db.insertRow(session, article);
      articles.add(savedArticle);

      // Create composition for this article
      await _createArticleComposition(session, savedArticle, ingredients);
    }

    return articles;
  }

  /// Creates article composition (ingredients for an article)
  static Future<void> _createArticleComposition(
    Session session,
    Article article,
    List<Ingredient> ingredients,
  ) async {
    if (ingredients.isEmpty) return;

    // Get relevant ingredients based on article name with appropriate quantities
    List<Map<String, dynamic>> compositionData = [];
    final articleName = article.name.toLowerCase();

    // Espresso-based drinks
    if (articleName.contains('espresso')) {
      compositionData = [
        {'ingredient': 'Espresso Coffee', 'quantity': 0.02}, // 20g
      ];
    } else if (articleName.contains('cappuccino')) {
      compositionData = [
        {'ingredient': 'Espresso Coffee', 'quantity': 0.02}, // 20g
        {'ingredient': 'Milk', 'quantity': 0.15}, // 150ml
        {'ingredient': 'Sugar', 'quantity': 0.005}, // 5g
      ];
    } else if (articleName.contains('latte')) {
      compositionData = [
        {'ingredient': 'Espresso Coffee', 'quantity': 0.02}, // 20g
        {'ingredient': 'Milk', 'quantity': 0.25}, // 250ml
        {'ingredient': 'Sugar', 'quantity': 0.005}, // 5g
      ];
    } else if (articleName.contains('iced coffee')) {
      compositionData = [
        {'ingredient': 'Espresso Coffee', 'quantity': 0.025}, // 25g
        {'ingredient': 'Milk', 'quantity': 0.2}, // 200ml
        {'ingredient': 'Sugar', 'quantity': 0.01}, // 10g
      ];
    }
    // Juices
    else if (articleName.contains('orange juice')) {
      compositionData = [
        {'ingredient': 'Orange Juice', 'quantity': 0.3}, // 300ml
      ];
    } else if (articleName.contains('lemonade')) {
      compositionData = [
        {'ingredient': 'Sugar', 'quantity': 0.02}, // 20g
      ];
    }
    // Sandwiches
    else if (articleName.contains('club sandwich')) {
      compositionData = [
        {'ingredient': 'Bread', 'quantity': 3.0}, // 3 slices
        {'ingredient': 'Chicken', 'quantity': 0.1}, // 100g
        {'ingredient': 'Cheese', 'quantity': 0.03}, // 30g
        {'ingredient': 'Tomatoes', 'quantity': 0.05}, // 50g
        {'ingredient': 'Lettuce', 'quantity': 1.0}, // 1 piece
      ];
    } else if (articleName.contains('cheese sandwich')) {
      compositionData = [
        {'ingredient': 'Bread', 'quantity': 2.0}, // 2 slices
        {'ingredient': 'Cheese', 'quantity': 0.08}, // 80g
        {'ingredient': 'Tomatoes', 'quantity': 0.03}, // 30g
      ];
    } else if (articleName.contains('chicken sandwich')) {
      compositionData = [
        {'ingredient': 'Bread', 'quantity': 2.0}, // 2 slices
        {'ingredient': 'Chicken', 'quantity': 0.12}, // 120g
        {'ingredient': 'Lettuce', 'quantity': 1.0}, // 1 piece
        {'ingredient': 'Tomatoes', 'quantity': 0.04}, // 40g
      ];
    }
    // Salads
    else if (articleName.contains('caesar salad')) {
      compositionData = [
        {'ingredient': 'Lettuce', 'quantity': 2.0}, // 2 pieces
        {'ingredient': 'Chicken', 'quantity': 0.15}, // 150g
        {'ingredient': 'Cheese', 'quantity': 0.03}, // 30g
      ];
    } else if (articleName.contains('greek salad')) {
      compositionData = [
        {'ingredient': 'Lettuce', 'quantity': 2.0}, // 2 pieces
        {'ingredient': 'Tomatoes', 'quantity': 0.15}, // 150g
        {'ingredient': 'Cheese', 'quantity': 0.08}, // 80g
      ];
    } else if (articleName.contains('chicken salad')) {
      compositionData = [
        {'ingredient': 'Lettuce', 'quantity': 2.0}, // 2 pieces
        {'ingredient': 'Chicken', 'quantity': 0.2}, // 200g
        {'ingredient': 'Tomatoes', 'quantity': 0.08}, // 80g
      ];
    }
    // Desserts
    else if (articleName.contains('chocolate cake')) {
      compositionData = [
        {'ingredient': 'Chocolate', 'quantity': 0.1}, // 100g
        {'ingredient': 'Sugar', 'quantity': 0.05}, // 50g
        {'ingredient': 'Milk', 'quantity': 0.05}, // 50ml
      ];
    } else if (articleName.contains('cheesecake')) {
      compositionData = [
        {'ingredient': 'Cheese', 'quantity': 0.15}, // 150g
        {'ingredient': 'Sugar', 'quantity': 0.04}, // 40g
        {'ingredient': 'Milk', 'quantity': 0.05}, // 50ml
      ];
    } else if (articleName.contains('brownie')) {
      compositionData = [
        {'ingredient': 'Chocolate', 'quantity': 0.08}, // 80g
        {'ingredient': 'Sugar', 'quantity': 0.05}, // 50g
      ];
    }
    // Default for any other items
    else {
      compositionData = [
        {'ingredient': ingredients.first.name, 'quantity': 0.1},
        if (ingredients.length > 1)
          {'ingredient': ingredients[1].name, 'quantity': 0.05},
      ];
    }

    // Create compositions based on the data
    for (final data in compositionData) {
      final ingredientName = data['ingredient'] as String;
      final quantity = data['quantity'] as double;

      final ingredient = ingredients
          .where((i) => i.name == ingredientName)
          .firstOrNull;

      if (ingredient != null) {
        final composition = ArticleComposition(
          articleId: article.id,
          ingredientId: ingredient.id,
          quantity: quantity,
        );
        await ArticleComposition.db.insertRow(session, composition);
      }
    }
  }
}
