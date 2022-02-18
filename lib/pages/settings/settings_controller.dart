import 'package:financial_apps_prgi/route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController{

  late ThemeData themeData;
  final appData = GetStorage();
  late bool isDarkMode;
  var selectTheme;

  @override
  void onInit() {
    loadTheme();
    super.onInit();
  }

  void navigateLanguagePage(){
    // Get.toNamed(AppRoutes.AddStudentDetailsPage);
  }

  void navigateThemePage(){
    Get.toNamed(AppRoutes.ThemePage);
  }

  void chooseLightTheme(value) {

    isDarkMode = value;
    // Get.changeTheme(isDarkMode ? CustomDarkTheme.darktheme : CustomLightTheme.lighttheme);
    storeRadioButton(value);
    print(isDarkMode);
    update();
  }


  void storeRadioButton(value) {

    appData.write('isDarkMode', isDarkMode);
    // print(value);
  }

  void loadTheme(){

    isDarkMode = appData.read('isDarkMode') ?? false; // null check for first time running this
    print(isDarkMode);
  }
}