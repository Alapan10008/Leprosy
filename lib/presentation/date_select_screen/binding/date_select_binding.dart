import '../controller/date_select_controller.dart';
import 'package:get/get.dart';

class DateSelectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DateSelectController());
  }
}
