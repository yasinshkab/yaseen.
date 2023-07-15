import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hommer_admin/apilinks.dart';
import 'package:hommer_admin/controller/orders/orderdetails.control.dart';
import 'package:hommer_admin/core/constant/text_theme.dart';
import 'package:hommer_admin/core/handeldataview.dart';
// import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    OrderDetailsPageController control = Get.put(OrderDetailsPageController());
    return Scaffold(
        backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
        body: SafeArea(
            child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 1,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.66,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(style: operations, "تفاصيل الطلب"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<OrderDetailsPageController>(
                    builder: (controller) => HandelOrderDetailsdataview(
                          statusRequest: controller.statusRequest,
                          widget: Container(
                            width: MediaQuery.of(context).size.width * 0.66,
                            child: theorderdetails(
                              map: Container(
                                height: 360,
                                width: 600,
                                child: GoogleMap(
                                  markers: controller.markers.toSet(),
                                  mapType: MapType.normal,
                                  initialCameraPosition: CameraPosition(
                                    target: LatLng(
                                        double.parse(
                                            "${controller.ordersModel.addressLat}"),
                                        double.parse(
                                            "${controller.ordersModel.addressLong}")),
                                    zoom: 15.4746,
                                  ),
                                  onMapCreated:
                                      (GoogleMapController controller) {
                                    _controller.complete(controller);
                                  },
                                ),
                              ),
                              listview: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: controller.orderdetails.length,
                                  itemBuilder: (context, c) {
                                    return Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: Image(
                                                image: NetworkImage(
                                              "${ApiLinks.productimages}/${controller.orderdetails[c].productImage}",
                                            )),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SizedBox(
                                            width: 50,
                                            child: Text(
                                              "${controller.orderdetails[c].productName}",
                                              style: ordercontent,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const Spacer(),

                                          Text(
                                            "${controller.orderdetails[c].productscount}",
                                            style: ordercontent,
                                          ),

                                          // SizedBox(
                                          //     width: 12,
                                          //     child: Text(

                                          //       maxLines: 1,
                                          //       overflow: TextOverflow.ellipsis,
                                          //     )),
                                          const Spacer(),
                                          Text(
                                              '''${controller.orderdetails[c].productPriceDiscount}  د.ل''',
                                              style: ordercontent),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                              id: "${controller.ordersModel.orderId}",
                              //  productwidth:  MediaQuery.of(context).size.width * 0.4,
                              date: "${controller.ordersModel.orderDate}",
                              status: "${controller.ordersModel.orderStatus}",
                              totalprice:
                                  '${controller.ordersModel.orderPrice}',

                              ///
                              deliveryprice:
                                  '${controller.ordersModel.orderDeliveryprice}',
                              address:
                                  '${controller.ordersModel.addressCity},${controller.ordersModel.addressRegion}',
                              // theimage: "${orderDetails[c]['image']}",
                              thewidth: MediaQuery.of(context).size.width * 1,
                              count: controller.orderdetails.length,
                              addressdetails:
                                  '${controller.ordersModel.addressNote}',
                            ),
                          ),
                        )),
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
  required Widget map,
  required Widget listview,
  required double thewidth,
  required String date,
  required int count,
  required String addressdetails,
  required String id,
  required String status,
  required String totalprice,
  required String address,
  required String deliveryprice,
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
                              "تم استلامه",
                              style: ordercontent,
                            )
                          : status == "1"
                              ? Text(
                                  "قيد التنفيذ",
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
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                        color: const Color.fromARGB(255, 127, 125, 125),
                      ),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 110,
                            ),
                            Text(
                              "الإسم",
                              style: orderheads,
                            ),
                            const Spacer(),
                            Text(
                              "الكمية",
                              style: orderheads,
                            ),
                            const Spacer(),
                            Text(
                              "السعر",
                              style: orderheads,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                      Container(child: listview)
                    ],
                  )),
            ),
            //   Padding(padding: const EdgeInsets.all(8.0), child: products),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(address, style: ordercontent),
                            SizedBox(
                              height: 10,
                            ),
                            map,
                          ],
                        ),
                        const Spacer(),
                        // reOrderButton(
                        //   onPressed: () {},
                        // )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "تفاصيل العنوان :",
                          style: orderheads,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(addressdetails, style: ordercontent),
                        const Spacer(),
                        // reOrderButton(
                        //   onPressed: () {},
                        // )
                      ],
                    ),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       "مبلغ التوصيل :",
                    //       style: orderheads,
                    //     ),
                    //     const SizedBox(
                    //       width: 10,
                    //     ),
                    //     Text('''$deliveryprice  د.ل''', style: ordercontent),
                    //     const Spacer(),
                    //     // reOrderButton(
                    //     //   onPressed: () {},
                    //     // )
                    //   ],
                    // ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "إجمالي الطلب :",
                          style: orderheads,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text('''$totalprice  د.ل''', style: ordercoast),
                        const Spacer(),
                        // reOrderButton(
                        //   onPressed: () {},
                        // )
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
