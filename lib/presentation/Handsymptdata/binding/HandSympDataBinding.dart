import 'package:get/get.dart';

import '../controller/HandSympDataController.dart';

class DoctorsThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HandSympDataController());
  }
}
