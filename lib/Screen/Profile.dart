import 'package:electronics_shop_dilevery/Controller/Color.dart';
import 'package:electronics_shop_dilevery/Core/Class/HandelData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../AppLink.dart';
import '../Controller/Screen/ProfileController.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return GetBuilder<ProfileController>(
      builder: (controller) => HandelDataRequest(
          stateRequest: controller.statusRequest,
          widget: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title:  Text(
          "Profile",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 8, 99)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: ListView(
                  shrinkWrap: true,
                  children: [
                   
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Delivery Number :${controller.myServices.sharedPreferences.getString("id")}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,border:Border.all(color: Appcolor.primaryColor,width: 2.0),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                  image: NetworkImage(
                                "${AppLink.Img}/${controller.data["delivery_img"]}",
                              ))),
                          height: 200,
                          width: 150,
                        ),
                      ],
                    ),
                    Text(
                      "${controller.myServices.sharedPreferences.getString("username")}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                     Padding(
                       padding: const EdgeInsets.symmetric(vertical: 8.0),
                       child: Text(
                        "Rating",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 28,color: Appcolor.primaryColor),
                        textAlign: TextAlign.center,
                                         ),
                     ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text(
                          "${controller.allRating.toStringAsFixed(1)}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Color.fromARGB(255, 31, 31, 31)),
                    ),
                       ],
                     ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (controller.allRating >= 1.0)
                            ? Icon(Icons.star,size: 40,
                                color: Color.fromARGB(255, 255, 166, 0))
                            : (controller.allRating == 0.0)
                                ? Icon(Icons.star_border,size: 40,)
                                : Icon(
                                    Icons.star_half,
                                    size: 40,
                                    color: Color.fromARGB(255, 255, 166, 0),
                                  ),
                        (controller.allRating >= 2.0)
                            ? Icon(Icons.star
                            ,size: 40,
                                color: Color.fromARGB(255, 255, 166, 0))
                            : (controller.allRating > 1.0 &&
                                    controller.allRating < 2.0)
                                ? Icon(
                                    Icons.star_half,size: 40,
                                    color: Color.fromARGB(255, 255, 166, 0),
                                  )
                                : Icon(Icons.star_border,size: 40,),
                        (controller.allRating >= 3.0)
                            ? Icon(Icons.star,size: 40,
                                color: Color.fromARGB(255, 255, 166, 0))
                            : (controller.allRating > 2.0 &&
                                    controller.allRating < 3.0)
                                ? Icon(
                                    Icons.star_half,size: 40,
                                    color: Color.fromARGB(255, 255, 166, 0)
                                  )
                                : Icon(Icons.star_border,size: 40,),
                        (controller.allRating >= 4.0)
                            ? Icon(Icons.star,
                                color: Color.fromARGB(255, 255, 166, 0),size: 40,)
                            : (controller.allRating > 3.0 &&
                                    controller.allRating < 4.0)
                                ? Icon(
                                    Icons.star_half,
                                    color: Color.fromARGB(255, 255, 166, 0),size: 40,
                                  )
                                : Icon(Icons.star_border,size: 40,),
                        (controller.allRating == 5.0)
                            ? //3.3
                            Icon(Icons.star,
                                color: Color.fromARGB(255, 255, 166, 0),size: 40,)
                            : (controller.allRating > 4.0 &&
                                    controller.allRating < 5.0)
                                ? Icon(
                                    Icons.star_half,
                                    color: Color.fromARGB(255, 255, 166, 0),size: 40,
                                  )
                                : Icon(Icons.star_border,size: 40,),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.task_alt_outlined,
                                  color: Color.fromARGB(255, 0, 213, 7),
                                  size: 100,
                                ),
                                Text(
                                  "Order delivered ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 0, 213, 7)),
                                ),
                                Text(
                                  "${controller.ac}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.cancel_outlined,
                                  color: Color.fromARGB(255, 255, 17, 0),
                                  size: 100,
                                ),
                                Text(
                                  "Order Canced",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 255, 17, 0)),
                                ),
                                Text(
                                  "${controller.ca}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "All Orders",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      "${controller.ca + controller.ac}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ]),
            ),
          )),
    );
  }
}
