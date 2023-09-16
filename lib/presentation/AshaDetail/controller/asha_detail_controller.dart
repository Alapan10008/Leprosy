import 'package:flutter/material.dart';
import 'package:varun_s_application1/core/app_export.dart';

import '../models/asha_detail_model.dart';

class AshaDetailController extends GetxController {
  TextEditingController stateController = TextEditingController();

  TextEditingController districtController = TextEditingController();

  TextEditingController blockController = TextEditingController();

  TextEditingController villageController = TextEditingController();
  TextEditingController XYZController = TextEditingController();

  Rx<AshaDetailModel> b2bDetailsModelObj = AshaDetailModel().obs;

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    stateController.dispose();
    districtController.dispose();
    blockController.dispose();
    villageController.dispose();
    XYZController.dispose();
  }
}
