import 'package:get/get.dart';
import 'package:hommer_admin/core/function/handel_data.dart';
import 'package:hommer_admin/core/status_request.dart';
import 'package:hommer_admin/data/model/service_model.dart';
import 'package:hommer_admin/data/remote/main/services.data.dart';

abstract class ACArchiveController extends GetxController {
  getacarchive();
}

class ACArchiveControllerImp extends ACArchiveController {
  List<ServiceModel> serviceorders = [];
  List orderresponse = [];
  StatusRequest statusRequest = StatusRequest.none;
  ServicesData servicesdata = ServicesData(Get.find());
  @override
  void onInit() {
    getacarchive();
    super.onInit();
  }

  @override
  getacarchive() async {
    serviceorders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await servicesdata.acarchive();
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
