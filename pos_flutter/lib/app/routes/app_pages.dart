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
import '../modules/buildings/views/buildings_view.dart';
import '../modules/buildings/views/form_building_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/index/bindings/index_binding.dart';
import '../modules/index/views/index_view.dart';
import '../modules/order/bindings/order_binding.dart';
import '../modules/order/bindings/pass_order_binding.dart';
import '../modules/order/order_details/bindings/order_details_binding.dart';
import '../modules/order/order_details/views/order_details_view.dart';
import '../modules/order/views/order_view.dart';
import '../modules/order/views/pass_order_view.dart';
import '../modules/tables/bindings/tables_binding.dart';
import '../modules/tables/bindings/form_table_binding.dart';
import '../modules/tables/views/form_table_view.dart';
import '../modules/tables/views/tables_view.dart';

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
    GetPage(
      name: _Paths.INDEX,
      page: () => const IndexView(),
      bindings: [
        IndexBinding(),
        HomeBinding(),
        TablesBinding(),
        OrderBinding(),
      ],
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => const OrderView(),
      binding: OrderBinding(),
      children: [
        GetPage(
          name: _Paths.PASS_ORDER,
          page: () => const PassOrderView(),
          binding: PassOrderBinding(),
        ),
        GetPage(
          name: "${_Paths.ORDER_DETAILS}/:id",
          page: () => const OrderDetailsView(),
          binding: OrderDetailsBinding(),
        ),
        GetPage(
          name: '${_Paths.TABLES}/:tableId',
          page: () => const OrderView(),
          binding: OrderBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.TABLES,
      page: () => const TablesView(),
      binding: TablesBinding(),
      children: [
        GetPage(
          name: _Paths.FORM_TABLE,
          page: () => const FormTableView(),
          binding: FormTableBinding(),
        ),
      ],
    ),
  ];
}
