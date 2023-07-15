import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hommer_admin/core/function/handel_data.dart';
import 'package:hommer_admin/core/status_request.dart';
import 'package:hommer_admin/data/remote/auth/resetpassword/otpcode.data.dart';

abstract class OTPController extends GetxController {
  goToresetPassword(
    String verificationCode,
  );
}

class OTPControllerImp extends OTPController {
  String? email;
  OTPData otpdata = OTPData(Get.find());
  StatusRequest? statusRequest;

  @override
  goToresetPassword(
    String verificationCode,
  ) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await otpdata.otpdata(
      verificationCode,
      email!,
    );

    statusRequest = handelData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        var locale = const Locale('ar', 'AE');

        Get.updateLocale(locale);

        Get.toNamed("/resetPassword", arguments: {
          'email': email,
        });
      } else if (statusRequest == StatusRequest.serverfailure) {
        // thesnackBar(
        //   context,
        //   theColor: const Color.fromRGBO(228, 59, 64, 1),
        //   theText: "حدث خطأ عند الإتصال بالخادم",
        //   theicon: const Icon(
        //     Icons.warning_amber_outlined,
        //     color: Color.fromRGBO(255, 255, 255, 1),
        //   ),
        // );
      } else if (statusRequest == StatusRequest.noInternet) {
        // thesnackBar(
        //   context,
        //   theColor: const Color.fromRGBO(228, 59, 64, 1),
        //   theText: "لا يوجد اتصال باللإنترنت",
        //   theicon: const Icon(
        //     Icons.warning_amber_outlined,
        //     color: Color.fromRGBO(255, 255, 255, 1),
        //   ),
        // );
      } else {
        StatusRequest.nodata == statusRequest;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  resend() {
    otpdata.resendCode(email!);
  }
}
