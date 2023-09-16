import 'dart:async';

import 'package:flutter/material.dart';
import 'package:varun_s_application1/core/app_export.dart';
import 'package:varun_s_application1/presentation/Eyesymptdata/EyeSympData.dart';
import 'package:varun_s_application1/presentation/Handsymptdata/HandSympDataScreen.dart';
import 'package:varun_s_application1/presentation/Home_Screen/home_screen.dart';

import '../../widgets/custom_button.dart';
import 'controller/TestTypeSelector.dart';

// ignore: must_be_immutable
class TestTypeSelectorScreen extends StatefulWidget {
  late String phoneNumber;
  late String phleboname;
  late bool iseye;
  late bool ishand;
  late bool isfeet;

  TestTypeSelectorScreen({
    Key? key,
    required this.phoneNumber,
    required this.phleboname,
    required this.iseye,
    required this.isfeet,
    required this.ishand,
  }) : super(key: key);

  @override
  State<TestTypeSelectorScreen> createState() => _TestTypeSelectorScreenState();
}

class _TestTypeSelectorScreenState extends State<TestTypeSelectorScreen> {
  final RegisterNewCaseController controller = RegisterNewCaseController();
  String s = "";
  Timer? _timer;
  void Snakbarfun() {
    var snackbar = SnackBar(
      content: Text("You Have already completed the test for $s"),
      backgroundColor: Colors.indigo,
      elevation: 100,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    _timer = Timer(Duration(seconds: 2), () {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    });
  }

  void eyefunction() {
    if (widget.iseye) {
      Get.to(EyeSympDataScreen(
          phoneNumber: widget.phoneNumber,
          phleboname: widget.phleboname,
          iseye: false,
          isfeet: widget.isfeet,
          ishand: widget.ishand));
    } else {
      setState(() {
        s = "Eye";
      });
      Snakbarfun();
    }
  }

  void handfunction() {
    if (widget.ishand) {
      Get.to(HandSympDataScreen(
        phoneNumber: widget.phoneNumber,
        phleboname: widget.phleboname,
        iseye: widget.iseye,
        isfeet: widget.isfeet,
        ishand: false,
      ));
    } else {
      setState(() {
        s = "Hand";
      });
      Snakbarfun();
    }
  }

  void feetfunction() {
    if (widget.isfeet) {
      Get.to(EyeSympDataScreen(
        phoneNumber: widget.phoneNumber,
        phleboname: widget.phleboname,
        iseye: widget.iseye,
        isfeet: false,
        ishand: widget.ishand,
      ));
    } else {
      setState(() {
        s = "Feet";
      });
      Snakbarfun();
    }
  }

  var snackbar = SnackBar(
    content: Text('Hii this is GFG\'s SnackBar'),
    backgroundColor: Colors.green,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
  );
  @override
  Widget build(BuildContext context) {
    var Height = MediaQuery.of(context).size.height;
    var Width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: true,
          backgroundColor: ColorConstant.whiteA700,
          body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    eyefunction();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          widget.iseye ? Colors.indigo : Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Eye Symptoms",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ).paddingSymmetric(horizontal: 15),
                        Icon(
                          Icons.remove_red_eye,
                          // size: MediaQuery.of(context).size.height * 0.08,
                          color: Colors.white,
                        ).paddingAll(8),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                InkWell(
                  onTap: () {
                    handfunction();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          widget.ishand ? Colors.indigo : Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Hand Symptoms",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ).paddingSymmetric(horizontal: 15),
                        Icon(
                          Icons.back_hand,
                          // size: MediaQuery.of(context).size.height * 0.08,
                          color: Colors.white,
                        ).paddingAll(8),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                InkWell(
                  onTap: () {
                    feetfunction();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          widget.isfeet ? Colors.indigo : Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Feet Symptoms",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ).paddingSymmetric(horizontal: 15),
                        Icon(
                          Icons.remove_red_eye,
                          // size: MediaQuery.of(context).size.height * 0.08,
                          color: Colors.white,
                        ).paddingAll(8),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Visibility(
                  visible:
                      !(widget.iseye) && !(widget.ishand) && !(widget.isfeet),
                  child: InkWell(
                    onTap: () {
                      Get.to(HomeScreen(
                        phoneNumber: widget.phoneNumber,
                        phleboname: widget.phleboname,
                      ));
                    },
                    child: CustomButton(
                        height: getVerticalSize(60),
                        text: "Result",
                        margin: EdgeInsets.symmetric(horizontal: width * 0.2),
                        shape: ButtonShape.RoundedBorder20,
                        padding: ButtonPadding.PaddingAll18),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
