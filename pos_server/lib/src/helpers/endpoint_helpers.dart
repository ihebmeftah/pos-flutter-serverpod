import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import '../generated/protocol.dart';

/// Helper class containing reusable validation and verification methods
/// for endpoints to reduce code duplication
class EndpointHelpers {
  /// Verifies building exists and optionally validates ownership.
  /// Returns building if valid, throws NotFound or Unauthorized exception otherwise.
  static Future<Building> verifyBuildingAccess(
    Session session,
    UuidValue buildingId, {
    bool checkOwnership = false,
  }) async {
    final building = await Building.db.findById(session, buildingId);
    if (building == null) {
      throw AppException(
        message: 'Building with id $buildingId not found',
        errorType: ExceptionType.NotFound,
      );
    }

    // Verify user owns building if ownership check is requested
    if (checkOwnership &&
        building.authUserId != session.authenticated?.authUserId) {
      throw AppException(
        message:
            'You are not authorized to perform this action on this building',
        errorType: ExceptionType.Unauthorized,
      );
    }

    return building;
  }

  /// Validates article name uniqueness within a building.
  /// Throws Conflict exception if name already exists.
  static Future<void> checkArticleNameExists(
    Session session,
    String name,
    UuidValue buildingId,
  ) async {
    final exists = await Article.db.findFirstRow(
      session,
      where: (a) =>
          a.name.ilike(name) & a.categorie.buildingId.equals(buildingId),
    );
    if (exists != null) {
      throw AppException(
        errorType: ExceptionType.Conflict,
        message: 'Article with name $name already exists',
      );
    }
  }

  /// Validates categorie name uniqueness within a building.
  /// Throws Conflict exception if name already exists.
  static Future<void> checkCategorieNameExists(
    Session session,
    String name,
    UuidValue buildingId,
  ) async {
    final exists = await Categorie.db.findFirstRow(
      session,
      where: (c) => c.name.ilike(name) & c.buildingId.equals(buildingId),
    );
    if (exists != null) {
      throw AppException(
        errorType: ExceptionType.Conflict,
        message: 'Categorie with name $name already exists',
      );
    }
  }

  /// Validates ingredient name uniqueness within a building.
  /// Throws Conflict exception if name already exists.
  static Future<void> checkIngredientNameExists(
    Session session,
    String name,
    UuidValue buildingId,
  ) async {
    final exists = await Ingredient.db.findFirstRow(
      session,
      where: (i) => i.name.equals(name) & i.buildingId.equals(buildingId),
    );
    if (exists != null) {
      throw AppException(
        errorType: ExceptionType.Conflict,
        message: 'Ingredient $name already exists',
      );
    }
  }

  /// Fetches employer by authUserId with all related data preloaded.
  /// Includes: userProfile, authUser, building, and access permissions.
  static Future<Employer> getEmployerByAuthUserId(
    Session session,
    UuidValue authUserId,
  ) async {
    final employer = await Employer.db.findFirstRow(
      session,
      include: Employer.include(
        userProfile: UserProfile.include(authUser: AuthUser.include()),
        building: Building.include(),
        access: Access.include(),
      ),
      where: (t) => t.userProfile.authUserId.equals(authUserId),
    );
    if (employer == null) {
      throw AppException(
        errorType: ExceptionType.NotFound,
        message: 'Employer not found',
      );
    }
    return employer;
  }

  /// Validates employer has required access permission.
  /// Uses callback function to check specific permission on employer's access.
  static void verifyEmployerAccess(
    Employer employer,
    bool Function(Access) accessCheck,
    String permissionName,
  ) {
    if (employer.access == null || !accessCheck(employer.access!)) {
      throw AppException(
        errorType: ExceptionType.Forbidden,
        message: 'You don\'t have access to $permissionName',
      );
    }
  }

  /// Validates employer belongs to the specified building.
  /// Throws Forbidden exception if employer is from a different building.
  static void verifyEmployerBuilding(
    Employer employer,
    UuidValue buildingId,
  ) {
    if (employer.buildingId != buildingId) {
      throw AppException(
        errorType: ExceptionType.Forbidden,
        message: 'You don\'t have access to this building',
      );
    }
  }

  /// Retrieves current active cash register for a building.
  /// Returns null if building doesn't use cash registers, throws NotFound if required but missing.
  static Future<CashRegister?> getCurrentCashRegister(
    Session session,
    Building building,
  ) async {
    if (!building.orderWithCashRegister) return null;

    final cashRegister = await CashRegister.db.findFirstRow(
      session,
      where: (t) => t.buildingId.equals(building.id) & t.isClosed.equals(false),
    );

    if (cashRegister == null) {
      throw AppException(
        errorType: ExceptionType.NotFound,
        message:
            'No opened Cash register found for this building, please contact your administrator',
      );
    }

    return cashRegister;
  }

  /// Validates order item status transitions in strict mode.
  /// Enforces: progress → picked → ready → served workflow.
  static void verifyStrictModeWorkflow(
    Building building,
    OrderItem item,
    OrderItemStatus newStatus,
  ) {
    if (!building.strictMode) return;

    // Validate status progression follows required workflow
    switch (newStatus) {
      case OrderItemStatus.picked:
        if (item.itemStatus != OrderItemStatus.progress) {
          throw AppException(
            errorType: ExceptionType.Forbidden,
            message:
                'Item ${item.article.name} must be in progress status before picking in strict mode',
          );
        }
        break;
      case OrderItemStatus.ready:
        if (item.itemStatus != OrderItemStatus.picked) {
          throw AppException(
            errorType: ExceptionType.Forbidden,
            message:
                'Item ${item.article.name} must be picked before marking as ready in strict mode',
          );
        }
        break;
      case OrderItemStatus.served:
        if (item.itemStatus != OrderItemStatus.ready) {
          throw AppException(
            errorType: ExceptionType.Forbidden,
            message:
                'Item ${item.article.name} must be ready before delivering in strict mode',
          );
        }
        break;
      default:
        break;
    }
  }
}
