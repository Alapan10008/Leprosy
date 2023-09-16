import 'package:varun_s_application1/core/app_export.dart';
import 'package:varun_s_application1/presentation/scanner_screen/models/scanner_model.dart';

class ScannerController extends GetxController {
  Rx<ScannerModel> scannerModelObj = ScannerModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
