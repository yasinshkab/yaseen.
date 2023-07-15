import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hommer_admin/controller/auth/login.control.dart';
import 'package:hommer_admin/core/constant/text_theme.dart';
import 'package:hommer_admin/core/function/valid_input.dart';

import 'package:hommer_admin/view/widget/form_field.dart';
import 'package:hommer_admin/view/widget/the_buttons.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      backgroundColor: Colors.red[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
          child: Form(
            key: controller.formKey,
            child: Container(
              height: 420,
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        style: title,
                        "تسجيل الدخول",
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Theformfields(
                        valid: (val) {
                          return validInput(val!, 8, 80, "email");
                        },
                        keyboardtype: TextInputType.emailAddress,
                        thecontroller: controller.email,
                        preicons: const Icon(
                          Icons.email_outlined,
                          color: Color.fromRGBO(125, 125, 125, 1),
                          size: 28,
                        ),
                        label: "البريد الألكتروني",
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.lock_outlined,
                            color: Color.fromRGBO(125, 125, 125, 1),
                            size: 28,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Flexible(
                            child: formFeilds(
                              valid: (val) {
                                return validInput(val!, 8, 35, "password");
                              },
                              theController: controller.password,
                              isPassword: controller.isObscure,
                              theLabel: "كلمة المرور",
                              preicons: const Icon(
                                Icons.lock_outline,
                                color: Color.fromRGBO(125, 125, 125, 1),
                              ),
                              suficons: IconButton(
                                  splashRadius: 15.0,
                                  onPressed: () {
                                    setState(() {
                                      controller.isObscure =
                                          !controller.isObscure;
                                    });
                                  },
                                  icon: controller.isObscure
                                      ? const Icon(
                                          Icons.visibility_off_outlined,
                                          color: Colors.grey,
                                        )
                                      : const Icon(Icons.visibility_outlined,
                                          color: Colors.grey)),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      primaryButton(
                        theText: "تسجيل الدخول",
                        onPressed: () {
                          controller.login();
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      textButton(
                          onPressed: () {
                            controller.forgotPassword();
                          },
                          theText: "نسيت كلمة المرور ؟"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
