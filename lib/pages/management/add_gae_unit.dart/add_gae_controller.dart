import 'package:financial_apps_prgi/service/gae_remote_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddGAEUnitController extends GetxController{

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

  void addGAEUnitDialog(String type){

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
        addGAEUnit(type);
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  
  void addGAEUnit(String type){

    String code = codeController.text.toString();
    String unit = unitController.text.toString();
    String qty = qtyController.text.toString();
    String profitRate = rateController.text.toString();
    String fee = feeController.text.toString();
    String percentage = percentageController.text.toString();
    
    if(code.isEmpty && unit.isEmpty && qty.isEmpty && profitRate.isEmpty && fee.isEmpty && percentage.isEmpty && type.isEmpty){

      Get.snackbar(
        "Error","Please complete all textfield and button.",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );
    }else if (code.isEmpty){

      Get.snackbar(
        "Error","Code is empty",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );
    }else if (unit.isEmpty){

      Get.snackbar(
        "Error","Unit is empty",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );
    }else if (qty.isEmpty){

      Get.snackbar(
        "Error","Quantity is empty",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );
    }else if (profitRate.isEmpty){

      Get.snackbar(
        "Error","Profit Rate is empty",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );
    }else if (fee.isEmpty){

      Get.snackbar(
        "Error","Management Fee is empty",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );
    }else if (percentage.isEmpty){

      Get.snackbar(
        "Error","Target Percentage is empty",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );
    }else if (type.isEmpty){

      Get.snackbar(
        "Error","Please select type of GAE unit",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );
    }else{

      GAERemoteService.addGAEUnit(code, unit, qty, profitRate, fee, percentage, type);
    }
  }
}