import 'package:get/get.dart';

import '../controller/your_case_screen_controller.dart';

class DoctorsThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => YourCaseScreenController());
  }
}
