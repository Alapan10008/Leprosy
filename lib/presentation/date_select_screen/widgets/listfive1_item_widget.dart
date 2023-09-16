import '../controller/date_select_controller.dart';
import '../models/listfive1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:varun_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class Listfive1ItemWidget extends StatelessWidget {
  Listfive1ItemWidget(this.listfive1ItemModelObj);

  Listfive1ItemModel listfive1ItemModelObj;

  var controller = Get.find<DateSelectController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => Text(
            listfive1ItemModelObj.fiveTxt.value,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtInterRegular16Bluegray90002,
          ),
        ),
        Padding(
          padding: getPadding(
            left: 18,
          ),
          child: Obx(
            () => Text(
              listfive1ItemModelObj.fiveOneTxt.value,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterRegular16Bluegray90002,
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            left: 18,
          ),
          child: Obx(
            () => Text(
              listfive1ItemModelObj.fiveTwoTxt.value,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterRegular16Bluegray90002,
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            left: 18,
          ),
          child: Obx(
            () => Text(
              listfive1ItemModelObj.fiveThreeTxt.value,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterRegular16Bluegray90002,
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            left: 17,
          ),
          child: Obx(
            () => Text(
              listfive1ItemModelObj.fiveFourTxt.value,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterRegular16Bluegray90002,
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            left: 17,
          ),
          child: Obx(
            () => Text(
              listfive1ItemModelObj.fiveFiveTxt.value,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterRegular16Bluegray400,
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            left: 18,
          ),
          child: Obx(
            () => Text(
              listfive1ItemModelObj.fiveSixTxt.value,
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
