import 'package:varun_s_application1/core/app_export.dart';

import '../models/HandSympDataModel.dart';

class HandSympDataController extends GetxController {
  String numbness = "";
  String tingling = "";
  String discoloration = "";
  String thickenedskin = "";
  String nodules = "";

  Rx<HandSympDataModel> RegisterNewCaseModelObj = HandSympDataModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
