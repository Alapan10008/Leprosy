import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:varun_s_application1/core/app_export.dart';

import '../custom_drop_down.dart';

// ignore: must_be_immutable
class AppbarDropdown extends StatelessWidget {
  AppbarDropdown(
      {required this.hintText,
      required this.items,
      required this.onTap,
      this.margin});

  String? hintText;

  List<SelectionPopupModel> items;

  Function(SelectionPopupModel) onTap;

  EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: CustomDropDown(
        width: getHorizontalSize(
          152,
        ),
        focusNode: FocusNode(),
        icon: Container(
          margin: getMargin(
            left: 5,
            right: 7,
          ),
          decoration: BoxDecoration(
            color: ColorConstant.blueGray90002,
          ),
          child: CustomImageView(
            svgPath: ImageConstant.imgArrowdownBlueGray90002,
          ),
        ),
        hintText: "msg_28_10_22_10_01".tr,
        variant: DropDownVariant.OutlineBluegray5001,
        padding: DropDownPadding.PaddingT7,
        fontStyle: DropDownFontStyle.InterSemiBold12,
        items: items,
        onChanged: (value) {
          onTap(value!);
        },
      ),
    );
  }
}
