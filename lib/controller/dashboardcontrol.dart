import 'package:get/get.dart';
import 'package:hommer_admin/core/services/services.dart';
import 'package:hommer_admin/core/status_request.dart';

abstract class DashBoardController extends GetxController {}

class DashBoardControllerImp extends DashBoardController {
  String? name;
  StatusRequest? statusRequest;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    name = myServices.sharedPreferences.getString("username");
    super.onInit();
  }
}
