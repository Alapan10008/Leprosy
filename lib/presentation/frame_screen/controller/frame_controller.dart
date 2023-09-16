import 'package:flutter/material.dart';
import 'package:varun_s_application1/core/app_export.dart';
import 'package:varun_s_application1/presentation/frame_screen/models/frame_model.dart';

class FrameController extends GetxController {
  TextEditingController phonenumberController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController otpController = TextEditingController();

  Rx<FrameModel> frameModelObj = FrameModel().obs;

  @override
  void onReady() {
    super.onReady();
    // Future.delayed(const Duration(milliseconds: 3000), () {
    //   Get.offNamed(AppRoutes.animatedNailScreen);
    // });
  }

  @override
  void onClose() {
    super.onClose();
    phonenumberController.dispose();
    otpController.dispose();
  }
}
