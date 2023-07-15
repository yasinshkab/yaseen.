import 'package:hommer_admin/apilinks.dart';
import 'package:hommer_admin/core/crud.dart';

class OTPData {
  Crud crud;

  OTPData(this.crud);
  otpdata(String verifycode, String email) async {
    var response = await crud.postData(ApiLinks.otpcodelink, {
      "verifycode": verifycode,
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }

  resendCode(String email) async {
    var response = await crud.postData(ApiLinks.resendcodelink, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }

  verifydata(String verifycode, String email) async {
    var response = await crud.postData(ApiLinks.verifycodelink, {
      "verifycode": verifycode,
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
