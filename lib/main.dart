

import 'package:electronics_shop_dilevery/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Binding/InitialBinding.dart';
import 'Core/Services/services.dart';

Future<void> main() async {
   await initialServices();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
 MyServices myServices = Get.find();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
     // home: /*(myServices.sharedPreferences.getString('choose')=="1")? const Onboard():*/lengagePage(),
      //routes: appRoutes,
       getPages: route,
   //   home: test(),
        initialBinding: InitialBinding(),
  
    );
  }
}


