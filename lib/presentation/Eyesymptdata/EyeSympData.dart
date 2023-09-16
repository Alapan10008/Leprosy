import 'package:flutter/material.dart';
import 'package:varun_s_application1/core/app_export.dart';

import '../../widgets/CustomradioButton.dart';
import '../../widgets/custom_button.dart';
import '../capture_image_screen/captute_image_screen.dart';
import 'controller/EyeSympData.dart';

// ignore: must_be_immutable
class EyeSympDataScreen extends StatefulWidget {
  late String phoneNumber;
  late String phleboname;
  late bool iseye;
  late bool ishand;
  late bool isfeet;

  EyeSympDataScreen({
    Key? key,
    required this.phoneNumber,
    required this.phleboname,
    required this.iseye,
    required this.isfeet,
    required this.ishand,
  }) : super(key: key);

  @override
  State<EyeSympDataScreen> createState() => _EyeSympDataScreenState();
}

class _EyeSympDataScreenState extends State<EyeSympDataScreen> {
  final EyeSympDataController controller = EyeSympDataController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorConstant.whiteA700,
          appBar: AppBar(
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            title: Text(
              "Eye Symptoms",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: ColorConstant.whiteA700,
            elevation: 0,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text(
                        "Loss of eyelashes?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )),
                  RadioGroup(
                    value: controller.eyelash,
                    value1: 'Yes',
                    value2: 'No',
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text(
                        "Loss of eyebrow?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )),
                  RadioGroup(
                    value: controller.eyebrow,
                    value1: 'Yes',
                    value2: 'No',
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text(
                        "Eyellds thickened?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )),
                  RadioGroup(
                    value: controller.eyethickend,
                    value1: 'Yes',
                    value2: 'No',
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text(
                        "Incomplete blinking?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )),
                  RadioGroup(
                    value: controller.eyeblicking,
                    value1: 'Yes',
                    value2: 'No',
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text(
                        "Vision Issue?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )),
                  RadioGroup(
                    value: controller.visionissue,
                    value1: 'Yes',
                    value2: 'No',
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(CaptureImageScreen(
                        instruction1: "Capture image of both eyes",
                        ApiEndPoint: "",
                        instruction2: "Capture eye closing movement",
                        iseye: widget.iseye,
                        isfeet: widget.isfeet,
                        ishand: widget.ishand,
                      ));
                    },
                    child: CustomButton(
                        height: getVerticalSize(60),
                        text: "Next",
                        margin: getMargin(left: 2, bottom: 65),
                        shape: ButtonShape.RoundedBorder20,
                        padding: ButtonPadding.PaddingAll18),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
