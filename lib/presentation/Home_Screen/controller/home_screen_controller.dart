import 'package:flutter/material.dart';
import 'package:varun_s_application1/core/app_export.dart';

import '../models/home_screen_model.dart';

class HomeScreenController extends GetxController {
  TextEditingController taskController = TextEditingController();

  TextEditingController patientsController = TextEditingController();

  TextEditingController reportsController = TextEditingController();

  Rx<HomeScreenModel> doctorsThreeModelObj = HomeScreenModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    taskController.dispose();
    patientsController.dispose();
    reportsController.dispose();
  }
}
