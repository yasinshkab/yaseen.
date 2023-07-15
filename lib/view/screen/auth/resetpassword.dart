// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hommer_admin/controller/auth/resetpassword/resetpassword.control.dart';
import 'package:hommer_admin/core/constant/text_theme.dart';
import 'package:hommer_admin/core/function/valid_input.dart';
import 'package:hommer_admin/view/widget/form_field.dart';
import 'package:hommer_admin/view/widget/the_buttons.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
        backgroundColor: Colors.red[300],
        body: Center(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                child: Form(
                    key: controller.formKey,
                    child: Container(
                        height: 400,
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
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Text(
                                      textAlign: TextAlign.center,
                                      style: thesubTitle,
                                      "إعادة تعيين كلمة المرور",
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.lock_outlined,
                                          color:
                                              Color.fromRGBO(125, 125, 125, 1),
                                          size: 28,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Flexible(
                                          child: formFeilds(
                                            valid: (val) {
                                              return validInput(
                                                  val!, 8, 35, "password");
                                            },
                                            theController: controller.password,
                                            isPassword: controller.isObscure,
                                            theLabel: "كلمة المرور",
                                            preicons: const Icon(
                                              Icons.lock_outline,
                                              color: Color.fromRGBO(
                                                  125, 125, 125, 1),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.lock_outlined,
                                          color:
                                              Color.fromRGBO(125, 125, 125, 1),
                                          size: 28,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Flexible(
                                          child: formFeilds(
                                            valid: (val) {
                                              return validInput(
                                                  val!, 8, 35, "password");
                                            },
                                            theController:
                                                controller.repassword,
                                            isPassword: controller.isObscure,
                                            theLabel: "تأكيد كلمة المرور",
                                            preicons: const Icon(
                                              Icons.lock_outline,
                                              color: Color.fromRGBO(
                                                  125, 125, 125, 1),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    bigPrimaryButton(
                                      theText: "إرسال",
                                      onPressed: () {
                                        controller.resetpassword();
                                      },
                                    ),
                                  ]),
                            ),
                          ),
                        ))))));
  }
}
