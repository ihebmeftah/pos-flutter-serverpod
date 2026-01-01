import 'package:get/get.dart';
import 'package:pos_flutter/config/serverpod_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

class AuthentificationController extends GetxController with StateMixin {
  final EmailAuthController emailAuthController = .new(
    client: ServerpodClient.instance,
  );
 
}
