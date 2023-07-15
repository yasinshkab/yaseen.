import 'package:get/get.dart';
import 'package:hommer_admin/core/crud.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    // Get.put(Crudeees());
  }
}
