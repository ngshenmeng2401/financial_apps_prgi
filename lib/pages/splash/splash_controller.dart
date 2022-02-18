import 'dart:async';

import 'package:financial_apps_prgi/route/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{

  @override
  void onReady() {
    super.onReady();
    loading();
  }

  Future<void> loading() async {

    Timer(const Duration(seconds: 3), () {

      Get.offAllNamed(AppRoutes.BottomNavigation);
    }
    
    );
  }
}