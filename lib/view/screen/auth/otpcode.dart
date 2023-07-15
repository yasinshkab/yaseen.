import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:hommer_admin/controller/auth/resetpassword/otp.control.dart';
import 'package:hommer_admin/core/constant/text_theme.dart';
import 'package:hommer_admin/view/widget/the_buttons.dart';

class OTPCODE extends StatelessWidget {
  const OTPCODE({super.key});

  @override
  Widget build(BuildContext context) {
    OTPControllerImp controller = Get.put(OTPControllerImp());

    return Scaffold(
        backgroundColor: Colors.red[300],
        body: Center(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                child: Container(
                    height: 340,
                    width: 300,
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
                                //SizedBox(height: 10,),
                                Text(
                                  textAlign: TextAlign.center,
                                  style: thesubTitle,
                                  " OTP أدخل رمز",
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  "لقد تم إرسال الرمز إليك",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(31, 31, 31, 1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                OtpTextField(
                                    inputFormatters: [],
                                    keyboardType: TextInputType.number,
                                    fieldWidth: 50,
                                    numberOfFields: 4,
                                    borderColor: Colors.grey,
                                    focusedBorderColor:
                                        const Color.fromRGBO(226, 33, 38, 1),
                                    showFieldAsBox: false,
                                    borderWidth: 4.0,
                                    //runs when a code is typed in
                                    onCodeChanged: (String code) {
                                      //handle validation or checks here if necessary
                                    },
                                    //runs when every textfield is filled
                                    onSubmit: (String verificationCode) {
                                      controller.goToresetPassword(
                                          verificationCode); //   controller.goToHome(verificationCode);
                                    }),
                                const SizedBox(
                                  height: 25,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        textButton(
                                            onPressed: () {
                                              controller.resend();
                                            },
                                            theText: "إعادة الإرسال"),
                                        SizedBox(
                                          height: 7,
                                        )
                                      ],
                                    ),
                                    const Text(
                                      "لم يصلك الرمز بعد؟",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromRGBO(31, 31, 31, 1),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 175,
                                ),
                              ]),
                        ),
                      ),
                    )))));
  }
}
