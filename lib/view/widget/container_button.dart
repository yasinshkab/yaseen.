import 'package:flutter/material.dart';
import 'package:hommer_admin/core/constant/text_theme.dart';

Widget containerButton({
  required Widget anicon,
  required double thewidth,
  required String title,
  required Function() onPressed,
}) =>
    GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 180,
        //  height: MediaQuery.of(context).size.height * 0.12,
        width: thewidth,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(31, 31, 31, 34).withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 4),
              )
            ],
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(24)),
        /////////////////
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: anicon,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: typecategory,
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color.fromRGBO(226, 33, 38, 1),
                size: 50,
              ),
            ],
          ),
        ),
      ),
    );
