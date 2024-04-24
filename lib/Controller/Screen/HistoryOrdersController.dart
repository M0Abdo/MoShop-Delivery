import 'package:get/get.dart';

import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../../Core/Services/services.dart';
import '../../Data/Remote/historyorder.dart';

class HistoryOrdersController extends GetxController{
   List orders = [];
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  HistoryOrderData historyOrderData = HistoryOrderData(Get.find());
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await historyOrderData
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