import 'package:financial_apps_prgi/pages/management/gae_unit_tile.dart';
import 'package:financial_apps_prgi/pages/management/management_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManagementView extends GetView<ManagementController> {
  ManagementView({Key? key}) : super(key: key);

  final managementController = Get.put(ManagementController());

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Management".tr),
        actions: [
          IconButton(
            onPressed: (){
              managementController.sortGAEUnitDialog();
            }, 
            icon: const Icon(Icons.list)),
          IconButton(
            onPressed: (){
              managementController.navigateSettingsPage();
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: screenWidth/1.1,
                margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.yellowAccent,)
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: TextField(
                        controller: managementController.searchGAEController,
                        onChanged: (value) {
                          managementController.checkTextField();
                        },
                        decoration: InputDecoration(
                          hintText: "Enter_GAE_Code".tr,
                          border: InputBorder.none,
                          hintStyle: const TextStyle(fontSize: 18),
                        ),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Obx(() => IconButton(
                        onPressed: () {
                          managementController.clearTextField();
                        },
                        icon: managementController.isSearching.value == true
                            ? const Icon(Icons.clear)
                            : const Icon(
                                Icons.clear,
                                color: Colors.transparent,),
                      )),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          managementController.searchGAEUnit();
                        }, 
                        icon: const Icon(Icons.search)),
                    ),
                  ],
                ),
              ),
              Container(
                height: screenHeight/1.4,
                child: Obx(() {
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
                  } else if (controller.gaeUnittList.isEmpty) {
                    return Center(
                      child: Text(
                      controller.statusMsj.toString(),
                      style: const TextStyle(fontSize: 20),
                    ));
                  } else {
                    return Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: ListView.builder(
                      itemCount: managementController.gaeUnittList.length, 
                      itemBuilder: (context, index) {
                        return GAEUnitTIle(index, managementController.gaeUnittList[index]);
                      }, )
                    );
                  }
                }),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: () {
        managementController.navigateAddGAEView();
      },
      child: const Icon(Icons.add),
      ),
    );
  }
}