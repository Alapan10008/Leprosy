import '../controller/date_select_controller.dart';
import '../models/listfive_item_model.dart';
import 'package:flutter/material.dart';
import 'package:varun_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class ListfiveItemWidget extends StatelessWidget {
  ListfiveItemWidget(this.listfiveItemModelObj);

  ListfiveItemModel listfiveItemModelObj;

  var controller = Get.find<DateSelectController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: getPadding(
            top: 8,
            bottom: 7,
          ),
          child: Obx(
            () => Text(
              listfiveItemModelObj.fiveTxt.value,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterRegular16,
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            left: 16,
            top: 8,
            bottom: 7,
          ),
          child: Obx(
            () => Text(
              listfiveItemModelObj.fiveOneTxt.value,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterRegular16,
            ),
          ),
        ),
        Container(
          margin: getMargin(
            left: 8,
          ),
          padding: getPadding(
            all: 4,
          ),
          decoration: AppDecoration.fillCyan7004c.copyWith(
            borderRadius: BorderRadiusStyle.customBorderTL18,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: getPadding(
                  all: 3,
                ),
                decoration: AppDecoration.fillCyan700.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder14,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                      () => Text(
                        listfiveItemModelObj.fiveTwoTxt.value,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterSemiBold16WhiteA700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: getSize(
            36,
          ),
          padding: getPadding(
            left: 8,
            top: 7,
            right: 8,
            bottom: 7,
          ),
          decoration: AppDecoration.txtFillCyan7004c,
          child: Obx(
            () => Text(
              listfiveItemModelObj.dayofaweekotherTxt.value,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterRegular16,
            ),
          ),
        ),
        Container(
          width: getSize(
            36,
          ),
          padding: getPadding(
            all: 7,
          ),
          decoration: AppDecoration.txtFillCyan7004c,
          child: Obx(
            () => Text(
              listfiveItemModelObj.dayofaweekotherOneTxt.value,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterRegular16,
            ),
          ),
        ),
        Container(
          width: getSize(
            36,
          ),
          padding: getPadding(
            left: 9,
            top: 7,
            right: 9,
            bottom: 7,
          ),
          decoration: AppDecoration.txtFillCyan7004c,
          child: Obx(
            () => Text(
              listfiveItemModelObj.dayofaweekotherTwoTxt.value,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterRegular16,
            ),
          ),
        ),
        Container(
          width: getSize(
            36,
          ),
          padding: getPadding(
            left: 14,
            top: 7,
            right: 14,
            bottom: 7,
          ),
          decoration: AppDecoration.txtFillCyan7004c,
          child: Obx(
            () => Text(
              listfiveItemModelObj.dayofaweekweekeTxt.value,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterRegular16Bluegray400,
            ),
          ),
        ),
      ],
    );
  }
}
