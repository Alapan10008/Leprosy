import '../controller/frame_controller.dart';
import 'package:get/get.dart';

class FrameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FrameController());
  }
}
