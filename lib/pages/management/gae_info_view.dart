import 'package:financial_apps_prgi/model/gae_unit.dart';
import 'package:flutter/material.dart';
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
        title: const Text("GAE Unit Info"),
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
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Code:",
                              style: TextStyle(fontSize: 18),)
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
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Date & Time Purchased:",
                              style: TextStyle(fontSize: 18),)
                        )),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          height: screenHeight/20,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("${datePurchased}",
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
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Unit:",
                              style: TextStyle(fontSize: 18),)
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
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Quantity(g):",
                              style: TextStyle(fontSize: 18),)
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
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Profit Rate:",
                              style: TextStyle(fontSize: 18),)
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
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Management Fee:",
                              style: TextStyle(fontSize: 18),)
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
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Target Percentage:",
                              style: TextStyle(fontSize: 18),)
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
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Type:",
                              style: TextStyle(fontSize: 18),)
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