import 'package:electronics_shop_dilevery/Controller/Screen/HomeScreenController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';

import '../Controller/imgAssets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return GetBuilder<HomeScreenController>(
      builder: (controller) => Scaffold(
          body: controller.listPage.elementAt(controller.curunetpage),
          bottomNavigationBar: BottomAppBar(
              elevation: 0.0,
              child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        )
                      ],
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0))),
                  height: 70,
                  width: double.infinity,
                  child: Row(children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.deleteC();
                          controller.changePage(0);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              "${ImgAsset.RootAssets}/home-svgrepo-com.svg",
                              color: (controller.curunetpage == 0)
                                  ? const Color.fromARGB(255, 0, 11, 127)
                                  : const Color.fromARGB(255, 124, 124, 124),
                              height: 30,
                              width: 30,
                            ),
                            if (controller.curunetpage == 0)
                              const Padding(
                                padding: EdgeInsets.only(top: 2.0),
                                child: CircleAvatar(
                                  radius: 4.0,
                                  backgroundColor:
                                      Color.fromARGB(255, 0, 8, 99),
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.deleteC();
                          controller.changePage(1);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              "${ImgAsset.RootAssets}/profile-round-1342-svgrepo-com.svg",
                              color: (controller.curunetpage == 1)
                                  ? const Color.fromARGB(255, 0, 11, 127)
                                  : const Color.fromARGB(255, 124, 124, 124),
                              height: 30,
                              width: 30,
                            ),
                            if (controller.curunetpage == 1)
                              const Padding(
                                padding: EdgeInsets.only(top: 2.0),
                                child: CircleAvatar(
                                  radius: 4.0,
                                  backgroundColor:
                                      Color.fromARGB(255, 0, 8, 99),
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                  ])))),
    );
  }
}
