import 'package:get/get.dart';
import 'package:hommer_admin/core/function/handel_data.dart';
import 'package:hommer_admin/core/services/services.dart';
import 'package:hommer_admin/core/status_request.dart';
import 'package:hommer_admin/data/model/shortordersview.dart';
import 'package:hommer_admin/data/remote/main/mainpage.data.dart';
import 'package:hommer_admin/view/screen/mainsection/main_page.dart';

abstract class MainPageController extends GetxController {
  getdata();
  /*
   1 (Sunday)
   2 (monday)
   3 (tuesday)
   4 (wednesday)
   5 (thursday)
   6 (friday)
   7 (Saturday)
  */
}

class MainPageControllerImp extends MainPageController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List<OrdersShortView> operations = [];
  String categoryid = '';
  String? costumerCount;
  String? productsCount;
  String? ordersCount;
  MainPageData mainpagedata = MainPageData(Get.find());
  List weeksales = [];
  double saturday = 0;
  double sunday = 0;
  double monday = 0;
  double tuesday = 0;
  double wednesday = 0;
  double thursday = 0;
  double friday = 0;
  List blabla = [];
  List<SalesData> chartData = [];
  @override
  void onInit() async {
    await getdata();
    blabla = weeksales;
    lol();

    super.onInit();
  }

  @override
  getdata() async {
    operations.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await mainpagedata.getdata();
    statusRequest = handelData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        List responsedata = response['orders'];
        weeksales = response['weeksales'];
        // weeksales
        //     .map((category) => category['DayOfWeek'] as String)
        //     .toList();

        operations.addAll(responsedata.map((e) => OrdersShortView.fromJson(e)));
        costumerCount = response['userscount']['count'];
        productsCount = response['productscount']['count'];
        ordersCount = response['orderscount']['count'];
      } else {
        statusRequest == StatusRequest.nodata;
      }
    }
    update();
  }

  lol() {
    orderperday(String day) {
      var count = blabla
          .where((element) => element['DayOfWeek'] == day)
          .map((e) => e['Count'])
          .firstWhere((element) => true, orElse: () => null);

      return double.tryParse(count ?? '0.0') ?? 0.0;
    }

    sunday = orderperday("1");
    monday = orderperday("2");
    tuesday = orderperday("3");
    wednesday = orderperday("4");
    thursday = orderperday("5");
    friday = orderperday("6");
    saturday = orderperday("7");

    chartData = [
      SalesData('الأحد', 5.0),
      SalesData('الأثنين', 7.0),
      SalesData('الثلاثاء', 25.0),
      SalesData('الأربعاء', 33.0),
      SalesData('الخميس', 12.0),
      SalesData('الجمعة', 12.0),
      SalesData('السبت', 45.0),
    ];
  }
}
