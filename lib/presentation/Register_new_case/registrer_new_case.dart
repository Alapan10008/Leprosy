import 'package:flutter/material.dart';
import 'package:varun_s_application1/core/app_export.dart';

import '../../widgets/CustomradioButton.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../TestTypeSelector/TestTypeSelector.dart';
import 'controller/register_new_case.dart';

// ignore: must_be_immutable
class RegisterNewCaseScreen extends StatefulWidget {
  late String phoneNumber;
  late String phleboname;
  String _Gender = "";

  RegisterNewCaseScreen(
      {Key? key, required this.phoneNumber, required this.phleboname})
      : super(key: key);

  @override
  State<RegisterNewCaseScreen> createState() => _RegisterNewCaseScreenState();
}

class _RegisterNewCaseScreenState extends State<RegisterNewCaseScreen> {
  final RegisterNewCaseController controller = RegisterNewCaseController();
  List<List<dynamic>> dropdownItemList = [];
  List<dynamic> selectedDropDownList = [];
  String dropdownvalue = 'Doctor1';
  var items = [
    'Doctor1',
    'Doctor2',
    'Doctor3',
    'Doctor4',
    'Doctor5',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: true,
          backgroundColor: ColorConstant.whiteA700,
          body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(
                          bottom: 20,
                        ),
                        child: Text(
                          "Fill The Patient Detail",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Colors.indigo),
                        )),
                    Container(
                        alignment: Alignment.topLeft,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          "Name",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                    CustomTextFormField(
                      focusNode: FocusNode(),
                      variant: TextFormFieldVariant.OutlineBluegray100,
                      controller: controller.NameController,
                      textInputType: TextInputType.name,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          "Age",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                    CustomTextFormField(
                      focusNode: FocusNode(),
                      variant: TextFormFieldVariant.OutlineBluegray100,
                      controller: controller.AgeController,
                      textInputType: TextInputType.number,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          "Gender",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                    RadioGroup(
                      value: controller.gender,
                      value1: 'Male',
                      value2: 'Female',
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          "No of Family Member",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                    CustomTextFormField(
                      focusNode: FocusNode(),
                      variant: TextFormFieldVariant.OutlineBluegray100,
                      controller: controller.FamilyMemberController,
                      textInputType: TextInputType.number,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          "Adhar No",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                    CustomTextFormField(
                      focusNode: FocusNode(),
                      variant: TextFormFieldVariant.OutlineBluegray100,
                      controller: controller.AadharNoController,
                      textInputType: TextInputType.number,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          "ABHA No",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                    CustomTextFormField(
                      focusNode: FocusNode(),
                      variant: TextFormFieldVariant.OutlineBluegray100,
                      controller: controller.AbhaNoController,
                      textInputType: TextInputType.number,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          "Address",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                    CustomTextFormField(
                      focusNode: FocusNode(),
                      variant: TextFormFieldVariant.OutlineBluegray100,
                      controller: controller.AddressController,
                      textInputType: TextInputType.text,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          "Village/Urban pocket",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                    CustomTextFormField(
                      focusNode: FocusNode(),
                      variant: TextFormFieldVariant.OutlineBluegray100,
                      controller: controller.VillageController,
                      textInputType: TextInputType.text,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          "District",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                    CustomTextFormField(
                      focusNode: FocusNode(),
                      variant: TextFormFieldVariant.OutlineBluegray100,
                      controller: controller.DistrictController,
                      textInputType: TextInputType.text,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          "Block",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                    CustomTextFormField(
                      focusNode: FocusNode(),
                      variant: TextFormFieldVariant.OutlineBluegray100,
                      controller: controller.BlockController,
                      textInputType: TextInputType.text,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          "State",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                    CustomTextFormField(
                      focusNode: FocusNode(),
                      variant: TextFormFieldVariant.OutlineBluegray100,
                      controller: controller.StateController,
                      textInputType: TextInputType.text,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          "Contact No",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                    CustomTextFormField(
                      focusNode: FocusNode(),
                      variant: TextFormFieldVariant.OutlineBluegray100,
                      controller: controller.ContactController,
                      textInputType: TextInputType.number,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          "Screening Date",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                    CustomTextFormField(
                      focusNode: FocusNode(),
                      variant: TextFormFieldVariant.OutlineBluegray100,
                      controller: controller.ScreeningDateController,
                      textInputType: TextInputType.datetime,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          "Referred to",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                    Container(
                      margin: EdgeInsets.only(bottom: 50),
                      width: MediaQuery.of(context).size.width * 0.9,
                      // decoration: BoxDecoration(
                      //     borderRadius:
                      //         BorderRadius.all(Radius.circular(20))),
                      color: Colors.grey.shade50,
                      child: DropdownButton(
                        // Initial Value
                        isExpanded: true,
                        value: dropdownvalue,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(TestTypeSelectorScreen(
                          phoneNumber: widget.phoneNumber,
                          phleboname: widget.phleboname,
                          iseye: true,
                          isfeet: true,
                          ishand: true,
                        ));
                      },
                      child: CustomButton(
                          height: getVerticalSize(60),
                          text: "lbl_submit".tr,
                          margin: getMargin(left: 2, bottom: 65),
                          shape: ButtonShape.RoundedBorder20,
                          padding: ButtonPadding.PaddingAll18),
                    )
                  ],
                ),
              ))),
    );
  }
}
