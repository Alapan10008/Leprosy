import 'package:get/get.dart';

import '../controller/scanner_video_controller.dart';

class ScannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScannervideoController());
  }
}
