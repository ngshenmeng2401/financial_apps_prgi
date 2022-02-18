import 'package:financial_apps_prgi/pages/home/home_controller.dart';
import 'package:financial_apps_prgi/pages/management/management_controller.dart';
import 'package:financial_apps_prgi/pages/report/report_controller.dart';
import 'package:financial_apps_prgi/widgets/bottom_navigation_bar_controller.dart';
import 'package:get/get.dart';

class BottomNavigationBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationBarController>(() => BottomNavigationBarController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ManagementController>(() => ManagementController(), fenix: true);
    Get.lazyPut<ManageReportController>(() => ManageReportController(), fenix: true);
  }
}