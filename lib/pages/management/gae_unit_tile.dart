import 'package:financial_apps_prgi/model/gae_unit.dart';
import 'package:financial_apps_prgi/pages/management/management_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GAEUnitTIle extends StatelessWidget {
  
  final managementController = Get.put(ManagementController());
  final GaEunit gaEunit;
  final int index;
  GAEUnitTIle(this.index, this.gaEunit);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
        width: screenWidth,
        height: screenHeight/14,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Expanded(
              flex: 1,
              child: SizedBox(
                width:10,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text("${gaEunit.gaeCode}",
                style: const TextStyle(
                      fontSize: 16,),)
            ),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${gaEunit.unit} unit",
                    style: const TextStyle(
                      fontSize: 18,
                    ),),
                  Text(gaEunit.qty == "1" 
                    ? "${gaEunit.qty} quantity"
                    : "${gaEunit.qty} quantities"),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: (){
                  managementController.navigateInfoGAEView(gaEunit);
                }, 
                icon: const Icon(Icons.info)),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: (){
                  managementController.navigateEditGAEView(gaEunit);
                }, 
                icon: const Icon(Icons.edit)),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: (){
                  managementController.deleteGAEUnitDialog(gaEunit);
                }, 
                icon: const Icon(Icons.delete)),
            ),
          ],
        )
      )
    );
  }
}