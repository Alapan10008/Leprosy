import '../controller/scanner_controller.dart';
import 'package:get/get.dart';

class ScannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScannerController());
  }
}
