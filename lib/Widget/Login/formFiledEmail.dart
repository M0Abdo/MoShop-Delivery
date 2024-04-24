// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, camel_case_types


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/Function/ValidInput.dart';
import '../../Controller/Color.dart';
import '../../Controller/Screen/LogInController.dart';

class formFiledEmail extends StatelessWidget {
  const formFiledEmail({super.key});

  @override
  Widget build(BuildContext context) {
    LogInController controller = Get.find();
    return Padding(
      padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 25.0),
      child: TextFormField(
        validator: (value) {
          return validInput(value!, 5, 100, "Email");
        },
        controller: controller.emailControler,
        textInputAction: TextInputAction.next,
        cursorColor: const Color.fromARGB(255, 0, 0, 0),
        decoration: InputDecoration(
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 255, 0, 0))),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 215, 0, 0))),
          suffixIcon: const Icon(
            Icons.person,
          ),
          suffixIconColor: Appcolor.primaryColor,
          floatingLabelStyle:
              const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          label:
              Text("Username", style: const TextStyle(fontWeight: FontWeight.bold)),
          contentPadding: const EdgeInsets.only(right: 15.0, left: 15.0),
          hintText: "Enter Username",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black12)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
        ),
      ),
    );
  }
}
