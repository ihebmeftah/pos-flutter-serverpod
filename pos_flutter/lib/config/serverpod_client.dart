import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
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
    _client.auth.authInfoListenable.addListener(() {
      print(_client.auth.authInfo?.scopeNames);
      if (!_client.auth.isAuthenticated) {
        Get.offAllNamed(Routes.AUTHENTIFICATION);
      }
    });
    print(_client.auth.authInfo?.scopeNames);
    return this;
  }

  Set<String>? get userScopes {
    return instance.auth.authInfo?.scopeNames;
  }
}
