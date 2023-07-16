import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hommer_admin/binding/initialbinding.dart';
import 'package:hommer_admin/core/services/services.dart';
import 'package:hommer_admin/view/screen/auth/checkemail.dart';
import 'package:hommer_admin/view/screen/auth/login.dart';
import 'package:hommer_admin/view/screen/auth/otpcode.dart';
import 'package:hommer_admin/view/screen/auth/resetpassword.dart';
import 'package:hommer_admin/view/screen/auth/verifyemail.dart';
import 'package:hommer_admin/view/screen/dashboard.dart';
import 'package:hommer_admin/view/screen/mainsection/inprogressorderdetails.dart';
import 'package:hommer_admin/view/screen/mainsection/neworderdetails.dart';
import 'package:hommer_admin/view/screen/mainsection/orderdetails.dart';
import 'package:hommer_admin/view/screen/mainsection/servicedetails.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  //bool i =true;
  var locale = const Locale('ar', 'AE');
  Get.updateLocale(locale);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Neo",
        primarySwatch: Colors.red,
      ),
      //  home: Ldid(),
      getPages: [
        GetPage(name: "/dashboard", page: () => const AdminDashboard()),
        GetPage(
          name: "/",
          page: () => const LogIn(),
        ),
        GetPage(name: "/otpcode", page: () => const OTPCODE()),
        GetPage(name: "/resetPassword", page: () => const ResetPassword()),
        GetPage(name: "/verifyemail", page: () => const VerifyEmail()),
        GetPage(name: "/checkemail", page: () => const Checkemail()),
        ////////////////////
        GetPage(name: "/orderderails", page: () => const OrderDetails()),
        GetPage(name: "/neworderderails", page: () => NewOrderDetails()),
        GetPage(
            name: "/inprogressorderderails",
            page: () => InProgressOrderDetails()),

        GetPage(name: "/servicedetails", page: () => const ServiceDetails()),
      ],
    );
  }
}
