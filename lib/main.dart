import 'package:financial_apps_prgi/route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final appData = GetStorage();
void main() async{
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Financial App PRGI',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.Splash,
      getPages: AppPages.routes,
      unknownRoute: AppPages.unknownRoute,
      // theme: isDarkMode ? CustomDarkTheme.darktheme : CustomLightTheme.lighttheme,
      // darkTheme: CustomDarkTheme.darktheme,
      // themeMode: ThemeMode.system,
      // locale: Locale(selectLanguage),
      // fallbackLocale: TranslationService.fallbackLocale,
      // translations: TranslationService(),
    );
  }
}