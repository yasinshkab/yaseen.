import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hommer_admin/core/constant/text_theme.dart';
import 'package:hommer_admin/core/function/valid_input.dart';
import 'package:hommer_admin/view/widget/form_field.dart';
import 'package:hommer_admin/view/widget/the_buttons.dart';

Widget thesnackBar(
  BuildContext context, {
  required Color theColor,
  required String theText,
  required Widget theicon,
}) =>
    Flushbar(
      shouldIconPulse: false,
      backgroundColor: theColor,
      // Color.fromRGBO(3, 210, 90, 1),
      // Color.fromRGBO(228, 59, 64, 1),

      margin: const EdgeInsets.fromLTRB(15, 50, 15, 0),
      //all(15),
      borderRadius: BorderRadius.circular(10),
      icon: theicon,
      //  Icon(
      //   Icons.check_circle_outlined,
      //   color: Color.fromRGBO(255, 255, 255, 1),
      // ),
      //  Icon(
      //    Icons.warning_amber_outlined,
      //   color: Color.fromRGBO(255, 255, 255, 1),
      // ),
      flushbarPosition: FlushbarPosition.TOP,
      message: theText,
      duration: const Duration(seconds: 4),
    )..show(context);

Widget addDialog(
        {required bool isproduct,
        required controllername,
        controllercode,
        controllerprice,
        controllercount,
        controllerdiscount,
        required Key key,
        required Widget thewidget,
        required dynamic Function() pickimage,
        required dynamic Function() buttonon}) =>
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child:
          // ignore: sized_box_for_whitespace
          Form(
        key: key,
        child: SizedBox(
          height: isproduct == true ? 640 : 320,
          width: 480,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 14),
            child: Center(
              child: Column(
                children: [
                  Text(
                    isproduct == true ? "إضافة منتج" : "إضافة نوع",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Color.fromRGBO(226, 33, 38, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        isproduct == true ? "إختر النوع :" : "إختر الفئة :",
                        style: orderheads,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  thewidget,
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    child: formFeilds(
                      theController: controllername,
                      valid: (val) {
                        return validInput(val!, 8, 35, "");
                      },
                      theLabel: "الإسم",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  isproduct == true
                      ? Column(
                          children: [
                            formFeilds(
                              theController: controllercode,
                              valid: (val) {
                                return validInput(val!, 11, 11, "");
                              },
                              theLabel: "الكود",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            formFeilds(
                              theController: controllerprice,
                              valid: (val) {
                                return validInput(val!, 1, 35, "number");
                              },
                              theLabel: "السعر",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            formFeilds(
                              theController: controllercount,
                              valid: (val) {
                                return validInput(val!, 1, 35, "number");
                              },
                              theLabel: "الكمية",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            formFeilds(
                              theController: controllerdiscount,
                              valid: (val) {
                                return validInput(val!, 1, 35, "number");
                              },
                              theLabel: "التخفيض",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )
                      : const SizedBox(
                          height: 1,
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  pickimageButton(onPressed: pickimage),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: buttonon,
                        child: const Text(
                          "تأكيد",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(
                          "الغاء",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
