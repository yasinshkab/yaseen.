import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hommer_admin/controller/sections/main.control.dart';
import 'package:hommer_admin/core/constant/text_theme.dart';
import 'package:hommer_admin/core/handeldataview.dart';
import 'package:hommer_admin/view/widget/overview_item.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    MainPageControllerImp control = Get.put(MainPageControllerImp());

    return Container(
        child: Center(
            child: GetBuilder<MainPageControllerImp>(
      builder: (controller) => Handeldataview(
        statusRequest: controller.statusRequest,
        widget: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // coupon(onPressed: () async {
                //   controller.categoryid = controller.weeksales.firstWhere(
                //     (item) => item['DayOfWeek'] == '6',
                //   );

                //   // print(controller.categoryid);
                // }),
                overViewItem(
                  thenumber: '${controller.costumerCount}',
                  title: 'الزبائن',
                  icon: const Icon(
                    Icons.people_alt_outlined,
                    color: Color.fromRGBO(209, 29, 34, 1),
                    size: 85,
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                overViewItem(
                  thenumber: '${controller.ordersCount}',
                  title: 'الطلبات',
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Color.fromRGBO(209, 29, 34, 1),
                    size: 85,
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                overViewItem(
                  thenumber: '${controller.productsCount}',
                  title: 'المنتجات',
                  icon: const Icon(
                    Icons.category_outlined,
                    color: Color.fromRGBO(209, 29, 34, 1),
                    size: 85,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.66,
                height: MediaQuery.of(context).size.height * 0.65,
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
                    padding: const EdgeInsets.fromLTRB(55, 30, 55, 10),
                    child: Column(
                      children: [
                        Row(children: [
                          Text(
                            'العمليات الأخيرة',
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
                              "الإسم",
                              style: lastoperations,
                            ),
                            const SizedBox(
                              width: 175,
                            ),
                            Text(
                              "رقم الطلب",
                              style: lastoperations,
                            ),
                            const SizedBox(
                              width: 110,
                            ),
                            Text(
                              "تاريخ الطلب",
                              style: lastoperations,
                            ),
                            const SizedBox(
                              width: 110,
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
                              width: 22,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ...List.generate(
                                  controller.operations.length,
                                  (index) => Column(
                                    children: [
                                      SizedBox(
                                        width: 140,
                                        child: Text(
                                          "${controller.operations[index].userName}",
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
                              width: 125,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ...List.generate(
                                  controller.operations.length,
                                  (index) => Column(
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: Center(
                                          child: Text(
                                            "${controller.operations[index].orderId}",
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
                              width: 140,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ...List.generate(
                                  controller.operations.length,
                                  (index) => Column(
                                    children: [
                                      SizedBox(
                                        width: 125,
                                        child: Text(
                                          "${controller.operations[index].orderDate}",
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
                              width: 100,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ...List.generate(
                                    controller.operations.length,
                                    (index) => Column(
                                          children: [
                                            "${controller.operations[index].orderStatus}" ==
                                                    "0"
                                                ? SizedBox(
                                                    width: 100,
                                                    child: Center(
                                                      child: Text(
                                                        "تم استلامه",
                                                        style: mainListItem,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  )
                                                : "${controller.operations[index].orderStatus}" ==
                                                        "1"
                                                    ? SizedBox(
                                                        width: 100,
                                                        child: Center(
                                                          child: Text(
                                                            "قيد التنفيذ",
                                                            style: mainListItem,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      )
                                                    : "${controller.operations[index].orderStatus}" ==
                                                            "2"
                                                        ? SizedBox(
                                                            width: 100,
                                                            child: Center(
                                                              child: Text(
                                                                "مكتمل",
                                                                style:
                                                                    mainListItem,
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                          )
                                                        : "${controller.operations[index].orderStatus}" ==
                                                                "3"
                                                            ? SizedBox(
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
                                                                style:
                                                                    mainListItem,
                                                              ),
                                            const SizedBox(
                                              height: 10,
                                            )
                                          ],
                                        )),
                              ],
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                          ],
                        ),
                      ],
                    ))),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.66,
              height: MediaQuery.of(context).size.height * 0.65,
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
                  padding: const EdgeInsets.fromLTRB(55, 30, 55, 10),
                  child: Column(children: [
                    Row(children: [
                      Text(
                        'الطلبات',
                        style: operations,
                      )
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      series: <ColumnSeries<SalesData, String>>[
                        ColumnSeries<SalesData, String>(
                          dataSource: controller.chartData,
                          xValueMapper: (SalesData sales, _) => sales.day,
                          yValueMapper: (SalesData sales, _) => sales.sales,
                          color: const Color.fromRGBO(209, 29, 34, 1),
                          width: 0.4,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          spacing: 0.001,
                          dataLabelSettings: const DataLabelSettings(isVisible: true),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ])),
            ),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    )));
  }
}

class SalesData {
  SalesData(
    this.day,
    this.sales,
  );

  final String day;
  final double sales;
}
