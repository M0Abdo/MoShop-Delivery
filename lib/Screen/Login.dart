import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/Screen/LogInController.dart';
import '../Controller/imgAssets.dart';
import '../Core/Class/HandelData.dart';
import '../Widget/Login/Hello.dart';
import '../Widget/Login/SingInButtom.dart';
import '../Widget/Login/formFiledEmail.dart';
import '../Widget/Login/formFiledPass.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LogInController());

    return GetBuilder<LogInController>(
      builder: (controller) {
        return Scaffold(
            body: HandelDataRequest(
          widget: Form(
               key: controller.formstate,
            child: Container(
               width: double.infinity,
                      height: double.infinity,
                          color: Colors.white,
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage(ImgAsset.backImg),
                            alignment: Alignment.topCenter)),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Hello(),
                        const formFiledEmail(),
                        const formFiledPass(),
                        SingInButtom(),
                       
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          stateRequest: controller.statusRequest,
        ));
      },
    );
  }
}
