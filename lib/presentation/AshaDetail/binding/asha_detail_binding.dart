import 'package:get/get.dart';

import '../controller/asha_detail_controller.dart';

class B2bDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AshaDetailController());
  }
}
