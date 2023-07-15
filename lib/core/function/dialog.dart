import 'package:flutter/material.dart';
import 'package:get/get.dart';

deleteDialog(
        {required String title,
        required String middleText,
        required void Function()? onPressed}) =>
    Get.defaultDialog(
        title: title,
        titleStyle: TextStyle(
          fontSize: 24,
          color: Color.fromRGBO(226, 33, 38, 1),
        ),
        middleText: middleText,
        actions: [
          TextButton(onPressed: onPressed, child: const Text("تأكيد")),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                Color.fromRGBO(226, 33, 38, 1),
              )),
              onPressed: () {
                Get.back();
              },
              child: const Text("الغاء")),
        ]);
