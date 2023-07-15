import 'package:hommer_admin/apilinks.dart';
import 'package:hommer_admin/core/crud.dart';

class ServicesData {
  Crud crud;

  ServicesData(this.crud);

  approve(
    String serviceid,
  ) async {
    var response = await crud.postData(ApiLinks.serviceapprovelink, {
      "serviceId": serviceid,
    });
    return response.fold((l) => l, (r) => r);
  }

  cancel(
    String serviceid,
  ) async {
    var response = await crud.postData(ApiLinks.servicecancellink, {
      "serviceId": serviceid,
    });
    return response.fold((l) => l, (r) => r);
  }

  newacservice() async {
    var response = await crud.postData(ApiLinks.acserviceslink, {});
    return response.fold((l) => l, (r) => r);
  }

  newwmservice() async {
    var response = await crud.postData(ApiLinks.wmserviceslink, {});
    return response.fold((l) => l, (r) => r);
  }

  acarchive() async {
    var response = await crud.postData(ApiLinks.acarchivelink, {});
    return response.fold((l) => l, (r) => r);
  }

  wmarchive() async {
    var response = await crud.postData(ApiLinks.wmarchivelink, {});
    return response.fold((l) => l, (r) => r);
  }
}
