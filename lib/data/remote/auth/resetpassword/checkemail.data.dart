import 'package:hommer_admin/apilinks.dart';
import 'package:hommer_admin/core/crud.dart';

class CheckEmailData {
  Crud crud;

  CheckEmailData(this.crud);
  postdata(String email) async {
    var response = await crud.postData(ApiLinks.checkemaillink, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
