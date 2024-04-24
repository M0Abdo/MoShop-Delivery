// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../Controller/Color.dart';

Future<bool> AlertExitApp() {
  Get.defaultDialog(
    title: "Alert",
    titleStyle: const TextStyle(fontSize: 35.0),
    middleText: "Do you want to exit the app?",
    middleTextStyle: const TextStyle(fontSize: 20.0),
    actions: [
      GestureDetector(
        onTap: () {
          exit(0);
        },
        child: Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            color: Appcolor.primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              "Exit",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
                fontFamily: "Play",
              ),
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            color: Appcolor.primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              "Cancel",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
                fontFamily: "Play",
              ),
            ),
          ),
        ),
      ),
    ],
  );
  return Future.value(true);
}