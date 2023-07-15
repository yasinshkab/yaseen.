import 'package:get/get.dart';
import 'package:hommer_admin/core/function/handel_data.dart';
import 'package:hommer_admin/core/status_request.dart';
import 'package:hommer_admin/data/model/service_model.dart';
import 'package:hommer_admin/data/remote/main/services.data.dart';

abstract class ACservicesController extends GetxController {
  getnewserviceorders();
}

class ACservicesControllerImp extends ACservicesController {
  List<ServiceModel> serviceorders = [];
  List orderresponse = [];
  StatusRequest statusRequest = StatusRequest.none;
  ServicesData servicesdata = ServicesData(Get.find());
  @override
  void onInit() {
    getnewserviceorders();
    super.onInit();
  }

  @override
  getnewserviceorders() async {
    serviceorders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await servicesdata.newacservice();
    statusRequest = handelData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        orderresponse = response['data'];
        serviceorders
            .addAll(orderresponse.map((e) => ServiceModel.fromJson(e)));
      } else {}
    }
    statusRequest == StatusRequest.nodata;
    update();
  }
}
