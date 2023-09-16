import 'package:flutter/material.dart';
import 'package:varun_s_application1/core/app_export.dart';

import '../models/report_home_screen_model.dart';

class ReportHomeScreenController extends GetxController {
  TextEditingController taskController = TextEditingController();

  TextEditingController patientsController = TextEditingController();

  TextEditingController reportsController = TextEditingController();

  Rx<ReportHomeScreenModel> doctorsThreeModelObj = ReportHomeScreenModel().obs;

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
