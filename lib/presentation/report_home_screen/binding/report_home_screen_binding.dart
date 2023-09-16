import 'package:get/get.dart';

import '../controller/report_home_screen_controller.dart';

class DoctorsThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportHomeScreenController());
  }
}
