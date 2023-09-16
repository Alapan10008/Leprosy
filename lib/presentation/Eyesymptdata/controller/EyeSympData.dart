import 'package:varun_s_application1/core/app_export.dart';

import '../models/EyeSympData.dart';

class EyeSympDataController extends GetxController {
  String eyelash = "";
  String eyebrow = "";
  String eyethickend = "";
  String eyeblicking = "";
  String visionissue = "";

  Rx<EyeSympDataModel> RegisterNewCaseModelObj = EyeSympDataModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
