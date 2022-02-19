import 'package:financial_apps_prgi/service/gae_remote_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditGAEUnitController extends GetxController{

  late TextEditingController codeController = TextEditingController();
  late TextEditingController unitController = TextEditingController();
  late TextEditingController qtyController = TextEditingController();
  late TextEditingController rateController = TextEditingController();
  late TextEditingController feeController = TextEditingController();
  late TextEditingController percentageController = TextEditingController();

  var selectedDate = DateTime.now().obs;
  var selectedTime = TimeOfDay.now().obs;

  final List<String> unitType = ["GAE 5x","GAE 10x"].obs;
  var selectUnitType = "".obs;

  void chooseDate() async {

    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        builder: (context, child) {
          return Theme(data: ThemeData.dark(), child: child!);
        },
        firstDate: DateTime(2000),
        lastDate: DateTime(2024),
        //initialEntryMode: DatePickerEntryMode.input,
        // initialDatePickerMode: DatePickerMode.year,
        helpText: 'Select DOB',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter valid date range',
        fieldLabelText: 'DOB',
        fieldHintText: 'Month/Date/Year',
        // selectableDayPredicate: disableDate
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }

  bool disableDate(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(const Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(const Duration(days: 5))))) {
      return true;
    }
    return false;
  }

  void chooseTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: Get.context!,
        initialTime: selectedTime.value,
        builder: (context, child) {
          return Theme(data: ThemeData.dark(), child: child!);
        },
        initialEntryMode: TimePickerEntryMode.input,
        helpText: 'Select Departure Time',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorInvalidText: 'Provide valid time',
        hourLabelText: 'Select Hour',
        minuteLabelText: 'Select Minute');
    if (pickedTime != null && pickedTime != selectedTime.value) {
      selectedTime.value = pickedTime;
    }
  }

  set selectRadioButton(value) => selectUnitType.value = value;
  get selectRadioButton => selectUnitType.value;

  void clickUnitType(value){
    
    selectUnitType.value = value;
    print(selectUnitType);
  }

  void editGAEUnitDialog(String gaeCode, String unit, String qty, String fee, String percentage, String type){

    print(qty);

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
        editGAEUnit(gaeCode, unit, qty, fee, percentage, type);
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  
  void editGAEUnit(String currentCode, String currentUnit, String currentQty, String currentFee, String currentPercentage, String type){

    String newCode = codeController.text.toString();
    String newUnit = unitController.text.toString();
    String newQty = qtyController.text.toString();
    String newProfitRate = rateController.text.toString();
    String newFee = feeController.text.toString();
    String newPercentage = percentageController.text.toString();
    String newType;

    if(newCode.isEmpty && newUnit.isEmpty && newQty.isEmpty && newProfitRate.isEmpty && newFee.isEmpty && newPercentage.isEmpty){

      Get.snackbar(
        "Error".tr,"No any update".tr,
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );
    }else{

      newCode = (codeController.text.toString() == "") ? currentCode : newCode;
      newUnit = (unitController.text.toString() == "") ? currentUnit : newUnit;
      newQty = (qtyController.text.toString() == "") ? currentQty : newQty;
      newFee = (feeController.text.toString() == "") ? currentFee : newFee;
      newPercentage = (percentageController.text.toString() == "") ? currentPercentage : newPercentage;
      newType = selectUnitType.value;

      // print(newCode);
      // print(newUnit);
      // print(newQty);
      // print(newProfitRate);
      // print(newFee);
      // print(newPercentage);

      GAERemoteService.editGAEUnit(newCode, newUnit, newQty, newFee, newPercentage, newType);
    }
  }
}