import 'package:carousel_slider/carousel_slider.dart';
import 'package:financial_apps_prgi/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoldPriceWidget extends StatelessWidget {
  GoldPriceWidget({ Key? key }) : super(key: key);

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Gold Price:",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 22
          ),),
        const SizedBox(height: 20),
        CarouselSlider.builder(
          itemCount: homeController.goldPriceModel.length, 
          options: CarouselOptions(
            aspectRatio: 16/9,
            height: screenHeight/4,
            viewportFraction: 0.8,
            initialPage: 0,
            enlargeCenterPage: true,
          ), 
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Container(
              width: screenWidth,
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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/logo.png",
                      height: screenHeight/10,),
                    Text(homeController.goldPriceModel[index].fullName.toString()+ " (" + homeController.goldPriceModel[index].shortName.toString() + ")",
                      style: const TextStyle(
                        fontSize: 20,
                      ),),
                    Text("MYR " + homeController.goldPriceModel[index].sellPrice.toString() + " per gram (sell)"),
                    Text("MYR " + homeController.goldPriceModel[index].buyPrice.toString() + " per gram (buy)"),
                    Text(homeController.goldPriceModel[index].fee != 0 
                      ? "Management Fee: MYR " + homeController.goldPriceModel[index].fee.toString()
                      : ""),
                    Text(homeController.goldPriceModel[index].remark.toString())
                  ],
                ),
              )
            );
          },)
      ],
    );
  }
}