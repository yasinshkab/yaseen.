import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hommer_admin/core/function/handel_data.dart';
import 'package:hommer_admin/core/status_request.dart';
import 'package:hommer_admin/data/model/order_details_model.dart';
import 'package:hommer_admin/data/model/orders_model.dart';
import 'package:hommer_admin/data/remote/main/orders.data.dart';

class OrderDetailsPageController extends GetxController {
  OrdersData orderdata = OrdersData(Get.find());
  List<Marker> markers = [];

  List<OrderDetailsModel> orderdetails = [];
  late OrdersModel ordersModel;
  StatusRequest statusRequest = StatusRequest.none;
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await orderdata.orderdetails(ordersModel.orderId!);
    statusRequest = handelData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        List responsedata = response['data'];

        orderdetails
            .addAll(responsedata.map((e) => OrderDetailsModel.fromJson(e)));
        print(responsedata);
      } else {
        StatusRequest.nodata == statusRequest;
      }
    }
    update();
  }

  approve() async {
    var response = await orderdata.orderapprove(
        ordersModel.orderId!, ordersModel.orderUser!);
    statusRequest = handelData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        Get.back();
      } else {
        StatusRequest.nodata == statusRequest;
      }
    }
    update();
  }

  done() async {
    var response =
        await orderdata.orderdone(ordersModel.orderId!, ordersModel.orderUser!);
    statusRequest = handelData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        Get.back();
      } else {
        StatusRequest.nodata == statusRequest;
      }
    }
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    markers.clear();
    markers.add(Marker(
      markerId: const MarkerId("1"),
      position: LatLng(double.parse("${ordersModel.addressLat}"),
          double.parse("${ordersModel.addressLong}")),
    ));
    getData();
    super.onInit();
  }
}
