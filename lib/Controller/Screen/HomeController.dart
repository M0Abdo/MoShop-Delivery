import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Screen/HistoryOrder.dart';
import '../../Screen/NextOrder.dart';
import 'HistoryOrdersController.dart';
import 'NextOrdersController.dart';

class HomeController extends GetxController {
  int select = 0;
  changeSel(int i) {
    select = i;
    Get.delete<NextOrdersController>();
    Get.delete<HistoryOrdersController>();
    update();
  }

  List<Widget> listOrder = [NextOrder(), HistoryOrder()];
}
