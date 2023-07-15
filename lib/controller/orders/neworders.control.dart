import 'package:get/get.dart';
import 'package:hommer_admin/core/function/handel_data.dart';
import 'package:hommer_admin/core/status_request.dart';
import 'package:hommer_admin/data/model/orders_model.dart';
import 'package:hommer_admin/data/remote/main/orders.data.dart';

abstract class NewOrdersController extends GetxController {
  getTheNewOrders();
}

class NewOrdersControllerImp extends NewOrdersController {
  List<OrdersModel> orders = [];
  List orderresponse = [];
  StatusRequest statusRequest = StatusRequest.none;
  OrdersData orderdata = OrdersData(Get.find());
  @override
  void onInit() {
    getTheNewOrders();
    super.onInit();
  }

  @override
  getTheNewOrders() async {
    orders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderdata.neworder();
    statusRequest = handelData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        orderresponse = response['data'];
        // List responsedata = response['type'];

        orders.addAll(orderresponse.map((e) => OrdersModel.fromJson(e)));
        // categoryNamesList = catresponse
        //     .map((category) => category['category_name'] as String)
        //     .toList();
        // value = categoryNamesList.first;
        // update();

        // print(categoryNamesList);
      } else {}
    }
    statusRequest == StatusRequest.nodata;
    update();
  }
}
