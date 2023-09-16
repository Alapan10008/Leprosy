import 'package:get/get.dart';

import '../controller/TestTypeSelector.dart';

class DoctorsThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterNewCaseController());
  }
}
