import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hommer_admin/controller/notification.control.dart';
import 'package:hommer_admin/core/constant/text_theme.dart';
import 'package:hommer_admin/core/function/valid_input.dart';
import 'package:hommer_admin/core/handeldataview.dart';
import 'package:hommer_admin/view/widget/form_field.dart';
import 'package:hommer_admin/view/widget/the_buttons.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationsControllerImp control = Get.put(NotificationsControllerImp());
    return GetBuilder<NotificationsControllerImp>(
        builder: (controller) => Handeldataview(
            statusRequest: controller.statusRequest,
            widget: Center(
                child: SingleChildScrollView(
                    child: Form(
              key: controller.formKey,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    // height: MediaQuery.of(context).size.height * 0.65,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.black.withOpacity(.15),
                          spreadRadius: 0.08,
                          offset: const Offset(0, 4),
                        )
                      ],
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(children: [
                                Text(
                                  'إرسال إشعار',
                                  style: operations,
                                ),
                              ]),
                              const SizedBox(
                                height: 50,
                              ),
                              SizedBox(
                                width: 750,
                                child: formFeilds(
                                  theController: controller.title,
                                  valid: (val) {
                                    return validInput(val!, 3, 10, "");
                                  },
                                  theLabel: "العنوان",
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              SizedBox(
                                width: 750,
                                child: formFeilds(
                                  theController: controller.massage,
                                  valid: (val) {
                                    return validInput(val!, 8, 60, "");
                                  },
                                  theLabel: "الرسالة",
                                ),
                              ),
                              const SizedBox(
                                height: 100,
                              ),
                              sendnotificationButton(
                                  onPressed: () {
                                    controller.sendmassage(context);
                                  },
                                  theText: 'إرسال'),
                            ]))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                )
              ]),
            )))));
  }
}
