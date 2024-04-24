import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/Color.dart';
import '../Controller/Screen/OrderDetailsController.dart';
import '../Core/Class/HandelData.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());
    return Scaffold(body: GetBuilder<OrderDetailsController>(builder: (controller) => HandelDataRequest(stateRequest: controller.statusRequest,widget: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10.0),
                  child: ListView(children: [
                     Row(children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Color.fromARGB(255, 0, 0, 0),
                      size: 18.0,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Order Details",
                    style: TextStyle(
                        color: Appcolor.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 21.0),
                  ),
                  const Spacer()
                ]),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Order Number: ${controller.order1["order_id"]}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        color: Color.fromARGB(255, 55, 54, 54)),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    "Reciver: ${controller.order1["address_user_name"]}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        color: Color.fromARGB(255, 55, 54, 54)),
                    textAlign: TextAlign.center,
                    maxLines: 20,
                  ),
                ),
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 5.0),
                   child: Text(
                                    "Phone: ${controller.order1["address_phone"]}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        
                                        fontSize: 19),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 20,
                                  ),
                 ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Text(
                                    "Cite: ${controller.order1["address_cite"]}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Text(
                                    "Rigon: ${controller.order1["address_rigon"]}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19),
                                        maxLines: 20,
                                     textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Text(
                                    "Details: ${controller.order1["address_details"]}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19),
                                     textAlign: TextAlign.center,
                                     maxLines: 20,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                 Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Column(
                        
                        children: [
                        Padding(
                            padding:
                                const EdgeInsets.only(bottom: 10.0,),
                            child: Text(
                              "Order",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 122, 122, 122),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19),
                            ),
                          ),
                          GridView.builder( physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.order2.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                childAspectRatio: 4.0,
                                crossAxisSpacing: 10.0,
                              ), itemBuilder: (context, index) => Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                            child: CircleAvatar(
                                              radius: 20,
                                              backgroundColor:
                                                  Appcolor.primaryColor,
                                              child: Text(
                                                "${controller.order2[index]["count"]}",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    color: Colors.white,
                                                    overflow: TextOverflow
                                                        .ellipsis),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${controller.order2[index]["items_name"]}",
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 122, 122, 122),
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    fontSize: 17),
                                              ),
                                              Text(
                                                "${controller.order2[index]["items_brand"]}",
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 122, 122, 122),
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Text(
                                            "${(int.parse(controller.order2[index]["items_price"]) - (int.parse(controller.order2[index]["items_discount"]) / 100) * int.parse(controller.order2[index]["items_price"])).toInt()}\$",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                                color: Color.fromARGB(
                                                    255, 122, 122, 122)),
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        thickness: 2,
                                        color: Color.fromARGB(
                                            255, 142, 147, 202),
                                      ),
                                    ],
                                  ),),
                                    Row(
                            children: [
                              Text(
                                "Subtotal",
                                style: TextStyle(
                                    color:
                                        Color.fromARGB(255, 122, 122, 122),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                              Spacer(),
                              Text(
                                "${controller.order1["order_price"]}\$",
                                style: TextStyle(
                                    color:
                                        Color.fromARGB(255, 122, 122, 122),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                            ],
                          ),
                                   Row(
                              children: [
                                Text(
                                  "Delivery Cost",
                                  style: TextStyle(
                                      color: Color.fromARGB(
                                          255, 122, 122, 122),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                Spacer(),
                                Text(
                                  "${controller.order1["order_delivery"]}\$",
                                  style: TextStyle(
                                      color: Color.fromARGB(
                                          255, 122, 122, 122),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ],
                            ),
 if (controller.order1["order_coupon"] != '0')
                            Row(
                              children: [
                                Text(
                                  "Discount",
                                  style: TextStyle(
                                      color: Color.fromARGB(
                                          255, 122, 122, 122),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                Spacer(),
                                Text(
                                  "-${((int.parse(controller.order1["order_coupon"]) / 100) * int.parse(controller.order1["order_price"])).toInt()}\$",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ],
                            ),
                          const Divider(
                            thickness: 2,
                            color: Color.fromARGB(255, 142, 147, 202),
                          ),
                          Row(
                            children: [
                              Text(
                                "Total Price",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 57, 57, 57),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                              Spacer(),
                              Text(
                               "${int.parse(controller.order1["order_price"]) + int.parse(controller.order1["order_delivery"]) - ((int.parse(controller.order1["order_coupon"]) / 100) * int.parse(controller.order1["order_price"])).toInt()}\$",
                                style: TextStyle(
                                    color: Appcolor.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                            ],
                          ),
                      ])),
                      if (controller.order1["order_state"]=='2') 
                      Column(
                        children: [
                          Icon(
                                            Icons.task_alt_outlined,
                                            color: Color.fromARGB(255, 0, 213, 7),
                                            size: 150,
                                          ),
                                           Text( "Order delivered ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                                color: Color.fromARGB(
                                                    255, 0, 213, 7)),
                                          )
                        ],
                      ),
                   if (controller.order1["order_state"]=='3')
                   Column(
                    children: [
                      Icon(
                                            Icons.cancel_outlined,
                                            color:
                                                Color.fromARGB(255, 255, 17, 0),
                                            size: 150,
                                          ),
                      Text(
                                            "Order Canced",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                                color: Color.fromARGB(
                                                    255, 255, 17, 0)),
                                          ),
                    ],
                   ) ,
                if (controller.order1["order_state"]=='1')    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () => controller.accept(),
                            child: Container(
                              height: 50,
                              width: 100,
                              
                              decoration: BoxDecoration(color: Color.fromARGB(255, 19, 236, 26),borderRadius: BorderRadius.circular(15.0)),
                              child: Center(child: Text("Receive",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18),)),
                            ),
                        
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () => controller.cancel(),
                            child: Container(
                              height: 50,
                              width: 100,
                              
                              decoration: BoxDecoration(color: Color.fromARGB(255, 252, 18, 2),borderRadius: BorderRadius.circular(15.0)),
                              child: Center(child: Text("Cancel",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18),)),
                            ),
                            
                          ),
                        )
                      ],
                     )
                  ]),
                  )),));
  }
}
