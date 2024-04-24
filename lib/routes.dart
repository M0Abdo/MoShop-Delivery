
import 'package:electronics_shop_dilevery/Screen/HomeScreen.dart';
import 'package:electronics_shop_dilevery/Screen/Login.dart';
import 'package:get/get.dart';

import 'Controller/AppRoute.dart';
import 'Core/MiddelWare/MyMiddelWare.dart';
import 'Screen/OrderDetails.dart';


List<GetPage<dynamic>>? route = [
  
  GetPage(name: "/", page: ()=> Login(),middlewares: [
    MyMiddelWare()
  ]),
  GetPage(name: AppRoute.home, page:()=> HomeScreen()),
  GetPage(name: AppRoute.orderdetails, page:()=> OrderDetails()),
];

