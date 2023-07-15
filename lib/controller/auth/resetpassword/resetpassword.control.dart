import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hommer_admin/core/function/handel_data.dart';
import 'package:hommer_admin/core/status_request.dart';
import 'package:hommer_admin/data/remote/auth/resetpassword/resetpassword.data.dart';

abstract class ResetPasswordController extends GetxController {
  resetpassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  var formKey = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController repassword;
  String? email;
  StatusRequest? statusRequest;
  bool isObscure = true;

  ResetPasswordData resetdata = ResetPasswordData(Get.find());

  @override
  resetpassword() async {
    var formdata = formKey.currentState;
    if (formdata!.validate()) {
      if (password.text == repassword.text) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await resetdata.postdata(
          email!,
          password.text,
        );

        // var response = await testdata.getdata();
        statusRequest = handelData(response);
        print(response);
        print(email);
        print('?????????????');

        if (StatusRequest.sucess == statusRequest) {
          if (response['status'] == 'success') {
            // thesnackBar(
            //   context,
            //   theColor: Color.fromRGBO(3, 210, 90, 1),
            //   theText: "تم إعادة تعيين كلمة المرور  بنجاح",
            //   theicon: Icon(
            //     Icons.check_circle_outlined,
            //     color: Color.fromRGBO(255, 255, 255, 1),
            //   ),
            // );
            //Future.delayed(Duration(seconds: 4))
            //    .then((value) =>
            Get.offAllNamed("/login");
            //     );
          } else {
            statusRequest == StatusRequest.nodata;
          }
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
        }
        update();
      }
    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];

    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    super.dispose();
  }
}
