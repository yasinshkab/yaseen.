import 'package:hommer_admin/apilinks.dart';
import 'package:hommer_admin/core/crud.dart';
import 'package:hommer_admin/core/function/upload_with_image.dart';

class ProductsData {
  Crud crud;

  ProductsData(this.crud);
  getdata() async {
    var response = await crud.postData(ApiLinks.productspagelink, {});
    return response.fold((l) => l, (r) => r);
  }

  editdata(
      String productid,
      String imagename,
      String productname,
      String productcode,
      String productcount,
      String productprice,
      String producttype,
      String productdiscount,
      String productactive,
      file) async {
    var response = await postDataWithImage(
        ApiLinks.editproductlink,
        {
          "productid": productid,
          "imagename": imagename,
          "productname": productname,
          "productcode": productcode,
          "productcount": productcount,
          "productprice": productprice,
          "producttype": producttype,
          "productdiscount": productdiscount,
          "productactive": productactive,
        },
        file);
    return response.fold((l) => l, (r) => r);
  }

  deletedata(String productid, String imagename) async {
    var response = await crud.postData(ApiLinks.deleteproductlink, {
      "productid": productid,
      "imagename": imagename,
    });
    return response.fold((l) => l, (r) => r);
  }

  adddata(
      String productname,
      String productcode,
      String productcount,
      String productprice,
      String producttype,
      String productdiscount,
      file) async {
    var response = await postDataWithImage(
        ApiLinks.addproductlink,
        {
          "productname": productname,
          "productcode": productcode,
          "productcount": productcount,
          "productprice": productprice,
          "producttype": producttype,
          "productdiscount": productdiscount,
        },
        file);
    return response.fold((l) => l, (r) => r);
  }
}
