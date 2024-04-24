import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../Screen/Home.dart';
import '../../Screen/Profile.dart';
import 'HomeController.dart';
import 'NextOrdersController.dart';
import 'ProfileController.dart';

class HomeScreenController extends GetxController {
  int curunetpage = 0;
  changePage(int i) {
    curunetpage = i;
    update();
  }

  deleteC() {
    Get.delete<NextOrdersController>();
    Get.delete<ProfileController>();
    update();
  }

  List<Widget> listPage = [Home(), Profile()];
}
