

import 'package:electronics_shop_dilevery/Controller/Screen/HomeController.dart';
import 'package:electronics_shop_dilevery/Core/Services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../../Data/Remote/nextorder.dart';
import '../../Data/Remote/orderdetails.dart';
import 'HistoryOrdersController.dart';
import 'HomeScreenController.dart';
import 'NextOrdersController.dart';

class OrderDetailsController extends GetxController {
  Map order1 = {};
  List order2 = [];
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  OrderDetailsData orderDetailsData = OrderDetailsData(Get.find());
  NextOrdersController con = Get.put(NextOrdersController());
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await orderDetailsData.postdata(order1["order_id"]!);
  
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        order2.addAll(res["data"]);
       
      } else
        statusRequest = StatusRequest.fallure;
    }
    update();
  }

  accept() async {
    Get.defaultDialog(
        title: "Accept",
        titleStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color.fromARGB(255, 0, 8, 99)),
        middleText: "Are you sure to Accept?",
        middleTextStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        actions: [
          Spacer(),
          GestureDetector(
            onTap: () async {
              statusRequest = StatusRequest.loading;
    update();
    var res = await orderDetailsData.accept_delete(order1["order_id"]!, "2");
   
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        con.getData();
         Get.back();
        Get.back();
      } else
        statusRequest = StatusRequest.fallure;
    }
    update();
            },
            child: SizedBox(
                height: 20,
                width: 50,
                child: Text(
                  "Yes",
                )),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              
              Get.back();
            },
            child: SizedBox(
                width: 50,
                height: 20,
                child: Text(
                  "No",
                )),
          ),
          Spacer()
        ]);
    
  }

  cancel() async {
     Get.defaultDialog(
        title: "Delete",
        titleStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color.fromARGB(255, 0, 8, 99)),
        middleText: "Are you sure to Delete?",
        middleTextStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        actions: [
          Spacer(),
          GestureDetector(
            onTap: () async {
              statusRequest = StatusRequest.loading;
    update();
    var res = await orderDetailsData.accept_delete(order1["order_id"]!, "3");
   
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        con.getData();
         Get.back();
        Get.back();
      } else
        statusRequest = StatusRequest.fallure;
    }
    update();
            },
            child: SizedBox(
                height: 20,
                width: 50,
                child: Text(
                  "Yes",
                )),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: SizedBox(
                width: 50,
                height: 20,
                child: Text(
                  "No",
                )),
          ),
          Spacer()
        ]);
    
  }

  @override
  void onInit() {
    order1 = Get.arguments;
    getData();

    super.onInit();
  }
}
