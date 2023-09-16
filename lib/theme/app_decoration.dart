import 'package:flutter/material.dart';
import 'package:varun_s_application1/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fillBluegray5000c => BoxDecoration(
        color: ColorConstant.blueGray5000c,
      );
  static BoxDecoration get outlineCyan70001 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.cyan70001,
          width: getHorizontalSize(
            4,
          ),
        ),
      );
  static BoxDecoration get outlineBluegray100011 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.blueGray10001,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get fillGray50 => BoxDecoration(
        color: ColorConstant.gray50,
      );
  static BoxDecoration get outlineBluegray5001 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.blueGray5001,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outlineBluegray10001 => BoxDecoration(
        color: ColorConstant.gray50,
        border: Border.all(
          color: ColorConstant.blueGray10001,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outlineBluegray500 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.blueGray500,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outlineGray30001 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.gray30001,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outlineBluegray9001e => BoxDecoration(
        color: ColorConstant.whiteA700,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.blueGray9001e,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              16,
            ),
          ),
        ],
      );
  static BoxDecoration get fillBlack900 => BoxDecoration(
        color: ColorConstant.black900,
      );
  static BoxDecoration get outlineBlack9000f => BoxDecoration(
        color: ColorConstant.whiteA700,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black9000f,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              10,
            ),
          ),
        ],
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get fillCyan7004c => BoxDecoration(
        color: ColorConstant.cyan7004c,
      );
  static BoxDecoration get txtFillCyan7004c => BoxDecoration(
        color: ColorConstant.cyan7004c,
      );
  static BoxDecoration get outlineGray100 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.gray100,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outlineBlack9000f1 => BoxDecoration(
        color: ColorConstant.gray5003f,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black9000f,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              10,
            ),
          ),
        ],
      );
  static BoxDecoration get fillLightblueA700 => BoxDecoration(
        color: ColorConstant.lightBlueA700,
      );
  static BoxDecoration get fillBlue50 => BoxDecoration(
        color: ColorConstant.blue50,
      );
  static BoxDecoration get fillCyan700 => BoxDecoration(
        color: ColorConstant.cyan700,
      );
  static BoxDecoration get fillGray200ef => BoxDecoration(
        color: ColorConstant.gray200Ef,
      );
  static BoxDecoration get txtFillBlue50 => BoxDecoration(
        color: ColorConstant.blue50,
      );
  static BoxDecoration get fillBluegray10001 => BoxDecoration(
        color: ColorConstant.blueGray10001,
      );
  static BoxDecoration get fillBlack90090 => BoxDecoration(
        color: ColorConstant.black90090,
      );
  static BoxDecoration get fillCyan70033 => BoxDecoration(
        color: ColorConstant.cyan70033,
      );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder14 = BorderRadius.circular(
    getHorizontalSize(
      14,
    ),
  );

  static BorderRadius roundedBorder5 = BorderRadius.circular(
    getHorizontalSize(
      5,
    ),
  );

  static BorderRadius circleBorder40 = BorderRadius.circular(
    getHorizontalSize(
      40,
    ),
  );

  static BorderRadius roundedBorder20 = BorderRadius.circular(
    getHorizontalSize(
      20,
    ),
  );

  static BorderRadius circleBorder8 = BorderRadius.circular(
    getHorizontalSize(
      8,
    ),
  );

  static BorderRadius customBorderTL18 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        18,
      ),
    ),
    bottomLeft: Radius.circular(
      getHorizontalSize(
        18,
      ),
    ),
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

// double get strokeAlignInside => BorderSide.strokeAlignInside;
//
// double get strokeAlignCenter => BorderSide.strokeAlignCenter;
//
// double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
