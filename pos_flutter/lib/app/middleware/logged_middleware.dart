import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import '../../config/serverpod_client.dart';
import '../routes/app_pages.dart';

class LoggedMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (!ServerpodClient.instance.auth.isAuthenticated) return null;
    if (ServerpodClient.instance.auth.authInfo!.scopeNames.contains(
      'employer',
    )) {
      return RouteSettings(name: Routes.INDEX);
    }
    return RouteSettings(name: Routes.BUILDINGS);
  }
}
