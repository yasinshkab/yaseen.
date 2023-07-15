import 'package:flutter/material.dart';
import 'package:hommer_admin/core/constant/text_theme.dart';

overViewItem(
        {required String title,
        required String thenumber,
        required Widget icon}) =>
    Container(
        width: 300,
        height: 180,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.black.withOpacity(.15),
              spreadRadius: 0.08,
              offset: const Offset(0, 4),
            )
          ],
          color: const Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              icon,
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(thenumber, textAlign: TextAlign.left, style: number),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      title,
                      textAlign: TextAlign.left,
                      style: theTitle,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
