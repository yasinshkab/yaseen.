import 'package:hommer_admin/apilinks.dart';
import 'package:hommer_admin/core/crud.dart';
import 'package:hommer_admin/core/function/upload_with_image.dart';

class SliderData {
  Crud crud;

  SliderData(this.crud);
  getdata() async {
    var response = await crud.postData(ApiLinks.sliderviewlink, {});
    return response.fold((l) => l, (r) => r);
  }

  deletedata(String sliderid, String imagename) async {
    var response = await crud.postData(ApiLinks.sliderdeletelink, {
      "sliderId": sliderid,
      "imagename": imagename,
    });
    return response.fold((l) => l, (r) => r);
  }

  adddata(file) async {
    var response = await postDataWithImage(
        ApiLinks.slideraddlink,
        {
          "null": "null",
        },
        file);
    return response.fold((l) => l, (r) => r);
  }
}
