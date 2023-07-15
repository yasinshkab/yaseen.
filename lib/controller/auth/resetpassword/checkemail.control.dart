import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hommer_admin/core/function/handel_data.dart';
import 'package:hommer_admin/core/status_request.dart';
import 'package:hommer_admin/data/remote/auth/resetpassword/checkemail.data.dart';

abstract class CheckEmailController extends GetxController {
  goToOTP();
}

class CheckEmailControllerImp extends CheckEmailController {
  var formKey = GlobalKey<FormState>();

  late TextEditingController theemail;
  CheckEmailData checkemaildata = CheckEmailData(Get.find());
  StatusRequest? statusRequest;
  @override
  goToOTP() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await checkemaildata.postdata(theemail.text);

    // var response = await testdata.getdata();
    statusRequest = handelData(response);
    print(response);
    print('//////////////////////////////////////////////////');

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        var locale = const Locale('en', 'US');
        Get.updateLocale(locale);
        Get.toNamed("/otpcode", arguments: {'email': theemail.text});
      } else {
        print("heeeeeeeeeeyyyyyyyyyyyyy");
        statusRequest == StatusRequest.nodata;
      }
    }
    update();
  }

  @override
  void onInit() {
    theemail = TextEditingController();
    super.onInit();
  }
}
