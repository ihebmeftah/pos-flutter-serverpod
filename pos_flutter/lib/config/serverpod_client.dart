import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/data/local/local_storage.dart';
import 'package:pos_flutter/app/routes/app_pages.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'app_config.dart';

class ServerpodClient extends GetxService {
  static Client get instance => Get.find<ServerpodClient>()._client;
  late Client _client;
  late String serverUrl;

  Future<ServerpodClient> initialize() async {
    const serverUrlFromEnv = String.fromEnvironment('SERVER_URL');
    final config = await AppConfig.loadConfig();
    serverUrl = serverUrlFromEnv.isEmpty
        ? config.apiUrl ?? 'http://$localhost:8080/'
        : serverUrlFromEnv;
    _client = Client('http://$localhost:8080/')
      ..connectivityMonitor = FlutterConnectivityMonitor()
      ..authSessionManager = FlutterAuthSessionManager();
    await _client.auth.initialize();
    _client.auth.authInfoListenable.addListener(() async {
      print("Auth info changed: ${_client.auth.isAuthenticated}");
      handleRoutePermission();
      if (!_client.auth.isAuthenticated) {
        Get.offAllNamed(Routes.AUTHENTIFICATION);
      } else if (_client.auth.isAuthenticated) {
        if (_client.auth.authInfo!.scopeNames.contains('employer')) {
          final employer = await _client.employer.getEmployerByIdentifier(
            _client.auth.authInfo!.authUserId,
          );
          await LocalStorage().saveBuilding(employer.building!);
          Get.offAllNamed(Routes.INDEX);
        } else {
          Get.offAllNamed(Routes.BUILDINGS);
        }
      }
    });
    handleRoutePermission();
    return this;
  }

  void handleRoutePermission() {
    if (_client.auth.isAuthenticated) {
      if (_client.auth.authInfo!.scopeNames.contains('employer')) {
        Get.routeTree.addRoutes(AppPages.employerRoutes);
      } else {
        Get.routeTree.addRoutes(AppPages.adminRoutes);
      }
    } else {
      Get.routeTree.routes.removeWhere(
        (route) =>
            AppPages.employerRoutes.contains(route) ||
            AppPages.adminRoutes.contains(route),
      );
    }
  }
}
