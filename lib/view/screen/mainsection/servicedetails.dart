import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hommer_admin/controller/services/servicedetails.control.dart';
import 'package:hommer_admin/core/constant/text_theme.dart';
import 'package:hommer_admin/view/widget/the_buttons.dart';
// import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceDetailsPageController controller =
        Get.put(ServiceDetailsPageController());
    return Scaffold(
        backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
        body: SafeArea(
            child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 1,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.66,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(style: operations, " تفاصيل طلب الخدمة"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.66,
                  child: theorderdetails(
                    button: Column(
                      children: [
                        "${controller.serviceModel.serviceStatus}" == "0"
                            ? Row(
                                children: [
                                  approve(
                                    onPressed: () {
                                      controller.approve();
                                    },
                                    title: "قبول الطلب",
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  approve(
                                    onPressed: () {
                                      controller.cancel();
                                    },
                                    title: "إلغاء",
                                  )
                                ],
                              )
                            : Text(
                                "",
                                style: mainListItem,
                              ),
                      ],
                    ),
                    id: "${controller.serviceModel.serviceId}",
                    date: "${controller.serviceModel.serviceTime}",
                    status: "${controller.serviceModel.serviceStatus}",
                    number: '${controller.serviceModel.serviceUsernumber}',
                    servicetype: '${controller.serviceModel.serviceType}',
                    device: '${controller.serviceModel.serviceDevice}',
                    name: '${controller.serviceModel.serviceName}',
                    address: '${controller.serviceModel.serviceRegion}',
                    thewidth: MediaQuery.of(context).size.width * 1,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                )
              ]),
            ),
          ),
        )));
  }
}

Widget theorderdetails({
  required Widget button,
  required double thewidth,
  required String date,
  required String id,
  required String status,
  required String number,
  required String address,
  required String name,
  required String device,
  required String servicetype,
  // required String theimage,
}) =>
// boxShadow: [
//   BoxShadow(
//     color:
//         const Color.fromARGB(31, 31, 31, 34).withOpacity(0.3),
//     spreadRadius: 1,
//     blurRadius: 4,
//     offset: const Offset(0, 4),
//   )
// ],
//////////////////////////////
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: thewidth,
        //    MediaQuery.of(context).size.width * 0.8,
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
            borderRadius: BorderRadius.circular(24)),
        /////////////////
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "رقم الطلب",
                        style: orderheads,
                      ),
                      Text(id, style: ordercontent),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        "تاريخ الطلب",
                        style: orderheads,
                      ),
                      Text(date, style: ordercontent),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        "الحالة",
                        style: orderheads,
                      ),
                      status == "0"
                          ? Text(
                              "جديد",
                              style: ordercontent,
                            )
                          : status == "1"
                              ? Text(
                                  "منتهي",
                                  style: ordercontent,
                                )
                              : status == "2"
                                  ? Text(
                                      "مكتمل",
                                      style: ordercontent,
                                    )
                                  : status == "3"
                                      ? Text(
                                          "ملغي",
                                          style: ordercontent,
                                        )
                                      : Text(
                                          "",
                                          style: ordercontent,
                                        )
                    ],
                  ),
                ],
              ),
            ),

            //   Padding(padding: const EdgeInsets.all(8.0), child: products),
            Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "الإسم:",
                          style: orderheads,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(name, style: ordercontent),
                        const Spacer(),
                        // reOrderButton(
                        //   onPressed: () {},
                        // )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "رقم الهاتف:",
                          style: orderheads,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(number, style: ordercontent),
                        const Spacer(),
                        // reOrderButton(
                        //   onPressed: () {},
                        // )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "العنوان :",
                          style: orderheads,
                        ),
                        const SizedBox(
                          width: 10,
                        ),

                        Text(address, style: ordercontent),

                        const Spacer(),
                        // reOrderButton(
                        //   onPressed: () {},
                        // )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "نوع الخدمة:",
                          style: orderheads,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text('''$servicetype ''', style: ordercontent),
                        const Spacer(),
                        // reOrderButton(
                        //   onPressed: () {},
                        // )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "نوع الجهاز:",
                          style: orderheads,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(device, style: ordercontent),
                        const Spacer(),
                        button
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
