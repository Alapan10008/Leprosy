import 'package:flutter/material.dart';
import 'package:varun_s_application1/core/app_export.dart';

import '../models/your_case_screen_model.dart';

class YourCaseScreenController extends GetxController {
  TextEditingController dateController = TextEditingController();

  Rx<YourCaseScreenModel> doctorsThreeModelObj = YourCaseScreenModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
