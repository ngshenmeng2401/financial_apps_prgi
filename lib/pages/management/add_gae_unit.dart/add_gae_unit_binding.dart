import 'package:financial_apps_prgi/pages/management/add_gae_unit.dart/add_gae_controller.dart';
import 'package:get/get.dart';

class AddGAEUnitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddGAEUnitController>(
      () => AddGAEUnitController(),
    );
  }
}