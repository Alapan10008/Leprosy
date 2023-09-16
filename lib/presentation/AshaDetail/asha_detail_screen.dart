// ignore_for_file: must_be_immutable
//174
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:varun_s_application1/core/app_export.dart';
import 'package:varun_s_application1/widgets/custom_button.dart';

import '../../widgets/custom_text_form_field.dart';
import '../Home_Screen/home_screen.dart';
import 'controller/asha_detail_controller.dart';

class AshaDetailScreen extends StatefulWidget {
  late String phoneNumber;
  late String Ashaname;
  AshaDetailScreen(
      {Key? key, required this.phoneNumber, required this.Ashaname})
      : super(key: key);

  @override
  State<AshaDetailScreen> createState() => _AshaDetailScreenState();
}

class _AshaDetailScreenState extends State<AshaDetailScreen> {
  final AshaDetailController controller = AshaDetailController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: getHorizontalSize(360),
                padding: getPadding(left: 16, top: 4, right: 16, bottom: 4),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.05),
                          child: Text(
                            'HI ASHA - ${widget.Ashaname}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Padding(
                            padding: getPadding(left: 5, top: 23),
                            child: Text("Assigned State",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle
                                    .txtRobotoRomanMedium14Bluegray500
                                    .copyWith(
                                        letterSpacing:
                                            getHorizontalSize(0.23)))),
                        CustomTextFormField(
                            focusNode: FocusNode(),
                            variant: TextFormFieldVariant.OutlineBluegray100,
                            controller: controller.stateController,
                            margin: getMargin(left: 1, top: 8)),
                        Padding(
                            padding: getPadding(left: 5, top: 23),
                            child: Text("Assigned District",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle
                                    .txtRobotoRomanMedium14Bluegray500
                                    .copyWith(
                                        letterSpacing:
                                            getHorizontalSize(0.23)))),
                        CustomTextFormField(
                            focusNode: FocusNode(),
                            variant: TextFormFieldVariant.OutlineBluegray100,
                            controller: controller.districtController,
                            margin: getMargin(left: 1, top: 8)),
                        Padding(
                            padding: getPadding(left: 5, top: 23),
                            child: Text("Assigned Block",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle
                                    .txtRobotoRomanMedium14Bluegray500
                                    .copyWith(
                                        letterSpacing:
                                            getHorizontalSize(0.23)))),
                        CustomTextFormField(
                            focusNode: FocusNode(),
                            variant: TextFormFieldVariant.OutlineBluegray100,
                            controller: controller.blockController,
                            margin: getMargin(left: 1, top: 8)),
                        Padding(
                            padding: getPadding(left: 5, top: 23),
                            child: Text("Assigned Village/Urban Pocket",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle
                                    .txtRobotoRomanMedium14Bluegray500
                                    .copyWith(
                                        letterSpacing:
                                            getHorizontalSize(0.23)))),
                        CustomTextFormField(
                            focusNode: FocusNode(),
                            variant: TextFormFieldVariant.OutlineBluegray100,
                            controller: controller.villageController,
                            margin: getMargin(left: 1, top: 8)),
                        Padding(
                            padding: getPadding(left: 5, top: 23),
                            child: Text("XYZ",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle
                                    .txtRobotoRomanMedium14Bluegray500
                                    .copyWith(
                                        letterSpacing:
                                            getHorizontalSize(0.23)))),
                        CustomTextFormField(
                            focusNode: FocusNode(),
                            variant: TextFormFieldVariant.OutlineBluegray100,
                            controller: controller.XYZController,
                            margin: getMargin(left: 1, top: 8)),
                        Padding(
                          padding: getPadding(top: 50),
                          child: InkWell(
                            onTap: () {
                              Get.to(HomeScreen(
                                  phoneNumber: widget.phoneNumber,
                                  phleboname: widget.Ashaname));
                            },
                            child: CustomButton(
                                height: getVerticalSize(60),
                                text: "lbl_submit".tr,
                                margin: getMargin(left: 2, bottom: 65),
                                shape: ButtonShape.RoundedBorder20,
                                padding: ButtonPadding.PaddingAll18),
                          ).paddingOnly(bottom: 8),
                        )
                      ]),
                ))));
  }
}
