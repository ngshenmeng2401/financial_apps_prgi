import 'package:financial_apps_prgi/pages/report/report_controller.dart';
import 'package:get/get.dart';

class ManageReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageReportController>(
      () => ManageReportController(),
    );
  }
}