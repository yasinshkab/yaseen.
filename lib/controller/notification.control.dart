import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hommer_admin/core/function/handel_data.dart';
import 'package:hommer_admin/core/services/services.dart';
import 'package:hommer_admin/core/status_request.dart';
import 'package:hommer_admin/data/remote/main/notification.data.dart';
import 'package:hommer_admin/view/widget/message.dart';

abstract class NotificationsController extends GetxController {
  sendmassage(BuildContext context);
}

class NotificationsControllerImp extends NotificationsController {
  late TextEditingController massage;
  late TextEditingController title;

  NotificationData notificationdata = NotificationData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  var formKey = GlobalKey<FormState>();

  @override
  sendmassage(BuildContext context) async {
    var formdata = formKey.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await notificationdata.sendmassage(massage.text, title.text);
      statusRequest = handelData(response);
      if (StatusRequest.sucess == statusRequest) {
        if (response['status'] == 'success') {
          thesnackBar(
            context,
            theColor: const Color.fromRGBO(3, 210, 90, 1),
            theText: "تم الإرسال بنجاح",
            theicon: const Icon(
              Icons.check_circle_outlined,
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
          );
          massage.text = "";
          title.text = "";
          update();
        } else {
          statusRequest == StatusRequest.nodata;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    massage = TextEditingController();
    title = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    massage.dispose();
    title.dispose();
    super.dispose();
  }
}
