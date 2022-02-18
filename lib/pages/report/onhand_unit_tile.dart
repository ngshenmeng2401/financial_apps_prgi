import 'package:financial_apps_prgi/model/gae_unit.dart';
import 'package:financial_apps_prgi/pages/report/report_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OnHandUnitTile extends StatelessWidget {

  final reportController = Get.put(ManageReportController());
  final GaEunit gaEunit;
  final int index;
  OnHandUnitTile(this.index, this.gaEunit);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    String datePurchased = DateFormat('yyyy-MM-dd – hh:mm a').format(gaEunit.datePurchased!);

    return Container(
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      width: screenWidth,
      height: screenHeight/14,
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(8, 5, 0, 0),
          child: Text(' ${gaEunit.gaeCode}',
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
        title: Text(gaEunit.unit!,
          style: const TextStyle(fontSize: 18),),
        subtitle: Text(datePurchased,),
        trailing: MaterialButton(
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: (){
            reportController.soldGAEUnitDialog(gaEunit);
          }, 
          child: const Text("Sold",
            style: TextStyle(color: Colors.white),)),
      )
    );
  }
}