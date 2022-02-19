import 'package:financial_apps_prgi/route/app_pages.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController{

  @override
  void onInit() {
    super.onInit();
  }

  void navigateLanguagePage(){
    Get.toNamed(AppRoutes.LanguagesPage);
  }

  void navigateThemePage(){
    Get.toNamed(AppRoutes.ThemePage);
  }
}