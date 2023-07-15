// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

Widget formFeilds({
  bool isPassword = false,
  required String theLabel,
  Widget? preicons,
  Widget? suficons,
  TextInputType? theKeyboard,
  required theController,
  required String? Function(String?) valid,
  //required String reText
}) =>
    TextFormField(
      controller: theController,
      scrollController: ScrollController(),
      validator: valid,
      obscureText: isPassword,
      keyboardType: theKeyboard,
      decoration: InputDecoration(
        suffixIcon: suficons,
        labelText: theLabel,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(125, 125, 125, 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(125, 125, 125, 1),
          ),
        ),
      ),
    );

Widget noIconFormFeilds(
        {String? reText,
        required String theLabel,
        required TextEditingController controller,
        TextInputType? theKeyboard}) =>
    TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return reText;
        }
        return null;
      },
      controller: controller,
      keyboardType: theKeyboard,
      decoration: InputDecoration(
        labelText: theLabel,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(30, 30, 30, 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(125, 125, 125, 1),
          ),
        ),
      ),
    );
Widget messageFormFeilds(
        {String? reText,
        required String theLabel,
        required TextEditingController controller}) =>
    TextFormField(
      minLines: 1,
      maxLines: 5,
      validator: (value) {
        if (value!.isEmpty) {
          return reText;
        }
        return null;
      },
      controller: controller,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        labelText: theLabel,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(30, 30, 30, 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(125, 125, 125, 1),
          ),
        ),
      ),
    );
Widget blacknullFormFeilds(
        {bool isPassword = false,
        String? reText,
        required String theLabel,
        Widget? preicons,
        Widget? suficons,
        TextInputType? theKeyboard}) =>
    TextFormField(
      obscureText: isPassword,
      keyboardType: theKeyboard,
      decoration: InputDecoration(
        prefixIcon: preicons,
        suffixIcon: suficons,
        labelText: theLabel,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(31, 31, 31, 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(31, 31, 31, 1),
          ),
        ),
      ),
    );
Widget hintFormFeilds(
        {required TextEditingController couponcontroller,
        String? reText,
        required String theLabel,
        TextInputType? theKeyboard}) =>
    TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return reText;
        }
        return null;
      },
      controller: couponcontroller,
      keyboardType: theKeyboard,
      decoration: InputDecoration(
        hintText: theLabel,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(125, 125, 125, 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(125, 125, 125, 1),
          ),
        ),
      ),
    );

class Theformfields extends StatelessWidget {
  final bool isPassword = true;
  final String label;

  final Widget preicons;

  final Widget? suficons;
  //   final TextEditingController textController;
  final thecontroller;
  final String? Function(String?) valid;
  final TextInputType keyboardtype;

  const Theformfields(
      {Key? key,
      required this.label,
      required this.preicons,
      isPassword,
      this.suficons,
      required this.thecontroller,
      required this.valid,
      required this.keyboardtype
      // required this.textControlle
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        preicons,
        const SizedBox(
          width: 2,
        ),
        Flexible(
          child: formFeilds(
              valid: valid,
              theController: thecontroller,
              theKeyboard: keyboardtype,
              theLabel: label,
              suficons: suficons),
        ),
        const SizedBox(
          width: 12,
        ),
      ],
    );
  }
}
