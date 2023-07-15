import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hommer_admin/core/function/handel_data.dart';
import 'package:hommer_admin/core/services/services.dart';
import 'package:hommer_admin/core/status_request.dart';
import 'package:hommer_admin/data/remote/auth/login.data.dart';

abstract class LoginController extends GetxController {
  login();
  forgotPassword();

  goToDashboard();
  goToOTP();
}

class LoginControllerImp extends LoginController {
  var formKey = GlobalKey<FormState>();
  MyServices myServices = Get.find();
  late TextEditingController email;
  late TextEditingController password;
  bool isObscure = true;
  bool remeberMe = false;
  StatusRequest statusRequest = StatusRequest.none;

  LoginData logindata = LoginData(Get.find());
  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  login() async {
    var formdata = formKey.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await logindata.postdata(password.text, email.text);

      // var response = await testdata.getdata();
      statusRequest = handelData(response);
      print(response);
      print('//////////////////////////////////////////////////');

      if (StatusRequest.sucess == statusRequest) {
        if (response['status'] == 'success' &&
            response['data']['admin_approve'] == '1') {
          myServices.sharedPreferences
              .setString("id", response['data']['admin_id']);
          myServices.sharedPreferences
              .setString("username", response['data']['admin_username']);
          myServices.sharedPreferences
              .setString("email", response['data']['admin_email']);

          goToDashboard();
        } else if (response['status'] == 'success' &&
            response['data']['admin_approve'] == '0') {
          myServices.sharedPreferences
              .setString("id", response['data']['admin_id']);
          myServices.sharedPreferences
              .setString("username", response['data']['admin_username']);
          myServices.sharedPreferences
              .setString("email", response['data']['admin_email']);
          goToOTP();

          statusRequest == StatusRequest.nodata;
        }
      }
      update();
    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToOTP() {
    var locale = const Locale('en', 'US');
    Get.updateLocale(locale);
    Get.toNamed("/verifyemail", arguments: {
      "email": email.text,
    });
  }

  @override
  goToDashboard() {
    Get.toNamed(
      "/dashboard",
    );
  }

  @override
  forgotPassword() {
    Get.toNamed("/checkemail");
  }
}
