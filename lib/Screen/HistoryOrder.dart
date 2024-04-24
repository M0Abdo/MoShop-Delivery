import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Controller/AppRoute.dart';
import '../Controller/Screen/HistoryOrdersController.dart';
import '../Core/Class/HandelData.dart';

class HistoryOrder extends StatelessWidget {
  const HistoryOrder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HistoryOrdersController());
    return GetBuilder<HistoryOrdersController>(builder:  (controller) => HandelDataRequest(stateRequest: controller.statusRequest,widget: Container(
      padding: EdgeInsets.only(top: 10.0),
      child:(controller.orders.isEmpty)?Center(child: Text("No Orders"),): ListView.builder(itemCount: controller.orders.length,itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
           onTap: () {
                          Get.toNamed(AppRoute.orderdetails,
                              arguments: controller.orders[index]);
                        },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
                                height: 160,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(15.0)),
                                    child: Row(
                                      children: [
                                        Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                        padding:
                                            const EdgeInsets.symmetric(vertical: 4.0),
                                        child: Text(
                                          "Order Number: ${controller.orders[index]["order_id"]}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                  ),
                                   Text(
                                              "Reciver: ${controller.orders[index]["address_user_name"]}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                             Text(
                                              "Phone: ${controller.orders[index]["address_phone"]}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                             Text(
                                              "Cite: ${controller.orders[index]["address_cite"]}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                             Text(
                                              "Rigon: ${controller.orders[index]["address_rigon"]}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                  Text(
                                              "${controller.orders[index]["address_details"]}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                  
                                  Text(
                                    "${DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.parse(controller.orders[index]["order_time"]))}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ]),Spacer(),
                                          Column(
                                            children: [
                                               Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                        (controller.orders[index]["order_state"] == '2')?  Icon(
                                            Icons.task_alt_outlined,
                                            color: Color.fromARGB(255, 0, 213, 7),
                                            size: 100,
                                          ): Icon(
                                            Icons.cancel_outlined,
                                            color:
                                                Color.fromARGB(255, 255, 17, 0),
                                            size: 100,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          (controller.orders[index]["order_state"] == '2')?
                                           Text( "Order delivered ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Color.fromARGB(
                                                    255, 0, 213, 7)),
                                          ):Text(
                                            "Order Canced",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Color.fromARGB(
                                                    255, 255, 17, 0)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                              Text(
                                               
                                                     "Total: ${int.parse(controller.orders[index]["order_price"]) + int.parse(controller.orders[index]["order_delivery"]) - ((int.parse(controller.orders[index]["order_coupon"]) / 100) * int.parse(controller.orders[index]["order_price"])).toInt()}\$",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
          ),
        ),
      ),),
    )),);
  }
}