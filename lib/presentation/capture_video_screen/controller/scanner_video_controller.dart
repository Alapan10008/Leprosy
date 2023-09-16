import 'package:varun_s_application1/core/app_export.dart';
import 'package:varun_s_application1/presentation/scanner_video_screen/models/scanner_video_model.dart';

class ScannervideoController extends GetxController {
  Rx<ScannerVideoModel> scannerModelObj = ScannerVideoModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
