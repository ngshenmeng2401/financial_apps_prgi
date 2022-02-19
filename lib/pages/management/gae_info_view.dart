import 'package:financial_apps_prgi/model/gae_unit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GAEInfoVIew extends StatelessWidget {

  final GaEunit gaEunit;
  GAEInfoVIew(this.gaEunit);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    String datePurchased = DateFormat('yyyy-MM-dd – hh:mm a').format(gaEunit.datePurchased!);

    return Scaffold(
      appBar: AppBar(
        title: Text("GAE Unit Info".tr),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Table(
                border: TableBorder.all(
                  color: Colors.black,
                ),
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          height: screenHeight/20,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Code:".tr,
                              style: const TextStyle(fontSize: 18),)
                        )),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          height: screenHeight/20,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("${gaEunit.gaeCode}",
                              style: const TextStyle(fontSize: 18),)
                        )),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          height: screenHeight/20,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Date & Time Purchased:".tr,
                              style: const TextStyle(fontSize: 18),)
                        )),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          height: screenHeight/20,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(datePurchased,
                              style: const TextStyle(fontSize: 18),)
                        )),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          height: screenHeight/20,
                          child:  Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Unit:".tr,
                              style: const TextStyle(fontSize: 18),)
                        )),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          height: screenHeight/20,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("${gaEunit.unit}",
                              style: const TextStyle(fontSize: 18),)
                        )),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          height: screenHeight/20,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Quantity(g):".tr,
                              style: const TextStyle(fontSize: 18),)
                        )),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          height: screenHeight/20,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("${gaEunit.qty}",
                              style: const TextStyle(fontSize: 18),)
                        )),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          height: screenHeight/20,
                          child:  Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Profit Rate:".tr,
                              style: const TextStyle(fontSize: 18),)
                        )),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          height: screenHeight/20,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("${gaEunit.rate}",
                              style: const TextStyle(fontSize: 18),)
                        )),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          height: screenHeight/20,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Management Fee:".tr,
                              style: const TextStyle(fontSize: 18),)
                        )),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          height: screenHeight/20,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("${gaEunit.fee}",
                              style: const TextStyle(fontSize: 18),)
                        )),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          height: screenHeight/20,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Target Percentage:".tr,
                              style: const TextStyle(fontSize: 18),)
                        )),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          height: screenHeight/20,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("${gaEunit.targetPercentage}",
                              style: const TextStyle(fontSize: 18),)
                        )),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          height: screenHeight/20,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Type:".tr,
                              style: const TextStyle(fontSize: 18),)
                        )),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          height: screenHeight/20,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("${gaEunit.type}",
                              style: const TextStyle(fontSize: 18),)
                        )),
                      ),
                    ]
                  ),
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}