import 'package:financial_apps_prgi/pages/report/onhand_unit_tile.dart';
import 'package:financial_apps_prgi/pages/report/report_controller.dart';
import 'package:financial_apps_prgi/pages/report/sold_unit_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportView extends GetView<ManageReportController> {

  final reportController = Get.put(ManageReportController());

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Report".tr),
        actions: [
          IconButton(
            onPressed: (){
              reportController.navigateSettingsPage();
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ExpansionTile(
                title: Text("Unit On Hand".tr),
                children: [
                  Container(
                    height: screenHeight/2.5,
                    child: Obx(() {
                      if(controller.connectionStatus.value == 1){
                        if (controller.isLoading.value) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircularProgressIndicator(
                                  strokeWidth: 2,
                                  // color: Colors.red[200],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  controller.statusMsj.toString().tr,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          );
                        } else if (controller.onhandGAEUnittList.isEmpty) {
                          return Center(
                            child: Text(
                            controller.statusMsj.toString(),
                            style: const TextStyle(fontSize: 20),
                          ));
                        } else {
                          return Container(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: ListView.builder(
                            itemCount: reportController.onhandGAEUnittList.length, 
                            itemBuilder: (context, index) {
                              return OnHandUnitTile(index, reportController.onhandGAEUnittList[index]);
                            }, )
                          );
                        }
                      }else{
                        return Center(
                          child: Text("No Internet Connection".tr,
                            style: const TextStyle(fontSize: 20),),
                        );
                      }
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              ExpansionTile(
                title: Text("Sold Unit".tr),
                children: [
                  Container(
                    height: screenHeight/2.5,
                    child: Obx(() {
                      if(controller.connectionStatus.value == 1){
                        if (controller.isLoading.value) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircularProgressIndicator(
                                  strokeWidth: 2,
                                  // color: Colors.red[200],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  controller.statusMsj.toString().tr,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          );
                        } else if (controller.soldGAEUnittList.isEmpty) {
                          return Center(
                            child: Text(
                            controller.statusMsj.toString(),
                            style: const TextStyle(fontSize: 20),
                          ));
                        } else {
                          return Container(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: ListView.builder(
                            itemCount: reportController.soldGAEUnittList.length, 
                            itemBuilder: (context, index) {
                              return SoldUnitTile(index, reportController.soldGAEUnittList[index]);
                            }, )
                          );
                        }
                      }else{
                        return Center(
                          child: Text("No Internet Connection".tr,
                            style: const TextStyle(fontSize: 20),),
                        );
                      }
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}