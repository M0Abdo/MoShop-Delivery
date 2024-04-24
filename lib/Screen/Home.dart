import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/Color.dart';
import '../Controller/Screen/HomeController.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title:  Text(
          "ShopName",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 8, 99)),
        ),
      ),
      body: GetBuilder<HomeController>(builder: (controller) => Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, ),
                  child: Column(
                    children: [
                   Expanded(
                
                    child:   Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                             controller.changeSel(0);
                              
                              },
                              child: Container(
                                  height: 30,
                                  decoration: (controller.select == 0)
                                      ? BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Appcolor.primaryColor,
                                                  width: 3.0)))
                                      : null,
                                  child: Center(
                                    child: Text(
                                      "Next Orders",
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: (controller.select == 0)
                                            ? Appcolor.primaryColor
                                            : Color.fromARGB(255, 155, 162, 236),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21,
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                controller.changeSel(1);
                            
                              },
                              child: Container(
                                  height: 30,
                                  decoration: (controller.select == 1)
                                      ? BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Appcolor.primaryColor,
                                                  width: 3.0)))
                                      : null,
                                  child: Center(
                                    child: Text(
                                      "Orders History",
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: (controller.select == 1)
                                            ? Appcolor.primaryColor
                                            : Color.fromARGB(255, 155, 162, 236),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21,
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),),
                  Expanded(flex: 24, child:  controller.listOrder.elementAt(controller.select))
                    ],
                  ),
                ),
      ),)
    );
  }
}
