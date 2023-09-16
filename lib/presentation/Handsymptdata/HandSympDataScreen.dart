import 'package:flutter/material.dart';
import 'package:varun_s_application1/core/app_export.dart';

import '../../widgets/CustomradioButton.dart';
import '../../widgets/custom_button.dart';
import '../capture_image_screen/captute_image_screen.dart';
import 'controller/HandSympDataController.dart';

// ignore: must_be_immutable
class HandSympDataScreen extends StatefulWidget {
  late String phoneNumber;
  late String phleboname;
  late bool iseye;
  late bool ishand;
  late bool isfeet;

  HandSympDataScreen(
      {Key? key,
      required this.phoneNumber,
      required this.phleboname,
      required this.iseye,
      required this.isfeet,
      required this.ishand})
      : super(key: key);

  @override
  State<HandSympDataScreen> createState() => _HandSympDataScreenState();
}

class _HandSympDataScreenState extends State<HandSympDataScreen> {
  final HandSympDataController controller = HandSympDataController();

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
              "Hand Symptoms",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: ColorConstant.whiteA700,
            elevation: 0,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      "Numbness in hands?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                RadioGroup(
                  value: controller.numbness,
                  value1: 'Yes',
                  value2: 'No',
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      "Tingling in hands?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                RadioGroup(
                  value: controller.tingling,
                  value1: 'Yes',
                  value2: 'No',
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      "Discoloration on hands?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                RadioGroup(
                  value: controller.discoloration,
                  value1: 'Yes',
                  value2: 'No',
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      "Thickened skin on hands?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                RadioGroup(
                  value: controller.thickenedskin,
                  value1: 'Yes',
                  value2: 'No',
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      "Nodules on hands?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                RadioGroup(
                  value: controller.nodules,
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
                      instruction1: "Capture image of  both the hands",
                      ApiEndPoint: "",
                      instruction2: "Capture Hand Movement",
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
          )),
    );
  }
}
