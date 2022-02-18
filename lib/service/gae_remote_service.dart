import 'package:financial_apps_prgi/model/gae_unit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GAERemoteService{

  static var client = http.Client();

  static Future<String?> addGAEUnit(String code, String unit , String qty, String profitRate, String fee, String percentage, String type) async {

    var response = await client.post(

      Uri.parse('https://javathree99.com/s271059/financial_prgi/php/add_gae_unit.php'), 
      body: {
      "code" : code,
      "unit" : unit,
      "qty" : qty,
      "profitRate" : profitRate,
      "fee" : fee,
      "percentage" : percentage,
      "type" : type,
    });
    print(response.body);
    if (response.statusCode == 200) {
      var resp = response.body;
      Get.snackbar(
        "Add_Successful","",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.message, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );
      return resp;
    } else {
      // show error message
      Get.snackbar(
        "Register_Failed","Please check your input value..",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );
      return null;
      // throw Exception("Error");
    }
  }

  static Future<String?> editGAEUnit(String code, String unit , String qty, String profitRate, String fee, String percentage) async {

    var response = await client.post(

      Uri.parse('https://javathree99.com/s271059/financial_prgi/php/edit_gae_unit.php'), 
      body: {
      "code" : code,
      "unit" : unit,
      "qty" : qty,
      "profitRate" : profitRate,
      "fee" : fee,
      "percentage" : percentage,
    });
    print(response.body);
    if (response.statusCode == 200) {
      var resp = response.body;
      if (response.body == "failed"){

         Get.snackbar(
          "Edit_Failed","Please check your input value.",
          backgroundColor: Colors.white60,
          colorText: Colors.black,
          icon: const Icon(Icons.error, color: Colors.black),
          snackPosition: SnackPosition.TOP,  
        );
      }else{

        Get.snackbar(
          "Edit Success","",
          backgroundColor: Colors.white60,
          colorText: Colors.black,
          icon: const Icon(Icons.message, color: Colors.black),
          snackPosition: SnackPosition.TOP,  
        );
      }
      return resp;
    } else {

      //show error message
      return null;
    }
  }

  static Future<String?> deleteGAEUnit(String code) async {

    print(code);

    var response = await client.post(

      Uri.parse('https://javathree99.com/s271059/financial_prgi/php/delete_gae_unit.php'), 
      body: {
      "code" : code,
    });
    print(response.body);
    if (response.statusCode == 200) {
      var resp = response.body;
      if (response.body == "failed"){

         Get.snackbar(
          "Delete_Failed","Please try again.",
          backgroundColor: Colors.white60,
          colorText: Colors.black,
          icon: const Icon(Icons.error, color: Colors.black),
          snackPosition: SnackPosition.TOP,  
        );
      }else{

        Get.snackbar(
          "Delete Success","",
          backgroundColor: Colors.white60,
          colorText: Colors.black,
          icon: const Icon(Icons.message, color: Colors.black),
          snackPosition: SnackPosition.TOP,  
        );
      }
      return resp;
    } else {
      //show error message
      return null;
    }
  }

  static Future<String?> tradeGAEUnit(String code, String action) async {

    print(code);
    print(action);

    var response = await client.post(

      Uri.parse('https://javathree99.com/s271059/financial_prgi/php/trade_gae_unit.php'), 
      body: {
      "code" : code,
      "action" : action,
    });
    print(response.body);
    if (response.statusCode == 200) {
      var resp = response.body;
      if (response.body == "failed"){

         Get.snackbar(
          "Failed","Please try again.",
          backgroundColor: Colors.white60,
          colorText: Colors.black,
          icon: const Icon(Icons.error, color: Colors.black),
          snackPosition: SnackPosition.TOP,  
        );
      }else{

        Get.snackbar(
          "Success","",
          backgroundColor: Colors.white60,
          colorText: Colors.black,
          icon: const Icon(Icons.message, color: Colors.black),
          snackPosition: SnackPosition.TOP,  
        );
      }
      return resp;
    } else {
      //show error message
      return null;
    }
  }

  static Future<List<GaEunit>?> fetchGAEUnits(String code, String action, String sortValue) async {

    print(code);
    print(action);
    print(sortValue);

    var response =
      await client.post(
        Uri.parse("https://javathree99.com/s271059/financial_prgi/php/load_gae_unit.php"),
        body: {
        "code" : code,
        "action" : action,
        "sortValue" : sortValue,
      });
    if (response.statusCode == 200) {
      if (response.body == "nodata") {
        return null;
      } else {
        var jsonString = response.body;
        // print("IN remoteservices" + jsonString);
        return gaEunitFromJson(jsonString);
      }
    } else {
      //show error message
      // return null;
      throw Exception('Failed to load Categories from API');
    }
  }
}