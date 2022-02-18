import 'package:financial_apps_prgi/pages/home/currency_converter.dart';
import 'package:financial_apps_prgi/pages/home/gold_price_widget.dart';
import 'package:financial_apps_prgi/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: (){
              homeController.navigateSettingsPage();
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
          child: Column(
            children: [
              GoldPriceWidget(),
              const SizedBox(height: 20,),
              CurrencyConverter(),
            ],
          ),
        ),
      ),
    );
  }
}