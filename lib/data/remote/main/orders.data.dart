import 'package:hommer_admin/apilinks.dart';
import 'package:hommer_admin/core/crud.dart';

class OrdersData {
  Crud crud;

  OrdersData(this.crud);
  neworder() async {
    var response = await crud.postData(ApiLinks.neworderviewlink, {});
    return response.fold((l) => l, (r) => r);
  }

  orderapprove(String orderid, String userid) async {
    var response = await crud.postData(ApiLinks.orderapprovelink, {
      "orderId": orderid,
      "userId": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  inprogressorder() async {
    var response = await crud.postData(ApiLinks.inprogressorderviewlink, {});
    return response.fold((l) => l, (r) => r);
  }

  orderarchive() async {
    var response = await crud.postData(ApiLinks.orderarchiveviewlink, {});
    return response.fold((l) => l, (r) => r);
  }

  orderdone(String orderid, String userid) async {
    var response = await crud.postData(ApiLinks.orderdonelink, {
      "orderId": orderid,
      "userId": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  orderdetails(orderid) async {
    var response =
        await crud.postData(ApiLinks.orderdetailslink, {"orderId": orderid});
    return response.fold((l) => l, (r) => r);
  }
}
