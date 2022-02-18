import 'package:financial_apps_prgi/model/gae_unit.dart';
import 'package:financial_apps_prgi/pages/management/edit_gae_unit/edit_gae_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditGAEUnitView extends GetView<EditGAEUnitController> {

  final editGAEController = Get.put(EditGAEUnitController());
  final GaEunit gaEunit;
  EditGAEUnitView(this.gaEunit);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit GAE Unit"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: editGAEController.codeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Code'.tr,
                  labelStyle: const TextStyle(
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Date:".tr,
                    style: const TextStyle(
                      fontSize: 16,),),
                  Obx(
                    () => Text(
                      DateFormat("dd-MM-yyyy")
                          .format(controller.selectedDate.value)
                          .toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  MaterialButton(
                  shape:RoundedRectangleBorder(
                    borderRadius:BorderRadius.circular(20),
                  ),
                  height: screenHeight/25,
                  child: Text('Select Date'.tr,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white),
                  ),
                  onPressed: (){
                    controller.chooseDate();
                  },
                  color: Colors.black,
                ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Time:".tr,
                    style: const TextStyle(
                      fontSize: 16,),),
                  Obx(
                    () => Text("${controller.selectedTime.value.hour.toString()}:${controller.selectedTime.value.minute.toString()}",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  MaterialButton(
                  shape:RoundedRectangleBorder(
                    borderRadius:BorderRadius.circular(20),
                  ),
                  height: screenHeight/25,
                  child: Text('Select Time'.tr,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white),
                  ),
                  onPressed: (){
                    controller.chooseTime();
                  },
                  color: Colors.black,
                ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                controller: editGAEController.unitController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Unit'.tr,
                  labelStyle: const TextStyle(
                  )
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: editGAEController.qtyController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Quantity(g)'.tr,
                  labelStyle: const TextStyle(
                  )
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: editGAEController.rateController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Profit Rate'.tr,
                  labelStyle: const TextStyle(
                  )
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: editGAEController.feeController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Management Fee'.tr,
                  labelStyle: const TextStyle(
                  )
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: editGAEController.percentageController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Target Percentage:'.tr,
                  labelStyle: const TextStyle(
                  )
                ),
              ),
              const SizedBox(height: 15),
              Text("Type of GAE unit: ".tr, 
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 16,
                )),
              const SizedBox(height: 5),
              Obx(() => ListTile(
                title: Text("GAE 5x".tr),
                trailing: Radio(
                  value: controller.unitType[0],
                  groupValue: controller.selectRadioButton, 
                  onChanged: (value) {
                    controller.clickUnitType(value);
                  }
                ))),
              const SizedBox(height: 5),
              Obx(() => ListTile(
                title: Text("GAE 10x".tr),
                trailing: Radio(
                  value: controller.unitType[1],
                  groupValue: controller.selectRadioButton, 
                  onChanged: (value) {
                    controller.clickUnitType(value);
                  }
                ))),
              const SizedBox(height: 15),
              MaterialButton(
                shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(20),
                ),
                minWidth: screenWidth/1,
                height: screenHeight/18,
                child: Text('Update'.tr,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white),
                ),
                onPressed: (){
                  editGAEController.editGAEUnitDialog(
                    gaEunit.gaeCode!,
                    gaEunit.unit!,
                    gaEunit.qty!,
                    gaEunit.rate!,
                    gaEunit.fee!,
                    gaEunit.targetPercentage!,
                  );
                },
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}