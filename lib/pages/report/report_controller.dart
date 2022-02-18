import 'package:financial_apps_prgi/model/gae_unit.dart';
import 'package:financial_apps_prgi/pages/report/onhand_unit_tile.dart';
import 'package:financial_apps_prgi/route/app_pages.dart';
import 'package:financial_apps_prgi/service/gae_remote_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageReportController extends GetxController{

  final onhandUnitList = ["0001", "0002", "0003", "0004", "0005"];
  final soldUnitList = ["0006", "0007", "0008", "0009", "0010", "0011"];

  var isLoading = true.obs;
  var statusMsj = "Loading".obs;
  var onhandGAEUnittList = <GaEunit>[].obs;
  var soldGAEUnittList = <GaEunit>[].obs;

  @override
  void onInit() {
    loadOnhandGAEUnits();
    loadSoldGAEUnit();
    super.onInit();
  }

  Future<void> loadOnhandGAEUnits() async {

    try {
      isLoading(true);
      var gaeunit = await GAERemoteService.fetchGAEUnits("1", "onhand", "a");
      if (gaeunit != null) {
        onhandGAEUnittList.assignAll(gaeunit);
      } else {
        // gaeUnittList = null;
        statusMsj("No_data".tr);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> loadSoldGAEUnit() async {

    try {
      isLoading(true);
      var gaeunit = await GAERemoteService.fetchGAEUnits("1", "sold", "a");
      if (gaeunit != null) {
        soldGAEUnittList.assignAll(gaeunit);
      } else {
        // gaeUnittList = null;
        statusMsj("No_any_sold_unit".tr);
      }
    } finally {
      isLoading(false);
    }
  }

  void loadAllList(){

    loadOnhandGAEUnits();
    loadSoldGAEUnit();
  }

  void soldGAEUnitDialog(GaEunit gaeunit){
    
    Get.defaultDialog(
      // title: "Are_you_sure".tr,
      title: "Are_you_sure",
      content: Column(
        children: const [
          Padding(padding: EdgeInsets.all(0)),
        ],
      ),
      textConfirm: "Yes".tr,
      textCancel: "No".tr,
      onConfirm: () {
        Get.back();
        GAERemoteService.tradeGAEUnit(gaeunit.gaeCode!, "sold");
        onhandGAEUnittList.clear();
        soldGAEUnittList.clear();
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    ).then((value) => loadAllList());
  }

  void unsoldGAEUnitDialog(GaEunit gaeunit){
    
    Get.defaultDialog(
      // title: "Are_you_sure".tr,
      title: "Are_you_sure",
      content: Column(
        children: const [
          Padding(padding: EdgeInsets.all(0)),
        ],
      ),
      textConfirm: "Yes".tr,
      textCancel: "No".tr,
      onConfirm: () {
        Get.back();
        GAERemoteService.tradeGAEUnit(gaeunit.gaeCode!, "unsold");
        onhandGAEUnittList.clear();
        soldGAEUnittList.clear();
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    ).then((value) => loadAllList());
  }

  void navigateSettingsPage() {

    Get.toNamed(AppRoutes.SettingsPage);
  }
}