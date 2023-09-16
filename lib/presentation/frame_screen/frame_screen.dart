import 'dart:convert' as convert;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:varun_s_application1/core/app_export.dart';
import 'package:varun_s_application1/core/utils/validation_functions.dart';
import 'package:varun_s_application1/utils/api_list.dart';
import 'package:varun_s_application1/widgets/custom_button.dart';
import 'package:varun_s_application1/widgets/custom_text_form_field.dart';

import '../AshaDetail/asha_detail_screen.dart';
import 'controller/frame_controller.dart';

// ignore_for_file: must_be_immutable
class FrameScreen extends StatefulWidget {
  const FrameScreen({Key? key}) : super(key: key);

  @override
  State<FrameScreen> createState() => _FrameScreenState();
}

class _FrameScreenState extends State<FrameScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FrameController controller = FrameController();
  bool showOtp = false;
  bool showLoader = false;

  late String otpNumber;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding: getPadding(left: 24, top: 89, right: 24),
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.indigo),
                                )),
                            Container(
                                margin: EdgeInsets.only(top: height * 0.05),
                                padding: EdgeInsets.symmetric(vertical: 8),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "ASHA WORKER'S NAME",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                            CustomTextFormField(
                                focusNode: FocusNode(),
                                controller: controller.nameController,
                                margin: EdgeInsets.symmetric(vertical: 8),
                                variant:
                                    TextFormFieldVariant.OutlineBluegray100,
                                shape: TextFormFieldShape.RoundedBorder20,
                                padding: TextFormFieldPadding.PaddingAll19,
                                fontStyle:
                                    TextFormFieldFontStyle.RobotoRomanRegular14,
                                textInputType: TextInputType.name,
                                ),
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "PHONE NO",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                            CustomTextFormField(
                                controller: controller.phonenumberController,
                                margin: EdgeInsets.symmetric(vertical: 8),
                                variant:
                                    TextFormFieldVariant.OutlineBluegray100,
                                shape: TextFormFieldShape.RoundedBorder20,
                                padding: TextFormFieldPadding.PaddingAll19,
                                fontStyle:
                                    TextFormFieldFontStyle.RobotoRomanRegular14,
                                textInputType: TextInputType.phone,
                                validator: (value) {
                                  if (!isValidPhone(value)) {
                                    return "Please enter valid phone number";
                                  }
                                  return null;
                                }),
                            (showOtp == true)
                                ? Column(
                                    children: [
                                      Container(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 8),
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "ENTER OTP",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      CustomTextFormField(
                                          controller: controller.otpController,
                                          margin: getMargin(top: 16),
                                          variant: TextFormFieldVariant
                                              .OutlineBluegray100,
                                          shape: TextFormFieldShape
                                              .RoundedBorder20,
                                          padding:
                                              TextFormFieldPadding.PaddingT19,
                                          fontStyle: TextFormFieldFontStyle
                                              .RobotoRomanRegular14,
                                          textInputAction: TextInputAction.done,
                                          textInputType: TextInputType.number,
                                          suffixConstraints: BoxConstraints(
                                              maxHeight: getVerticalSize(56))),
                                    ],
                                  )
                                : Container(),
                            (showOtp == true)
                                ? CustomButton(
                                    onTap: () {
                                      if (controller.otpController.text !=
                                          otpNumber) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                elevation: 5.0,
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 20),
                                                backgroundColor: Colors.red,
                                                content: Text(
                                                  "Please enter correct OTP!",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )));
                                      } else {
                                        Get.to(AshaDetailScreen(
                                          Ashaname:
                                              controller.nameController.text,
                                          phoneNumber: controller
                                              .phonenumberController.text,
                                        ));
                                      }
                                    },
                                    height: height * 0.08,
                                    text: "SUBMIT",
                                    margin: getMargin(top: 40),
                                    shape: ButtonShape.RoundedBorder20,
                                    padding: ButtonPadding.PaddingAll18,
                                    fontStyle:
                                        ButtonFontStyle.RobotoRomanRegular16)
                                : CustomButton(
                                    onTap: () async {
                                      if (controller.phonenumberController.text
                                              .length !=
                                          10) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                elevation: 5.0,
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 20),
                                                backgroundColor: Colors.red,
                                                content: Text(
                                                  "Please enter phone number upto 10 digits",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )));
                                      } else {
                                        setState(() {
                                          showLoader = true;
                                        });
                                        (showLoader == true)
                                            ? showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    title: Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  );
                                                })
                                            : Container();
                                        final queryParameters = {
                                          'phlebo_no': controller
                                              .phonenumberController.text
                                              .toString()
                                        };
                                        try {
                                          Uri uri = Uri.http(
                                              API.baseUrl, API.verifyLogin);
                                          print(uri);
                                          http.Response response = await http
                                              .post(uri, body: queryParameters);
                                          print(response.body);
                                          print(response.statusCode);
                                          if (response.statusCode == 200) {
                                            var jsonResponse = convert
                                                .jsonDecode(response.body);

                                            if (jsonResponse["message"] ==
                                                "Success") {
                                              if (kDebugMode) {
                                                debugPrint(
                                                    jsonResponse.toString());
                                              } else {
                                                print(jsonResponse);
                                              }
                                              var internalMap =
                                                  jsonResponse['result'];
                                              if (kDebugMode) {
                                                debugPrint(internalMap[0][1]
                                                    .toString());
                                              } else {
                                                print(internalMap.toString());
                                              }
                                              Navigator.pop(context);

                                              setState(() {
                                                showOtp = true;
                                                otpNumber = internalMap[0][1]
                                                    .toString();
                                              });
                                            } else {
                                              Navigator.pop(context);
                                              showDialog(
                                                  context: context,
                                                  builder: ((context) {
                                                    return AlertDialog(
                                                      title: const Icon(
                                                        Icons.cancel,
                                                        size: 56,
                                                        color: Colors.red,
                                                      ),
                                                      content: Text(
                                                        "Mobile does not exist",
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      actions: [
                                                        OutlinedButton(
                                                            onPressed: (() {
                                                              Navigator.pop(
                                                                  context);
                                                            }),
                                                            child: const Text(
                                                                "Dismiss"))
                                                      ],
                                                    );
                                                  }));
                                            }
                                          } else {
                                            Navigator.pop(context);
                                            showDialog(
                                                context: context,
                                                builder: ((context) {
                                                  return AlertDialog(
                                                    title: const Icon(
                                                      Icons.cancel,
                                                      size: 56,
                                                      color: Colors.red,
                                                    ),
                                                    content: Text(
                                                      'Request failed with status: ${response.statusCode}.',
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    actions: [
                                                      OutlinedButton(
                                                          onPressed: (() {
                                                            Navigator.pop(
                                                                context);
                                                          }),
                                                          child: const Text(
                                                              "Dismiss"))
                                                    ],
                                                  );
                                                }));
                                          }
                                        } on PlatformException {
                                          Navigator.pop(context);
                                          showDialog(
                                              context: context,
                                              builder: ((context) {
                                                return AlertDialog(
                                                  title: const Icon(
                                                    Icons.cancel,
                                                    size: 56,
                                                    color: Colors.red,
                                                  ),
                                                  content: const Text(
                                                    'Failed to get platform version.',
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  actions: [
                                                    OutlinedButton(
                                                        onPressed: (() {
                                                          Navigator.pop(
                                                              context);
                                                        }),
                                                        child: const Text(
                                                            "Dismiss"))
                                                  ],
                                                );
                                              }));
                                        }
                                      }
                                    },
                                    height: height * 0.08,
                                    text: "Get OTP",
                                    margin: getMargin(top: 40),
                                    shape: ButtonShape.RoundedBorder20,
                                    padding: ButtonPadding.PaddingAll4,
                                    fontStyle:
                                        ButtonFontStyle.RobotoRomanRegular16),
                          ]),
                    )))));
  }
}
