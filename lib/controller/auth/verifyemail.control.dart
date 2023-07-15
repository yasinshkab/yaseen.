import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hommer_admin/core/function/handel_data.dart';
import 'package:hommer_admin/core/status_request.dart';
import 'package:hommer_admin/data/remote/auth/resetpassword/otpcode.data.dart';

abstract class VerifyEmailController extends GetxController {
  goToHome(String verificationCode);
  resend();
}

class VerifyEmailControllerImp extends VerifyEmailController {
  String? email;
  StatusRequest? statusRequest;
  OTPData otpdata = OTPData(Get.find());

  @override
  goToHome(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await otpdata.verifydata(
      verificationCode,
      email!,
    );

    statusRequest = handelData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        var locale = const Locale('ar', 'AE');

        Get.updateLocale(locale);

        Get.toNamed("/dashboard");
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

  @override
  resend() {
    otpdata.resendCode(email!);
  }
}
