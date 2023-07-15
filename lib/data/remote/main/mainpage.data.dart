import 'package:hommer_admin/apilinks.dart';
import 'package:hommer_admin/core/crud.dart';

class MainPageData {
  Crud crud;

  MainPageData(this.crud);
  getdata() async {
    var response = await crud.postData(ApiLinks.mainpagelink, {});
    return response.fold((l) => l, (r) => r);
  }
}
