import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "لا يمكن ان تترك هذا الحقل فارغ";
  }

  if (val.length < min) {
    return "  يجب ان لا يكون اقل من $min";
  }

  if (val.length > max) {
    return " يجب ان لا يكون اكبر من $max";
  }

  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "اللإسم غير صالح";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "البريد الألكتروني غير صالح";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "رقم الهاتف غير صالح";
    }
  }
  if (type == "number") {
    if (!GetUtils.isNum(val)) {
      return " هذا الحقل يجب ان يكون رقم ";
    }
  }
}
