import 'package:get/get.dart';

import '../middleware/logged_middleware.dart';
import '../modules/access/bindings/access_binding.dart';
import '../modules/access/bindings/access_form_binding.dart';
import '../modules/access/views/access_form_view.dart';
import '../modules/access/views/access_view.dart';
import '../modules/article/bindings/article_binding.dart';
import '../modules/article/bindings/article_form_binding.dart';
import '../modules/article/views/article_form_view.dart';
import '../modules/article/views/article_view.dart';
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
import '../modules/cash_register/bindings/cash_register_binding.dart';
import '../modules/cash_register/bindings/cash_register_stats_binding.dart';
import '../modules/cash_register/views/cash_register_stats_view.dart';
import '../modules/cash_register/views/cash_register_view.dart';
import '../modules/categorie/bindings/categorie_binding.dart';
import '../modules/categorie/bindings/categorie_form_binding.dart';
import '../modules/categorie/views/categorie_form_view.dart';
import '../modules/categorie/views/categorie_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/employer/bindings/employer_binding.dart';
import '../modules/employer/bindings/employer_details_binding.dart';
import '../modules/employer/bindings/form_employer_binding.dart';
import '../modules/employer/views/employer_details_view.dart';
import '../modules/employer/views/employer_view.dart';
import '../modules/employer/views/form_employer_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/ingredient/bindings/ingredient_binding.dart';
import '../modules/ingredient/bindings/ingredient_form_binding.dart';
import '../modules/ingredient/views/ingredient_form_view.dart';
import '../modules/ingredient/views/ingredient_view.dart';
import '../modules/inventory/bindings/inventory_binding.dart';
import '../modules/inventory/views/inventory_view.dart';
import '../modules/notfound/bindings/notfound_binding.dart';
import '../modules/notfound/views/notfound_view.dart';
import '../modules/order/bindings/order_binding.dart';
import '../modules/order/bindings/order_details_binding.dart';
import '../modules/order/bindings/pass_order_binding.dart';
import '../modules/order/views/order_details_view.dart';
import '../modules/order/views/order_view.dart';
import '../modules/order/views/pass_order_view.dart';
import '../modules/qrscan/bindings/qrscan_binding.dart';
import '../modules/qrscan/views/qrscan_view.dart';
import '../modules/statistics/bindings/statistics_binding.dart';
import '../modules/statistics/views/statistics_view.dart';
import '../modules/tables/bindings/form_table_binding.dart';
import '../modules/tables/bindings/tables_binding.dart';
import '../modules/tables/views/form_table_view.dart';
import '../modules/tables/views/tables_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  /// Admin and Employer have access to this routes
  static final routes = [
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
      name: _Paths.CASH_REGISTER,
      page: () => const CashRegisterView(),
      binding: CashRegisterBinding(),
      children: [
        GetPage(
          name: "${_Paths.CASH_REGISTER_STATS}/:id",
          page: () => const CashRegisterStatsView(),
          binding: CashRegisterStatsBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.QRSCAN,
      page: () => const QrscanView(),
      binding: QrscanBinding(),
    ),
  ];

  static final adminRoutes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      bindings: [
        DashboardBinding(),
        InventoryBinding(),
        HomeBinding(),
        TablesBinding(),
        OrderBinding(),
      ],
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.BUILDINGS,
      page: () => const BuildingsView(),
      binding: BuildingsBinding(),
    ),
    GetPage(
      name: _Paths.FORM_BUILDING,
      page: () => const FormBuildingView(),
      binding: FormBuildingBinding(),
    ),
    GetPage(
      name: _Paths.TABLES,
      page: () => const TablesView(),
      binding: TablesBinding(),
    ),
    GetPage(
      name: _Paths.FORM_TABLE,
      page: () => const FormTableView(),
      binding: FormTableBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLE,
      page: () => const ArticleView(),
      binding: ArticleBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLE_FORM,
      page: () => const ArticleFormView(),
      binding: ArticleFormBinding(),
    ),
    GetPage(
      name: _Paths.INVENTORY,
      page: () => const InventoryView(),
      binding: InventoryBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORIE,
      page: () => const CategorieView(),
      binding: CategorieBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORIE_FORM,
      page: () => const CategorieFormView(),
      binding: CategorieFormBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYER,
      page: () => const EmployerView(),
      binding: EmployerBinding(),
      children: [
        GetPage(
          name: "${_Paths.EMPLOYER_DETAILS}/:id",
          page: () => const EmployerDetailsView(),
          binding: EmployerDetailsBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.FORM_EMPLOYER,
      page: () => const FormEmployerView(),
      binding: FormEmployerBinding(),
    ),
    GetPage(
      name: _Paths.ACCESS,
      page: () => const AccessView(),
      binding: AccessBinding(),
    ),
    GetPage(
      name: _Paths.ACCESS_FORM,
      page: () => const AccessFormView(),
      binding: AccessFormBinding(),
    ),
    GetPage(
      name: _Paths.INGREDIENT,
      page: () => const IngredientView(),
      binding: IngredientBinding(),
    ),
    GetPage(
      name: _Paths.INGREDIENT_FORM,
      page: () => const IngredientFormView(),
      binding: IngredientFormBinding(),
    ),
    GetPage(
      name: _Paths.STATISTICS,
      page: () => const StatisticsView(),
      binding: StatisticsBinding(),
    ),
  ];

  static final employerRoutes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      bindings: [
        DashboardBinding(),
        HomeBinding(),
        TablesBinding(),
        OrderBinding(),
      ],
    ),
    GetPage(
      name: _Paths.TABLES,
      page: () => const TablesView(),
      binding: TablesBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLE,
      page: () => const ArticleView(),
      binding: ArticleBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORIE,
      page: () => const CategorieView(),
      binding: CategorieBinding(),
    ),
  ];

  static final unknownRoute = GetPage(
    name: _Paths.NOTFOUND,
    page: () => const NotfoundView(),
    binding: NotfoundBinding(),
  );
}
