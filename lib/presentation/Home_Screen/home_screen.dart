import 'package:flutter/material.dart';
import 'package:varun_s_application1/core/app_export.dart';
import 'package:varun_s_application1/presentation/Register_new_case/registrer_new_case.dart';
import 'package:varun_s_application1/presentation/Wallet/wallet_screen.dart';
import 'package:varun_s_application1/presentation/report_home_screen/report_home_screen.dart';

import 'controller/home_screen_controller.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  late String phoneNumber;
  late String phleboname;

  HomeScreen({
    Key? key,
    required this.phoneNumber,
    required this.phleboname,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenController controller = HomeScreenController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorConstant.whiteA700,
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black.withOpacity(0.5),
                              style: BorderStyle.solid,
                              width: 2,
                            )),
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person_add_alt_1_sharp,
                              size: MediaQuery.of(context).size.height * 0.08,
                              color: Colors.grey.shade700,
                            ).paddingAll(8),
                            Text(
                              "Register New Case",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Get.to(RegisterNewCaseScreen(
                            phoneNumber: widget.phoneNumber,
                            phleboname: widget.phleboname));
                      },
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black.withOpacity(0.5),
                              style: BorderStyle.solid,
                              width: 2,
                            )),
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.wallet,
                              size: MediaQuery.of(context).size.height * 0.08,
                              color: Colors.grey.shade700,
                            ).paddingAll(8),
                            Text(
                              "Wallet",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Get.to(WalletScreen(
                            phoneNumber: widget.phoneNumber,
                            phleboname: widget.phleboname));
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black.withOpacity(0.5),
                              style: BorderStyle.solid,
                              width: 2,
                            )),
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.library_books_rounded,
                              size: MediaQuery.of(context).size.height * 0.08,
                              color: Colors.grey.shade700,
                            ).paddingAll(8),
                            Text(
                              "Report",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ).paddingAll(8),
                          ],
                        ),
                      ),
                      onTap: () {
                        Get.to(ReportHomeScreen(
                            phoneNumber: widget.phoneNumber,
                            phleboname: widget.phleboname));
                      },
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black.withOpacity(0.5),
                              style: BorderStyle.solid,
                              width: 2,
                            )),
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.menu_book_outlined,
                              size: MediaQuery.of(context).size.height * 0.08,
                              color: Colors.grey.shade700,
                            ).paddingAll(8),
                            Text(
                              "Learning",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ).paddingAll(8),
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
