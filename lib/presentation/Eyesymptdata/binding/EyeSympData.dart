import 'package:get/get.dart';

import '../controller/EyeSympData.dart';

class DoctorsThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EyeSympDataController());
  }
}
