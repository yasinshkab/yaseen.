import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hommer_admin/core/constant/text_theme.dart';
import 'package:hommer_admin/core/function/valid_input.dart';
import 'package:hommer_admin/data/model/orders_model.dart';
import 'package:hommer_admin/view/widget/form_field.dart';
import 'package:hommer_admin/view/widget/message.dart';

Widget primaryButton({
  //required Function function,

  required String theText,
  required Function() onPressed,
}) =>
    Container(
      height: 48,
      width: 208,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(31, 31, 31, 34).withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 4),
            )
          ],
          color: const Color.fromRGBO(226, 33, 38, 1),
          borderRadius: BorderRadius.circular(10)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          theText,
        ),
      ),
    );
Widget textButton({
  required Function() onPressed,
  required String theText,
}) =>
    TextButton(
        onPressed: onPressed,
        child: Text(
          theText,
          style: const TextStyle(
            fontSize: 12,
            color: Color.fromRGBO(226, 33, 38, 1),
            fontWeight: FontWeight.normal,
          ),
        ));
Widget textButtonofmenu(
        {required OrdersModel listdata,
        required String theText,
        required void Function()? onPressed}) =>
    TextButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            theText,
            style: const TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(226, 33, 38, 1),
              fontWeight: FontWeight.normal,
            ),
          ),
        ));

Widget bigPrimaryButton({
  //required Function function,

  required String theText,
  required Function() onPressed,
}) =>
    Container(
      height: 44,
      width: 244,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(31, 31, 31, 34).withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 4),
            )
          ],
          color: const Color.fromRGBO(226, 33, 38, 1),
          borderRadius: BorderRadius.circular(10)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          theText,
        ),
      ),
    );
Widget sendnotificationButton({
  //required Function function,

  required String theText,
  required Function() onPressed,
}) =>
    Container(
      height: 52,
      width: 264,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(31, 31, 31, 34).withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 4),
            )
          ],
          color: const Color.fromRGBO(226, 33, 38, 1),
          borderRadius: BorderRadius.circular(10)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          theText,
        ),
      ),
    );
// Widget numTextButton({
//   //required Function function,

//   required String thenumber,
// }) =>
//     TextButton(
//         onPressed: () async {
//           final number = Uri.parse('tel:+$thenumber');
//           if (await canLaunchUrl(number)) {
//             await launchUrl(number);
//           } else {
//             throw 'Could not launch $number';
//           }
//         },
//         child: Text(
//           thenumber,
//           style: CenterBlack,
//         ));

Widget editpassword({
  //required Function function,

  required String theText,
  required Function() onPressed,
}) =>
    Container(
      height: 40,
      width: 180,
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(
                226, 33, 38, 1), //                   <--- border color
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            color: Color.fromRGBO(226, 33, 38, 1),
            fontWeight: FontWeight.w500,
          ),
          theText,
        ),
      ),
    );
Widget pickimageButton({
  //required Function function,

  required Function() onPressed,
}) =>
    Container(
      height: 32,
      width: 120,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(226, 33, 38, 1),
          borderRadius: BorderRadius.circular(10)),
      child: MaterialButton(
        onPressed: onPressed,
        child: const Text(
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
          "إضافة الصورة",
        ),
      ),
    );

Widget orderNow({
  //required Function function,
  required String thetext,
  required Function() onPressed,
}) =>
    Container(
      height: 28,
      width: 60,
      decoration: BoxDecoration(
          //   boxShadow: [
          //    BoxShadow(
          //      color: const Color.fromARGB(31, 31, 31, 34).withOpacity(0.3),
          //      spreadRadius: 1,
          //      blurRadius: 4,
          //      offset: const Offset(0,4),
          //    )
          //  ],
          color: const Color.fromRGBO(226, 33, 38, 1),
          borderRadius: BorderRadius.circular(6)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
          thetext,
        ),
      ),
    );
Widget bigorderNow({
  //required Function function,

  required Function() onPressed,
}) =>
    Container(
      height: 44,
      width: 210,
      decoration: BoxDecoration(
          //   boxShadow: [
          //    BoxShadow(
          //      color: const Color.fromARGB(31, 31, 31, 34).withOpacity(0.3),
          //      spreadRadius: 1,
          //      blurRadius: 4,
          //      offset: const Offset(0,4),
          //    )
          //  ],
          color: const Color.fromRGBO(226, 33, 38, 1),
          borderRadius: BorderRadius.circular(10)),
      child: MaterialButton(
        onPressed: onPressed,
        child: const Text(
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          "إتمام الطلب",
        ),
      ),
    );
Widget approve({
  //required Function function,
  required String title,
  required Function() onPressed,
}) =>
    Container(
      height: 36,
      width: 120,
      decoration: BoxDecoration(
          //   boxShadow: [
          //    BoxShadow(
          //      color: const Color.fromARGB(31, 31, 31, 34).withOpacity(0.3),
          //      spreadRadius: 1,
          //      blurRadius: 4,
          //      offset: const Offset(0,4),
          //    )
          //  ],
          color: const Color.fromRGBO(226, 33, 38, 1),
          borderRadius: BorderRadius.circular(10)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          title,
        ),
      ),
    );

Widget addbutton({
  required BuildContext context,
  required void Function() ontap,
  // required List<DropdownMenuItem<String>>? items,

  required bool isproduct,
}) =>
    GestureDetector(
      onTap: ontap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.49,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Colors.black.withOpacity(.15),
                spreadRadius: 0.08,
                offset: const Offset(0, 4),
              )
            ],
            color: const Color.fromRGBO(226, 33, 38, 1),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  isproduct == true ? "إضافة منتج جديد" : "إضافة نوع جديد",
                  style: addLocation,
                ),
                const Spacer(),
                const Icon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                  size: 36,
                )
              ],
            )),
      ),
    );
Widget slideraddbutton({
  required BuildContext context,
  required void Function() ontap,
  // required List<DropdownMenuItem<String>>? items,
}) =>
    GestureDetector(
      onTap: ontap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.49,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Colors.black.withOpacity(.15),
                spreadRadius: 0.08,
                offset: const Offset(0, 4),
              )
            ],
            color: const Color.fromRGBO(226, 33, 38, 1),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "إضافة صورة جديدة",
                  style: addLocation,
                ),
                const Spacer(),
                const Icon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                  size: 36,
                )
              ],
            )),
      ),
    );
              
                //////////////
                //  () async {
                //             var formdata = controller.formKey.currentState;
                //             if (formdata!.validate()) {
                //               FilePickerResult? result = await FilePicker
                //                   .platform
                //                   .pickFiles(type: FileType.image);
                //               if (result != null) {
                //                 file = result.files.first;
                //                 if (file.bytes != null) {
                //                   var categoryid =
                //                       controller.responsedata!.firstWhere(
                //                     (item) => item['type_name'] == controller.h,
                //                   );
                //                   // control.editdata(
                //                   //     '13', '9065Untitledturtyu-1.png', 'bill', "2", file);
                //                   controller.adddata(
                //                       '${categoryid['type_id']}', file);
                //                 } else {
                //                   print('No data available in file');
                //                 }
                //               } else {
                //                 print('User canceled the picker');
                //               }
                //             }

                //             Get.back();
                //           },