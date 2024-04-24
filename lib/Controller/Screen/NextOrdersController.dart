import 'package:electronics_shop_dilevery/Core/Services/services.dart';
import 'package:get/get.dart';

import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../../Data/Remote/nextorder.dart';

class NextOrdersController extends GetxController {
  List orders = [];
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  NextOrderData nextOrderData = NextOrderData(Get.find());
  getData() async {
     orders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var res = await nextOrderData
        .postdata(myServices.sharedPreferences.getString("id")!);
    print(res);
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        orders.addAll(res["data"]);
      } else
        statusRequest = StatusRequest.fallure;
    }
    update();
  }

  @override
  void onInit() {
    getData();

    super.onInit();
  }
}
