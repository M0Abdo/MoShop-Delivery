// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Hello extends StatelessWidget {
  const Hello({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
                      padding: const EdgeInsets.only(top: 30.0,bottom: 150.0),
                      child: Column(
                        children: [
                          Text("Hello",style: const TextStyle(fontSize: 80,color: Colors.white),textAlign: TextAlign.center,),
                            Text("Delivery Man",style: const TextStyle(fontSize: 50,color: Colors.white),textAlign: TextAlign.center,),
                        ],
                      )
                    ),
                      
                  Padding(
                    padding: const EdgeInsets.only(left:45.0,right: 45.0),
                    child: Row(
                      children: [
                        Text("Login to your Account",style: const TextStyle(fontSize: 20.0,color: Color.fromARGB(255, 114, 114, 114),fontWeight: FontWeight.bold),),
                      ],
                    ),
                  )],
    );
  }
}