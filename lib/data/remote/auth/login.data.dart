import 'package:hommer_admin/apilinks.dart';
import 'package:hommer_admin/core/crud.dart';

class LoginData {
  Crud crud;

  LoginData(this.crud);
  postdata(password, email) async {
    var response = await crud.postData(ApiLinks.loginlink, {
      "password": password,
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
