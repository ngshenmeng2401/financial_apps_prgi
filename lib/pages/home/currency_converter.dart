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
          Text("Currency_Converter".tr,
            style: const TextStyle(
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
              labelText: "Input_Value_to_Convert".tr,
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
                  if(controller.connectionStatus == 1){

                    if (controller.isLoading){
                      return Expanded(
                        flex: 4,
                        child: Center(
                          child: Text(controller.statusMsj.tr,
                            style: const TextStyle(fontSize: 20),),
                        ),
                      );
                    }else if(controller.connectionStatus == 0){

                      return Expanded(
                        flex: 4,
                        child: Center(
                          child: Text("No Internet Connection".tr,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 20),),
                        ),
                      );
                    }else{

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
                    }
                  }else{
                    return Expanded(
                      flex: 4,
                      child: Center(
                        child: Text("No Internet Connection".tr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 20),),
                      ),
                    );
                  }
                }
              ),
              Expanded(
                flex: 2,
                child: Text("to".tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22
                ),),
              ),
              GetBuilder<HomeController>(
                init: HomeController(),
                builder: (_) {
                  if(controller.connectionStatus == 1){

                    if (controller.isLoading){
                      return Expanded(
                        flex: 4,
                        child: Center(
                          child: Text(controller.statusMsj.tr,
                            style: const TextStyle(fontSize: 20),),
                        ),
                      );
                    }else if(controller.connectionStatus == 0){

                      return Expanded(
                        flex: 4,
                        child: Center(
                          child: Text("No Internet Connection".tr,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 20),),
                        ),
                      );
                    }else{

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
                    }
                  }else{
                    return Expanded(
                      flex: 4,
                      child: Center(
                        child: Text("No Internet Connection".tr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 20),),
                      ),
                    );
                  }
                }
              ),
            ],
          ),
          const SizedBox(height:10),
          MaterialButton(
            minWidth: screenWidth/3,
            color: Colors.blue,
            child:  Text("Convert".tr,
              style: const TextStyle(fontSize: 20)),
            onPressed: (){
              homeController.calCurrency(controller.selectCurrencyBase, controller.selectCurrencyFinal);
            }),
          const SizedBox(height:10),
          Text("Result: ".tr,
            style: const TextStyle(fontSize: 24)),
          Row(
            children: [
              GetBuilder<HomeController>(
                init: HomeController(),
                builder: (_) {
                  if(controller.connectionStatus == 1){

                    return Expanded(
                    flex: 10,
                    child: Text(homeController.result.toStringAsFixed(2),
                      style: const TextStyle(fontSize: 30),
                      textAlign: TextAlign.center),
                    );
                  }else{

                    return const Expanded(
                    flex: 10,
                    child: Text("0.00",
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center),
                    );
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}