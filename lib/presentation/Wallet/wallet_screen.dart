import 'package:flutter/material.dart';
import 'package:varun_s_application1/core/app_export.dart';

import 'controller/wallet_controller.dart';

// ignore: must_be_immutable
class WalletScreen extends StatefulWidget {
  late String phoneNumber;
  late String phleboname;

  WalletScreen({
    Key? key,
    required this.phoneNumber,
    required this.phleboname,
  }) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final WalletController controller = WalletController();

  @override
  Widget build(BuildContext context) {
    var Height = MediaQuery.of(context).size.height;
    var Width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: true,
          backgroundColor: ColorConstant.whiteA700,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: width * 0.9,
                  height: height * 0.3,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(top: 8, left: 8, child: Text("Month-Feb")),
                      Positioned(
                          bottom: 8,
                          right: 8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Total wallet Amount").paddingAll(5),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.indigo,
                                ),
                                child: Text(
                                  "6000/-",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ),
              Text("Incentive for case detected")
                  .paddingSymmetric(vertical: 15),
              Text("Incentive for PB").paddingSymmetric(vertical: 15),
              Text("Incentive for MB").paddingSymmetric(vertical: 15),
            ],
          )),
    );
  }
}
