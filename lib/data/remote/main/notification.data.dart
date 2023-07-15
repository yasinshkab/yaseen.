import 'package:hommer_admin/apilinks.dart';
import 'package:hommer_admin/core/crud.dart';

class NotificationData {
  Crud crud;

  NotificationData(this.crud);
  sendmassage(String massage, String title) async {
    var response = await crud.postData(ApiLinks.notificationlink, {
      "massage": massage,
      "title": title,
    });
    return response.fold((l) => l, (r) => r);
  }
}
