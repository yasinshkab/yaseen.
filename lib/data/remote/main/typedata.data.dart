import 'package:hommer_admin/apilinks.dart';
import 'package:hommer_admin/core/crud.dart';
import 'package:hommer_admin/core/function/upload_with_image.dart';

class TypeData {
  Crud crud;

  TypeData(this.crud);
  getdata() async {
    var response = await crud.postData(ApiLinks.typespagelink, {});
    return response.fold((l) => l, (r) => r);
  }

  editdata(
      String typeid, String imagename, typename, typecategory, file) async {
    var response = await postDataWithImage(
        ApiLinks.edittypelink,
        {
          "typeid": typeid,
          "imagename": imagename,
          "typename": typename,
          "typecategory": typecategory,
        },
        file);
    return response.fold((l) => l, (r) => r);
  }

  deletedata(String typeid, String imagename) async {
    var response = await crud.postData(ApiLinks.deletetypelink, {
      "typeid": typeid,
      "imagename": imagename,
    });
    return response.fold((l) => l, (r) => r);
  }

  adddata(String typename, String typecategory, file) async {
    var response = await postDataWithImage(
        ApiLinks.addtypelink,
        {
          "typename": typename,
          "typecategory": typecategory,
        },
        file);
    return response.fold((l) => l, (r) => r);
  }

  editdataWithoutFile(
      String typeid, String imagename, typename, typecategory) async {
    var response = await crud.postData(
      ApiLinks.edittypelink,
      {
        "typeid": typeid,
        "imagename": imagename,
        "typename": typename,
        "typecategory": typecategory,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
