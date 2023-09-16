import 'package:flutter/material.dart';
import 'package:varun_s_application1/core/app_export.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.controller,
      this.focusNode,
      this.isObscureText = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.maxLines,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.validator});

  TextFormFieldShape? shape;

  TextFormFieldPadding? padding;

  TextFormFieldVariant? variant;

  TextFormFieldFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;

  bool? isObscureText;

  TextInputAction? textInputAction;

  TextInputType? textInputType;

  int? maxLines;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(),
          )
        : _buildTextFormFieldWidget();
  }

  _buildTextFormFieldWidget() {
    return Container(
      width: width ?? double.maxFinite,
      margin: margin,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        style: _setFontStyle(),
        obscureText: isObscureText!,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: _buildDecoration(),
        validator: validator,
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      disabledBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      case TextFormFieldFontStyle.RobotoRomanRegular14:
        return TextStyle(
          color: ColorConstant.blueGray900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          height: getVerticalSize(
            1.21,
          ),
        );
      case TextFormFieldFontStyle.RobotoRomanMedium14:
        return TextStyle(
          color: ColorConstant.blueGray10001,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          height: getVerticalSize(
            1.21,
          ),
        );
      case TextFormFieldFontStyle.RobotoRomanSemiBold14:
        return TextStyle(
          color: ColorConstant.blueGray90001,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
          height: getVerticalSize(
            1.21,
          ),
        );
      case TextFormFieldFontStyle.MontserratMedium14:
        return TextStyle(
          color: ColorConstant.blueGray10001,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
          height: getVerticalSize(
            1.29,
          ),
        );
      default:
        return TextStyle(
          color: ColorConstant.blueGray90001,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          height: getVerticalSize(
            1.19,
          ),
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      case TextFormFieldShape.RoundedBorder20:
        return BorderRadius.circular(
          getHorizontalSize(
            20.00,
          ),
        );
      case TextFormFieldShape.RoundedBorder14:
        return BorderRadius.circular(
          getHorizontalSize(
            14.00,
          ),
        );
      case TextFormFieldShape.CircleBorder28:
        return BorderRadius.circular(
          getHorizontalSize(
            28.00,
          ),
        );
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            10.00,
          ),
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      case TextFormFieldVariant.OutlineBluegray100:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.blueGray100,
            width: 1,
          ),
        );
      case TextFormFieldVariant.FillGray50:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.OutlineBlack9000f:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.OutlineBluegray10001:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.blueGray10001,
            width: 1,
          ),
        );
      case TextFormFieldVariant.None:
        return InputBorder.none;
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      case TextFormFieldVariant.FillGray50:
        return ColorConstant.gray50;
      case TextFormFieldVariant.OutlineBlack9000f:
        return ColorConstant.whiteA700;
      case TextFormFieldVariant.OutlineBluegray10001:
        return ColorConstant.gray50;
      default:
        return ColorConstant.blueGray5000c;
    }
  }

  _setFilled() {
    switch (variant) {
      case TextFormFieldVariant.OutlineBluegray100:
        return false;
      case TextFormFieldVariant.FillGray50:
        return true;
      case TextFormFieldVariant.OutlineBlack9000f:
        return true;
      case TextFormFieldVariant.OutlineBluegray10001:
        return true;
      case TextFormFieldVariant.None:
        return false;
      default:
        return true;
    }
  }

  _setPadding() {
    switch (padding) {
      case TextFormFieldPadding.PaddingAll19:
        return getPadding(
          all: 19,
        );
      case TextFormFieldPadding.PaddingT19:
        return getPadding(
          left: 19,
          top: 19,
          bottom: 19,
        );
      case TextFormFieldPadding.PaddingT21:
        return getPadding(
          left: 15,
          top: 21,
          bottom: 21,
        );
      case TextFormFieldPadding.PaddingT21_1:
        return getPadding(
          left: 12,
          top: 21,
          bottom: 21,
        );
      case TextFormFieldPadding.PaddingT21_2:
        return getPadding(
          top: 21,
          bottom: 21,
        );
      case TextFormFieldPadding.PaddingT21_3:
        return getPadding(
          left: 16,
          top: 21,
          right: 16,
          bottom: 21,
        );
      default:
        return getPadding(
          left: 11,
          top: 15,
          right: 11,
          bottom: 15,
        );
    }
  }
}

enum TextFormFieldShape {
  RoundedBorder10,
  RoundedBorder20,
  RoundedBorder14,
  CircleBorder28,
}

enum TextFormFieldPadding {
  PaddingT15,
  PaddingAll19,
  PaddingT19,
  PaddingT21,
  PaddingT21_1,
  PaddingT21_2,
  PaddingT21_3,
}

enum TextFormFieldVariant {
  None,
  FillBluegray5000c,
  OutlineBluegray100,
  FillGray50,
  OutlineBlack9000f,
  OutlineBluegray10001,
}

enum TextFormFieldFontStyle {
  RobotoRomanMedium16,
  RobotoRomanRegular14,
  RobotoRomanMedium14,
  RobotoRomanSemiBold14,
  MontserratMedium14,
}
