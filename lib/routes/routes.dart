import 'package:get/route_manager.dart';
import '../pages/login_page.dart';
import '../pages/register_login_page.dart';
import 'package:sappludable/pages/home_page.dart';
import 'package:sappludable/pages/menu_page.dart';
import '../pages/calculator_imc_page.dart';
import '../pages/foods_page.dart';
import '../pages/recipes_page.dart';
import '../pages/routines_page.dart';
import '../pages/user_profile_page.dart';
import '../pages/notifications_page.dart';
import '../pages/credits_page.dart';

routes() => [
  GetPage(name: "/homepage", page: () => HomePage()),
  GetPage(name: "/registerpage", page: () => RegisterLoginPage()),
  GetPage(name: "/loginpage", page: () => LoginPage()),
  GetPage(name: "/menupage", page: () => MenuPage(), transition: Transition.zoom),
  GetPage(name: "/userprofilepage", page: () => UserProfilePage(), transition: Transition.zoom),
  GetPage(name: "/imccalculatorpage", page: () => ImcCalculatorPage(), transition: Transition.zoom),
  GetPage(name: "/routinespage", page: () => RoutinesPage(), transition: Transition.zoom),
  GetPage(name: "/foodspage", page: () => FoodsPage(), transition: Transition.zoom),
  GetPage(name: "/recipespage", page: () => RecipesPage(), transition: Transition.zoom),
  GetPage(name: "/notificationspage", page: () => NotificationsPage(), transition: Transition.zoom),
  GetPage(name: "/creditspage", page: () => CreditsPage(), transition: Transition.zoom),
];