import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hommer_admin/controller/orders/inprogress.control.dart';
import 'package:hommer_admin/core/constant/text_theme.dart';
import 'package:hommer_admin/core/handeldataview.dart';
import 'package:hommer_admin/view/widget/the_buttons.dart';

class InprogressOrders extends StatelessWidget {
  const InprogressOrders({super.key});

  @override
  Widget build(BuildContext context) {
    InProgressControllerImp control = Get.put(InProgressControllerImp());
    return Center(
        child: GetBuilder<InProgressControllerImp>(
      builder: (controller) => Handeldataview(
        statusRequest: controller.statusRequest,
        widget: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 100,
                ),
                Text(
                  "الطلبات قيد التنفيذ",
                  style: header,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.70,
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
                    padding: const EdgeInsets.fromLTRB(30, 30, 55, 10),
                    child: Column(
                      children: [
                        Row(children: [
                          Text(
                            'العمليات',
                            style: operations,
                          )
                        ]),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 2,
                          color: const Color.fromRGBO(175, 175, 175, 1),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 50,
                            ),
                            Text(
                              "رقم الطلب",
                              style: lastoperations,
                            ),
                            const SizedBox(
                              width: 125,
                            ),
                            Text(
                              "المنطقة",
                              style: lastoperations,
                            ),
                            const SizedBox(
                              width: 125,
                            ),
                            Text(
                              "تاريخ الطلب",
                              style: lastoperations,
                            ),
                            const SizedBox(
                              width: 125,
                            ),
                            Text(
                              "الحالة",
                              style: lastoperations,
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 68,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ...List.generate(
                                  controller.orders.length,
                                  (index) => Column(
                                    children: [
                                      Container(
                                        width: 80,
                                        child: Center(
                                          child: Text(
                                            "${controller.orders[index].orderId}",
                                            style: mainListItem,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 160,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ...List.generate(
                                  controller.orders.length,
                                  (index) => Column(
                                    children: [
                                      Container(
                                        width: 100,
                                        child: Text(
                                          "${controller.orders[index].addressRegion}",
                                          style: mainListItem,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 115,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ...List.generate(
                                  controller.orders.length,
                                  (index) => Column(
                                    children: [
                                      Container(
                                        width: 125,
                                        child: Text(
                                          "${controller.orders[index].orderDate}",
                                          style: mainListItem,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 110,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ...List.generate(
                                    controller.orders.length,
                                    (index) => Column(
                                          children: [
                                            "${controller.orders[index].orderStatus}" ==
                                                    "1"
                                                ? Container(
                                                    width: 100,
                                                    child: Center(
                                                      child: Text(
                                                        "قيد التنفيذ",
                                                        style: mainListItem,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  )
                                                : "${controller.orders[index].orderStatus}" ==
                                                        "2"
                                                    ? Container(
                                                        width: 100,
                                                        child: Center(
                                                          child: Text(
                                                            "مكتمل",
                                                            style: mainListItem,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      )
                                                    : "${controller.orders[index].orderStatus}" ==
                                                            "3"
                                                        ? Container(
                                                            width: 100,
                                                            child: Center(
                                                              child: Text(
                                                                "ملغي",
                                                                style:
                                                                    mainListItem,
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                          )
                                                        : Text(
                                                            "",
                                                            style: mainListItem,
                                                          ),
                                            const SizedBox(
                                              height: 10,
                                            )
                                          ],
                                        )),
                              ],
                            ),
                            const SizedBox(
                              width: 48,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ...List.generate(
                                    controller.orders.length,
                                    (index) => Column(
                                          children: [
                                            textButtonofmenu(
                                                onPressed: () {
                                                  Get.toNamed(
                                                      "/inprogressorderderails",
                                                      arguments: {
                                                        "ordersmodel":
                                                            controller
                                                                .orders[index]
                                                      });
                                                },
                                                listdata:
                                                    controller.orders[index],
                                                theText: "التفاصيل"),
                                            SizedBox(
                                              height: 10,
                                            )
                                          ],
                                        )),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ))),
            const SizedBox(
              height: 40,
            ),
          ]),
        ),
      ),
    ));
  }
}