import 'package:get/get.dart';

import '../controller/register_new_case.dart';

class DoctorsThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterNewCaseController());
  }
}
