import 'package:hommer_admin/apilinks.dart';
import 'package:hommer_admin/core/crud.dart';

class ResetPasswordData {
  Crud crud;

  ResetPasswordData(this.crud);
  postdata(email, password) async {
    var response = await crud.postData(ApiLinks.resetpassordlink, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
