import 'package:financial_apps_prgi/model/gae_unit.dart';
import 'package:financial_apps_prgi/pages/management/edit_gae_unit/edit_gae_unit_view.dart';
import 'package:financial_apps_prgi/pages/management/gae_info_view.dart';
import 'package:financial_apps_prgi/route/app_pages.dart';
import 'package:financial_apps_prgi/service/gae_remote_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManagementController extends GetxController{

  var isSearching = false.obs;
  late TextEditingController searchGAEController = TextEditingController();

  late String action;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;
  var gaeUnittList = <GaEunit>[].obs;

  List<String> sortingList = [
    "Default",
    "codeD",
    "unitA",
    "unitD",
    "qtyA",
    "qtyD",
  ];
  var selectSorting = "Default";
  
  @override
  void onInit() {
    loadGAEUnits();
    super.onInit();
  }

  Future<void> loadGAEUnits() async {

    try {
      isLoading(true);
      var gaeunit = await GAERemoteService.fetchGAEUnits("1", "load", "a");
      if (gaeunit != null) {
        gaeUnittList.assignAll(gaeunit);
      } else {
        // gaeUnittList = null;
        statusMsj("No_data".tr);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> searchGAEUnit() async {

    String searchGAE = searchGAEController.text.toString();
    action = "search";

    print(searchGAE);
    gaeUnittList.clear();

    try {
      isLoading(true);
      var gaeunit = await GAERemoteService.fetchGAEUnits(searchGAE, action, "a");
      if (gaeunit != null) {
        gaeUnittList.assignAll(gaeunit);
      } else {
        // gaeUnittList = null;
        statusMsj("No_data".tr);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> sortGAEUnit(String sortValue) async {

    action = "sort";
    gaeUnittList.clear();

    try {
      isLoading(true);
      var gaeunit = await GAERemoteService.fetchGAEUnits("1", action, sortValue);
      if (gaeunit != null) {
        gaeUnittList.assignAll(gaeunit);
      } else {
        // gaeUnittList = null;
        statusMsj("No_data".tr);
      }
    } finally {
      isLoading(false);
    }
  }

  void checkTextField(){

    searchGAEController.text.isEmpty
      ? isSearching.value = false
      : isSearching.value = true;
  }

  void clearTextField(){
    searchGAEController.clear();
    isSearching.value = false;
    // statusMsj("Search_Product".tr);
    loadGAEUnits();
  }

  void navigateAddGAEView(){

    Get.toNamed(AppRoutes.AddGAEPage)!.then((value) => loadGAEUnits());
  }

  void navigateInfoGAEView(GaEunit gaeunit){

    Get.to(() => GAEInfoVIew(gaeunit));
  }

  void navigateEditGAEView(GaEunit gaeunit){

    Get.to(() => EditGAEUnitView(gaeunit))!.then((value) => loadGAEUnits());
  }

  void deleteGAEUnitDialog(GaEunit gaeunit){

    Get.defaultDialog(
      title: "Are_you_sure".tr,
      content: Column(
        children: const [
          Padding(padding: EdgeInsets.all(0)),
        ],
      ),
      textConfirm: "Yes".tr,
      textCancel: "No".tr,
      onConfirm: () {
        Get.back();
        GAERemoteService.deleteGAEUnit(gaeunit.gaeCode!);
        loadGAEUnits();
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  void sortGAEUnitDialog(){

    Get.defaultDialog(
      
      title: "Sort by:".tr,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<ManagementController>(
            init: ManagementController(),
            builder: (controller) {
              return ListTile(
                title: Text("Default".tr),
                trailing: Radio(
                    value: sortingList[0],
                    groupValue: selectSorting,
                    onChanged: (value) {
                      clickSorting(value);
                    }),
              );
            },
          ),
          GetBuilder<ManagementController>(
            init: ManagementController(),
            builder: (controller) {
              return ListTile(
                title: Text("Code with Descending Order".tr),
                trailing: Radio(
                    value: sortingList[1],
                    groupValue: selectSorting,
                    onChanged: (value) {
                      clickSorting(value);
                    }),
              );
            },
          ),
          GetBuilder<ManagementController>(
            init: ManagementController(),
            builder: (controller) {
              return ListTile(
                title: Text("Unit with Ascending Order".tr),
                trailing: Radio(
                    value: sortingList[2],
                    groupValue: selectSorting,
                    onChanged: (value) {
                      clickSorting(value);
                    }),
              );
            },
          ),
          GetBuilder<ManagementController>(
            init: ManagementController(),
            builder: (controller) {
              return ListTile(
                title: Text("Unit with Descending Order".tr),
                trailing: Radio(
                    value: sortingList[3],
                    groupValue: selectSorting,
                    onChanged: (value) {
                      clickSorting(value);
                    }),
              );
            },
          ),
          GetBuilder<ManagementController>(
            init: ManagementController(),
            builder: (controller) {
              return ListTile(
                title: Text("Quantity with Ascending Order".tr),
                trailing: Radio(
                    value: sortingList[4],
                    groupValue: selectSorting,
                    onChanged: (value) {
                      clickSorting(value);
                    }),
              );
            },
          ),
          GetBuilder<ManagementController>(
            init: ManagementController(),
            builder: (controller) {
              return ListTile(
                title: Text("Quantity with Descending Order".tr),
                trailing: Radio(
                    value: sortingList[5],
                    groupValue: selectSorting,
                    onChanged: (value) {
                      clickSorting(value);
                    }),
              );
            },
          ),
        ],
      ),
      textConfirm: "Yes".tr,
      textCancel: "No".tr,
      onConfirm: () {
        Get.back();
        sortGAEUnit(selectSorting);
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  void clickSorting(value) {
    selectSorting = value;
    print(selectSorting);
    update();
  }

  void navigateSettingsPage() {

    Get.toNamed(AppRoutes.SettingsPage);
  }
}