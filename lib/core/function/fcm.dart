// firebase cloud messaging
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// requestPermissionnotification() async {
//   NotificationSettings settings =
//       await FirebaseMessaging.instance.requestPermission(
//     alert: true,
//     announcement: false,
//     badge: true,
//     carPlay: false,
//     criticalAlert: false,
//     provisional: false,
//     sound: true,
//   );
// }

// fcmConfig() {
//   FirebaseMessaging.onMessage.listen((message) {
//     //  FlutterRingtonePlayer.playNotification();

//     Get.snackbar(
//       message.notification!.title!,
//       message.notification!.body!,
//       backgroundColor: Color.fromRGBO(0, 162, 255, 1),
//       icon: Icon(
//         Icons.check_box_outlined,
//         color: Color.fromRGBO(255, 255, 255, 1),
//       ),
//       colorText: Color.fromRGBO(255, 255, 255, 1),
//     );
//     // thesnackBar(
//     //   context,
//     //   theColor: Color.fromRGBO(0, 162, 255, 1),
//     //   theText: ("${message.notification!.body}"),
//     // theicon: Icon(
//     //   Icons.check_circle_outlined,
//     //   color: Color.fromRGBO(255, 255, 255, 1),
//     // ),
//     // );
//     print("===================notification======================");
//     print(message.notification!.title);
//     print(message.notification!.body);
//   });
// }
