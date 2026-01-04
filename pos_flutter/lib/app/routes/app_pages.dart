import 'package:get/get.dart';

import '../middleware/logged_middleware.dart';
import '../modules/authentification/bindings/authentification_binding.dart';
import '../modules/authentification/bindings/login_binding.dart';
import '../modules/authentification/bindings/register_binding.dart';
import '../modules/authentification/views/authentification_view.dart';
import '../modules/authentification/views/login_view.dart';
import '../modules/authentification/views/register_view.dart';
import '../modules/buildings/bindings/buildings_binding.dart';
import '../modules/buildings/bindings/form_building_binding.dart';
import '../modules/buildings/views/form_building_view.dart';
import '../modules/buildings/views/buildings_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTHENTIFICATION,
      page: () => const AuthentificationView(),
      middlewares: [LoggedMiddleware()],
      binding: AuthentificationBinding(),
      children: [
        GetPage(
          name: _Paths.REGISTER,
          page: () => const RegisterView(),
          binding: RegisterBinding(),
        ),
        GetPage(
          name: _Paths.LOGIN,
          page: () => const LoginView(),
          binding: LoginBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.BUILDINGS,
      page: () => const BuildingsView(),
      binding: BuildingsBinding(),
      children: [
        GetPage(
          name: _Paths.FORM_BUILDING,
          page: () => const FormBuildingView(),
          binding: FormBuildingBinding(),
        ),
      ],
    ),
  ];
}
