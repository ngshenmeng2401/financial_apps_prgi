import 'package:financial_apps_prgi/pages/home/home_view.dart';
import 'package:financial_apps_prgi/pages/management/add_gae_unit.dart/add_gae_unit_binding.dart';
import 'package:financial_apps_prgi/pages/management/add_gae_unit.dart/add_gae_unit_view.dart';
import 'package:financial_apps_prgi/pages/management/edit_gae_unit/edit_gae_unit_view.dart';
import 'package:financial_apps_prgi/pages/management/management_view.dart';
import 'package:financial_apps_prgi/pages/not_found_screen.dart';
import 'package:financial_apps_prgi/pages/report/report_view.dart';
import 'package:financial_apps_prgi/pages/settings/language_settings/language_view.dart';
import 'package:financial_apps_prgi/pages/settings/settings_view.dart';
import 'package:financial_apps_prgi/pages/settings/theme_settings/theme_view.dart';
import 'package:financial_apps_prgi/pages/splash/splash_binding.dart';
import 'package:financial_apps_prgi/pages/splash/splash_view.dart';
import 'package:financial_apps_prgi/widgets/bottom_navigation_bar.dart';
import 'package:financial_apps_prgi/widgets/bottom_navigation_bar_binding.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages{

  static final List<GetPage> routes = [
    
    GetPage(
      name: AppRoutes.Splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: AppRoutes.BottomNavigation,
      page: () => const BottomNavigationBarWidget(),
      binding: BottomNavigationBarBinding(),
    ),

    //Home
    GetPage(
      name: AppRoutes.HomePage,
      page: () => HomeView(),
    ),


    //Management

    GetPage(
      name: AppRoutes.ManagementPage,
      page: () => ManagementView(),
    ),

    GetPage(
      name: AppRoutes.AddGAEPage,
      page: () => AddGAEUnitView(),
      binding: AddGAEUnitBinding(),
    ),


    //Report

    GetPage(
      name: AppRoutes.ReportPage,
      page: () => ReportView(),
    ),

    //Settings

    GetPage(
      name: AppRoutes.SettingsPage,
      page: () => SettingsView(),
    ),

    GetPage(
      name: AppRoutes.LanguagesPage,
      page: () => const LanguageView(),
    ),

    GetPage(
      name: AppRoutes.ThemePage,
      page: () => const ThemeView(),
    ),
  ];

  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => const NotfoundScreen(),
  );
}