import 'package:financial_apps_prgi/model/gold_price_model.dart';
import 'package:financial_apps_prgi/route/app_pages.dart';
import 'package:financial_apps_prgi/service/currency_remote_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  final goldPriceModel = <GoldPriceModel>[
    
    GoldPriceModel(
      fullName: "Gold Storage Account",
      shortName: "GSA",
      buyPrice: 267.21,
      sellPrice: 249.73,
      fee: 150,
      remark: "GCA (Gold Convert Account)",
    ),

    GoldPriceModel(
      fullName: "Gold Asset Enhance",
      shortName: "GAE5X",
      buyPrice: 259.72,
      sellPrice: 249.73,
      fee: 14.65,
      remark: "USD 25 per unit: MYR 104.65".tr,
    ),

    GoldPriceModel(
      fullName: "Gold Asset Enhance",
      shortName: "GAE10X",
      buyPrice: 257.22,
      sellPrice: 249.73,
      fee: 329.65,
      remark: "USD 250 per unit: MYR 1,046.50".tr,
    ),

    GoldPriceModel(
      fullName: "London Metal Exchange",
      shortName: "LME",
      buyPrice: 59.66,
      sellPrice: 0,
      fee: 0,
      remark: "FX rate: USD 1 = MYR 4.186",
    )
  ];

  late TextEditingController amountController = TextEditingController();
  var selectCurrencyBase = 'USD', selectCurrencyFinal = 'USD';
  var currencyList = [];
  late double result = 0;

  @override
  void onInit() {
    fetchCurrency();
    super.onInit();
  }

  void chooseCurrencyBase(value){
     selectCurrencyBase = value;
     print(selectCurrencyBase);
     update();
  }

  void chooseCurrencyFinal(value){
     selectCurrencyFinal = value;
     print(selectCurrencyFinal);
     update();
  }

  void fetchCurrency() async {

    var currency = await CurrencyRemoteServices.fetchCurrencyList();  
    
    currency.forEach((k, v) => currencyList.add(k));
    // print(currencyList);
    update();
  }

  void calCurrency(String currencyBase, String currencyFinal) async {

    // var currencyRate = await RemoteServices.fetchCurrencyRateList();
    // String amount = amountController.text.toString();  
    // var baseRates = currencyRate.rates![currencyBase];
    // var finalRates = currencyRate.rates![currencyFinal];

    // print(baseRates);
    // print(finalRates);
    // print(amount);

    // result = (double.parse(amount) / baseRates! * finalRates!);
    
    // print(result);
    update();
  }

  void navigateSettingsPage() {

    Get.toNamed(AppRoutes.SettingsPage);
  }
}