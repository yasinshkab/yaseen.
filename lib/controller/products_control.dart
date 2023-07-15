import 'package:file_picker/file_picker.dart';
import 'package:file_picker/src/platform_file.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hommer_admin/core/function/handel_data.dart';
import 'package:hommer_admin/core/services/services.dart';
import 'package:hommer_admin/core/status_request.dart';
import 'package:hommer_admin/data/model/products_model.dart';
import 'package:hommer_admin/data/remote/main/products.data.dart';

abstract class ProductsController extends GetxController {
  editdata(String productid, String imagename, String producttype, files);
  adddata(String producttype, files);
  deletedata(
    String id,
    String imagename,
  );
  getTheProducts();
}

class ProductsControllerImp extends ProductsController {
  List<ProductsModel> products = [];
  late TextEditingController name;
  late TextEditingController productcode;
  late TextEditingController productcount;
  late TextEditingController productprice;
  late TextEditingController productdiscount;

  var formKey = GlobalKey<FormState>();
  String value = "";
  List<String> categoryNamesList = [];
  List<String> categoryIdsList = [];
  ProductsData productdata = ProductsData(Get.find());
  // String? h;
  // List<String>? categoryNamesList;
  // List<String>? categoryIdList;
  //List? catresponse;
  String selectedWM = 'ظاهر';
  String active = '1';
  Map machine = {
    'مخفي': '0',
    'ظاهر': '1',
  };

  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List productsresponse = [];
  PlatformFile? file;
  List responsedata = [];
  @override
  adddata(String producttype, files) async {
    await productdata.adddata(name.text, productcode.text, productcount.text,
        productprice.text, producttype, productdiscount.text, files);
    getTheProducts();
  }

  @override
  deletedata(String id, String imagename) async {
    StatusRequest statusRequest = StatusRequest.loading;
    update();
    await productdata.deletedata(
      id,
      imagename,
    );
    products.removeWhere((element) => element.productId == id);

    statusRequest == StatusRequest.nodata;
    update();
  }

  @override
  getTheProducts() async {
    products.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await productdata.getdata();
    statusRequest = handelData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        productsresponse = response['products'];
        responsedata = response['type'];

        products.addAll(productsresponse.map((e) => ProductsModel.fromJson(e)));

        categoryNamesList =
            responsedata.map((type) => type['type_name'] as String).toList();
        categoryIdsList =
            responsedata.map((type) => type['type_id'] as String).toList();

        value = categoryNamesList.first;
        update();
      } else {
        statusRequest == StatusRequest.nodata;
      }
    }
    update();
  }

  @override
  void onInit() {
    getTheProducts();
    name = TextEditingController();
    productcount = TextEditingController();
    productcode = TextEditingController();
    productprice = TextEditingController();
    productdiscount = TextEditingController();
    super.onInit();
  }

  @override
  editdata(
    String productid,
    String imagename,
    String producttype,
    files,
  ) async {
    StatusRequest statusRequest = StatusRequest.loading;
    update();
    var response = await productdata.editdata(
        productid,
        imagename,
        name.text,
        productcode.text,
        productcount.text,
        productprice.text,
        producttype,
        productdiscount.text,
        active,
        files);
    statusRequest = handelData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        print(response);
      }
    }
    statusRequest == StatusRequest.nodata;
    update();
  }

  pickimage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      file = result.files.first;
    }
  }
}
