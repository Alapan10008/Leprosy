import 'package:flutter/material.dart';
import 'package:varun_s_application1/core/app_export.dart';
import 'package:varun_s_application1/presentation/share_referral_screen/share_refferal_screen.dart';
import 'package:varun_s_application1/presentation/your_case_screen/your_case_screen.dart';

import '../../widgets/custom_button.dart';
import 'controller/report_home_screen_controller.dart';

// ignore: must_be_immutable
class ReportHomeScreen extends StatefulWidget {
  late String phoneNumber;
  late String phleboname;

  ReportHomeScreen({
    Key? key,
    required this.phoneNumber,
    required this.phleboname,
  }) : super(key: key);

  @override
  State<ReportHomeScreen> createState() => _ReportHomeScreenState();
}

class _ReportHomeScreenState extends State<ReportHomeScreen> {
  final ReportHomeScreenController controller = ReportHomeScreenController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorConstant.whiteA700,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(ShareReferralScree(
                        phoneNumber: widget.phoneNumber,
                        phleboname: widget.phleboname));
                  },
                  child: CustomButton(
                      height: getVerticalSize(60),
                      text: "Share Your Case",
                      margin: getMargin(left: 2, bottom: 65),
                      shape: ButtonShape.RoundedBorder20,
                      padding: ButtonPadding.PaddingAll18),
                ),
                InkWell(
                  onTap: () {
                    Get.to(YourCaseScreen(
                        phoneNumber: widget.phoneNumber,
                        phleboname: widget.phleboname));
                  },
                  child: CustomButton(
                      height: getVerticalSize(60),
                      text: "Your Cases",
                      margin: getMargin(left: 2, bottom: 65),
                      shape: ButtonShape.RoundedBorder20,
                      padding: ButtonPadding.PaddingAll18),
                )
              ],
            ),
          )),
    );
  }
}
