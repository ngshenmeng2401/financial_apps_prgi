import 'package:financial_apps_prgi/model/gold_price_model.dart';
import 'package:financial_apps_prgi/route/app_pages.dart';
import 'package:financial_apps_prgi/service/currency_remote_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'dart:async';

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
  var isLoading = true;
  var statusMsj = "Loading";

  var connectionStatus = 1;

  late StreamSubscription<InternetConnectionStatus> _listener;

  @override
  void onInit() {
    fetchCurrency();
    checkInternetConnection();
    super.onInit();
  }

  @override
  void onReady() {
    checkInternetConnection();
    super.onReady();
  }

  @override
  void onClose() {
    _listener.cancel();
  }

  void checkInternetConnection(){

    _listener = InternetConnectionChecker().onStatusChange.listen((InternetConnectionStatus status){

      switch (status){

        case InternetConnectionStatus.connected:
          connectionStatus = 1;
          break;
        case InternetConnectionStatus.disconnected:
          connectionStatus = 0;
          break;
      }
    });
    print(connectionStatus);
    update();
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

    try {
      isLoading = true;
      var currency = await CurrencyRemoteServices.fetchCurrencyList();
      if (currency != null) {
        currency.forEach((k, v) => currencyList.add(k));
      } else {
        // gaeUnittList = null;
        statusMsj = "No_data".tr;
      }
    } finally {
      isLoading = false;
    }
    // print(currencyList);
    update();
  }

  void calCurrency(String currencyBase, String currencyFinal) async {

    var currencyRate = await CurrencyRemoteServices.fetchCurrencyRateList();
    String amount = amountController.text.toString();  
    var baseRates = currencyRate.rates![currencyBase];
    var finalRates = currencyRate.rates![currencyFinal];

    print(baseRates);
    print(finalRates);
    print(amount);

    result = (double.parse(amount) / baseRates! * finalRates!);
    
    print(result);
    update();
  }

  void navigateSettingsPage() {

    Get.toNamed(AppRoutes.SettingsPage);
  }
}