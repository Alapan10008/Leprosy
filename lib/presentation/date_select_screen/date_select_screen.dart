import '../date_select_screen/widgets/listfive1_item_widget.dart';
import '../date_select_screen/widgets/listfive_item_widget.dart';
import 'controller/date_select_controller.dart';
import 'models/listfive1_item_model.dart';
import 'models/listfive_item_model.dart';
import 'package:flutter/material.dart';
import 'package:varun_s_application1/core/app_export.dart';

class DateSelectScreen extends GetWidget<DateSelectController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          padding: getPadding(
            left: 16,
            top: 23,
            right: 16,
            bottom: 23,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: getPadding(
                  left: 8,
                  top: 1,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "lbl_today".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtRobotoRomanRegular16,
                    ),
                    Padding(
                      padding: getPadding(
                        top: 17,
                      ),
                      child: Text(
                        "lbl_yesterday".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtRobotoRomanRegular16,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 15,
                      ),
                      child: Text(
                        "lbl_last_week".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtRobotoRomanRegular16,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 17,
                      ),
                      child: Text(
                        "lbl_last_month".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtRobotoRomanRegular16,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 18,
                      ),
                      child: Text(
                        "lbl_last_quarter".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtRobotoRomanRegular16,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "lbl_reset".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterSemiBold16,
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: getPadding(
                          top: 1,
                        ),
                        child: Text(
                          "lbl_january_2023".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtRobotoRomanSemiBold16Bluegray90002,
                        ),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgArrowdownBlueGray90002,
                        height: getSize(
                          20,
                        ),
                        width: getSize(
                          20,
                        ),
                        margin: getMargin(
                          left: 83,
                        ),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgArrowdownBlueGray90002,
                        height: getSize(
                          20,
                        ),
                        width: getSize(
                          20,
                        ),
                        margin: getMargin(
                          left: 16,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: getPadding(
                      top: 27,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "lbl_mo".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtRobotoRomanRegular16Bluegray400,
                        ),
                        Padding(
                          padding: getPadding(
                            left: 15,
                          ),
                          child: Text(
                            "lbl_tu".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtRobotoRomanRegular16Bluegray400,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 15,
                          ),
                          child: Text(
                            "lbl_we".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtRobotoRomanRegular16Bluegray400,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 15,
                          ),
                          child: Text(
                            "lbl_th".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtRobotoRomanRegular16Bluegray400,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 19,
                          ),
                          child: Text(
                            "lbl_fr".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtRobotoRomanRegular16Bluegray400,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 19,
                          ),
                          child: Text(
                            "lbl_sa".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtRobotoRomanRegular16Bluegray400,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 17,
                          ),
                          child: Text(
                            "lbl_su".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtRobotoRomanRegular16Bluegray400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 21,
                    ),
                    child: Obx(
                      () => ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: getVerticalSize(
                              1,
                            ),
                          );
                        },
                        itemCount: controller
                            .dateSelectModelObj.value.listfiveItemList.length,
                        itemBuilder: (context, index) {
                          ListfiveItemModel model = controller
                              .dateSelectModelObj.value.listfiveItemList[index];
                          return ListfiveItemWidget(
                            model,
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 7,
                      top: 8,
                      right: 8,
                    ),
                    child: Obx(
                      () => ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: getVerticalSize(
                              15,
                            ),
                          );
                        },
                        itemCount: controller
                            .dateSelectModelObj.value.listfive1ItemList.length,
                        itemBuilder: (context, index) {
                          Listfive1ItemModel model = controller
                              .dateSelectModelObj
                              .value
                              .listfive1ItemList[index];
                          return Listfive1ItemWidget(
                            model,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
