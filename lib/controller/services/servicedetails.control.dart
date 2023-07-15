import 'package:get/get.dart';
import 'package:hommer_admin/core/function/handel_data.dart';
import 'package:hommer_admin/core/status_request.dart';
import 'package:hommer_admin/data/model/service_model.dart';
import 'package:hommer_admin/data/remote/main/services.data.dart';

class ServiceDetailsPageController extends GetxController {
  late ServiceModel serviceModel;
  StatusRequest statusRequest = StatusRequest.none;
  ServicesData orderdata = ServicesData(Get.find());

  approve() async {
    var response = await orderdata.approve(serviceModel.serviceId!);
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

  cancel() async {
    var response = await orderdata.cancel(serviceModel.serviceId!);
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
    serviceModel = Get.arguments['servicemodel'];

    super.onInit();
  }
}
