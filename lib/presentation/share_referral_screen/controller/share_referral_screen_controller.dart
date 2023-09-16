import 'package:flutter/material.dart';
import 'package:varun_s_application1/core/app_export.dart';

import '../models/share_referal_screen_model.dart';

class ShareReferralScreeController extends GetxController {
  TextEditingController dateController = TextEditingController();

  Rx<ShareReferralScreenModel> doctorsThreeModelObj =
      ShareReferralScreenModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    dateController.dispose();
  }
}
