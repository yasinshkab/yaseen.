import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hommer_admin/controller/auth/resetpassword/checkemail.control.dart';
import 'package:hommer_admin/core/constant/text_theme.dart';
import 'package:hommer_admin/core/function/valid_input.dart';
import 'package:hommer_admin/view/widget/form_field.dart';
import 'package:hommer_admin/view/widget/the_buttons.dart';

class Checkemail extends StatelessWidget {
  const Checkemail({super.key});

  @override
  Widget build(BuildContext context) {
    CheckEmailControllerImp controller = Get.put(CheckEmailControllerImp());

    return Scaffold(
        backgroundColor: Colors.red[300],
        body: Center(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                child: Form(
                    key: controller.formKey,
                    child: Container(
                        height: 380,
                        width: 360,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Colors.black.withOpacity(.15),
                                spreadRadius: 0.08,
                                offset: const Offset(0, 4),
                              )
                            ],
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                                child: SingleChildScrollView(
                                    child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                      style: thesubTitle,
                                      "هل نسيت كلمة المرور ؟"),
                                  const SizedBox(
                                    height: 12.5,
                                  ),
                                  const Text(
                                    "لا تقلق, سوف نساعدك",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(125, 125, 125, 1),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Theformfields(
                                    valid: (val) {
                                      return validInput(val!, 8, 80, "email");
                                    },
                                    keyboardtype: TextInputType.emailAddress,
                                    thecontroller: controller.theemail,
                                    preicons: const Icon(
                                      Icons.email_outlined,
                                      color: Color.fromRGBO(125, 125, 125, 1),
                                      size: 28,
                                    ),
                                    label: "البريد الألكتروني",
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  primaryButton(
                                    theText: "إرسال",
                                    onPressed: () {
                                      controller.goToOTP();
                                    },
                                    //  () {
                                    //  controller.goToOTP();
                                    // },
                                  ),
                                ],
                              ),
                            )))))))));
  }
}
