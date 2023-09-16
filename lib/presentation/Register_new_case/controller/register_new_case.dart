import 'package:flutter/material.dart';
import 'package:varun_s_application1/core/app_export.dart';

import '../models/register_new_case.dart';

class RegisterNewCaseController extends GetxController {
  TextEditingController NameController = TextEditingController();
  TextEditingController AgeController = TextEditingController();
  TextEditingController FamilyMemberController = TextEditingController();
  TextEditingController AadharNoController = TextEditingController();
  TextEditingController AbhaNoController = TextEditingController();
  TextEditingController AddressController = TextEditingController();
  TextEditingController DistrictController = TextEditingController();
  TextEditingController BlockController = TextEditingController();
  TextEditingController StateController = TextEditingController();
  TextEditingController ContactController = TextEditingController();
  TextEditingController ScreeningDateController = TextEditingController();
  TextEditingController ReferredtoController = TextEditingController();
  TextEditingController VillageController = TextEditingController();
  String gender = "";

  Rx<RegisterNewCaseModel> RegisterNewCaseModelObj = RegisterNewCaseModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    NameController.dispose();
    AgeController.dispose();
    FamilyMemberController.dispose();
    AddressController.dispose();
    AbhaNoController.dispose();
    AddressController.dispose();
    DistrictController.dispose();
    BlockController.dispose();
    StateController.dispose();
    ContactController.dispose();
    ScreeningDateController.dispose();
    ReferredtoController.dispose();
    VillageController.dispose();
  }
}
