import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:hommer_admin/core/function/handel_data.dart';
import 'package:hommer_admin/core/status_request.dart';
import 'package:hommer_admin/data/remote/main/slider.data.dart';

abstract class SliderController extends GetxController {
  getTheImages();
  adddata(files);
  deletedata(
    String id,
    String imagename,
  );
}

class SliderControllerImp extends SliderController {
  List sliderresponse = [];
  PlatformFile? file;

  StatusRequest statusRequest = StatusRequest.none;
  SliderData sliderdata = SliderData(Get.find());
  @override
  void onInit() {
    getTheImages();
    super.onInit();
  }

  @override
  getTheImages() async {
    sliderresponse.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await sliderdata.getdata();
    statusRequest = handelData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        sliderresponse = response['data'];
      } else {}
    }
    statusRequest == StatusRequest.nodata;
    update();
  }

  @override
  adddata(files) async {
    await sliderdata.adddata(files);
    getTheImages();
  }

  @override
  deletedata(String id, String imagename) async {
    StatusRequest statusRequest = StatusRequest.loading;
    update();
    var response = await sliderdata.deletedata(
      id,
      imagename,
    );
    if (response['status'] == 'success') {
      getTheImages();
    } else {}
    statusRequest == StatusRequest.nodata;
    update();
  }
}
