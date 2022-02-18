import 'package:financial_apps_prgi/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrencyConverter extends GetView<HomeController> {

  CurrencyConverter({ Key? key }) : super(key: key);

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Currency Converter",
            style: TextStyle(
              fontSize: 22
            ),),
          const SizedBox(height:10),
          TextField(
            style: const TextStyle(
              fontSize: 20
            ),
            keyboardType: TextInputType.number,
            controller: homeController.amountController,
            decoration: InputDecoration(
              labelText: "Input Value to Convert".tr,
              labelStyle: const TextStyle(
                fontSize: 16
            ),),
          ),
          const SizedBox(height:10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GetBuilder<HomeController>(
                init: HomeController(),
                builder: (_) {
                  return Expanded(
                    flex: 4,
                    child: DropdownButton<String?>(
                      underline: Container(
                        height: 2,
                        color: Colors.black,
                      ),
                      isExpanded: true,
                      menuMaxHeight: screenHeight/3,
                      value: controller.selectCurrencyBase,
                      elevation: 28,
                      style: const TextStyle(fontSize: 20),
                      onChanged: (String? newValue) {
                        homeController.chooseCurrencyBase(newValue!);
                      },
                      items: [
                        for (var data in homeController.currencyList)
                          DropdownMenuItem(
                            child: Text(
                              data,
                              style: const TextStyle(
                                color: Colors.black
                              ),
                            ),
                            value: data,
                          )
                      ]
                    ),
                  );
                },
              ),
              const Expanded(
                flex: 2,
                child: Text("to",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22
                ),),
              ),
              GetBuilder<HomeController>(
                init: HomeController(),
                builder: (_) {
                  return Expanded(
                    flex: 4,
                    child: DropdownButton<String?>(
                      underline: Container(
                        height: 2,
                        color: Colors.black,
                      ),
                      isExpanded: true,
                      menuMaxHeight: screenHeight/3,
                      value: controller.selectCurrencyFinal,
                      elevation: 28,
                      style: const TextStyle(fontSize: 20),
                      onChanged: (String? newValue) {
                        homeController.chooseCurrencyFinal(newValue!);
                      },
                      items: [
                        for (var data in homeController.currencyList)
                          DropdownMenuItem(
                            child: Text(
                              data,
                              style: const TextStyle(
                                color: Colors.black
                              ),
                            ),
                            value: data,
                          )
                      ]
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height:10),
          MaterialButton(
            minWidth: screenWidth/3,
            color: Colors.blue,
            child: const Text("Convert",
              style: TextStyle(fontSize: 20)),
            onPressed: (){
              homeController.calCurrency(controller.selectCurrencyBase, controller.selectCurrencyFinal);
            }),
          const SizedBox(height:10),
          const Text("Result: ",
            style: TextStyle(fontSize: 24)),
          Row(
            children: [
              GetBuilder<HomeController>(
                init: HomeController(),
                builder: (_) {
                  return Expanded(
                    flex: 10,
                    child: Text(homeController.result.toStringAsFixed(2),
                      style: const TextStyle(fontSize: 30),
                      textAlign: TextAlign.center),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}