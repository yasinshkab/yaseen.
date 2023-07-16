import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hommer_admin/core/function/handel_data.dart';
import 'package:hommer_admin/core/status_request.dart';
import 'package:hommer_admin/data/model/type_model.dart';
import 'package:hommer_admin/data/remote/main/typedata.data.dart';

abstract class TypeAddController extends GetxController {
  editdata(String id, String imagename, String typename, String typecat, files);
  adddata(String typename, String typecat, files);
  deletedata(
    String id,
    String imagename,
  );
  getTheTypes();
  editDataWithouttheFile(
    String id,
    String imagename,
    String typename,
    String typecat,
  );
}

class TypeAddControllerImp extends TypeAddController {
  List<String> categoryNamesList = [];
  List<TypeModel> types = [];
  List<String> categoryIdsList = [];
  List catresponse = [];
  late TextEditingController name;
  var formKey = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  TypeData typedata = TypeData(Get.find());
  String value = "";

  PlatformFile? file;
  @override
  void onInit() {
    getTheTypes();
    name = TextEditingController();

    super.onInit();
  }

  // gg() {
  //   categoryNamesList = catresponse!
  //       .map((category) => category['category_name'] as String)
  //       .toList();
  //   print(categoryNamesList);
  //   statusRequest == StatusRequest.nodata;
  //   update();
  // }

  @override
  getTheTypes() async {
    types.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await typedata.getdata();
    statusRequest = handelData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        catresponse = response['categories'];
        List responsedata = response['type'];

        types =
            responsedata.map<TypeModel>((e) => TypeModel.fromJson(e)).toList();
        categoryNamesList = catresponse
            .map((category) => category['category_name'] as String)
            .toList();
        categoryIdsList = catresponse
            .map((category) => category['category_id'] as String)
            .toList();

        value = categoryNamesList.first;
        update();

        print(categoryNamesList);
      } else {}
    }
    statusRequest == StatusRequest.nodata;
    update();
  }

  @override
  editdata(String id, String imagename, String typename, String typecat,
      files) async {
    StatusRequest statusRequest = StatusRequest.loading;
    update();
    var response = await typedata.editdata(
      id,
      imagename,
      typename,
      typecat,
      files,
    );
    statusRequest = handelData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        print(response);
      }
    }
    statusRequest == StatusRequest.nodata;
    update();
  }

  @override
  adddata(String typename, String typecat, files) async {
    StatusRequest statusRequest = StatusRequest.loading;
    update();
    var response = await typedata.adddata(
      typename,
      typecat,
      files,
    );
    statusRequest = handelData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        print(response);
      }
    }
    statusRequest == StatusRequest.nodata;
    update();
    getTheTypes();
  }

  @override
  deletedata(String id, String imagename) async {
    StatusRequest statusRequest = StatusRequest.loading;
    update();
    await typedata.deletedata(
      id,
      imagename,
    );
    types.removeWhere((element) => element.typeId == id);

    statusRequest == StatusRequest.nodata;
    update();
    Get.back();
  }

  // pickimage() async {
  //   FilePickerResult? result =
  //       await FilePicker.platform.pickFiles(type: FileType.image);
  //   if (result != null) {
  //     file = result.files.first;
  //   }
  // }
  @override
  editDataWithouttheFile(
    String id,
    String imagename,
    String typename,
    String typecat,
  ) async {
    StatusRequest statusRequest = StatusRequest.loading;
    update();
    var response = await typedata.editdataWithoutFile(
      id,
      imagename,
      typename,
      typecat,
    );
    statusRequest = handelData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        print(response);
      }
    }
    statusRequest == StatusRequest.nodata;
    update();
  }
}
