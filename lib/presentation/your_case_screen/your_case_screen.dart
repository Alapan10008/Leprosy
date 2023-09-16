import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:varun_s_application1/core/app_export.dart';
import 'package:varun_s_application1/presentation/your_case_screen/controller/your_case_screen_controller.dart';

// ignore: must_be_immutable
class YourCaseScreen extends StatefulWidget {
  late String phoneNumber;
  late String phleboname;

  YourCaseScreen({
    Key? key,
    required this.phoneNumber,
    required this.phleboname,
  }) : super(key: key);

  @override
  State<YourCaseScreen> createState() => _YourCaseScreenState();
}

class _YourCaseScreenState extends State<YourCaseScreen> {
  final List<String> names = <String>[
    'Person1',
    'Person2',
    'Person3',
    'Person4',
  ];
  void ontap() async {
    final date = DateTime.now();
    final dueDate = date.add(Duration(days: 7));
  }

  DateTime selectedDate = DateTime.now();
  final YourCaseScreenController controller = YourCaseScreenController();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(2023),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.indigo, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.indigo, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null)
      setState(() {
        selectedDate = picked;
        controller.dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }

  void initState() {
    controller.dateController.text = DateFormat.yMd().format(DateTime.now());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorConstant.whiteA700,
          appBar: AppBar(
            backgroundColor: Colors.indigo,
            title: Center(child: Text('Your Cases')),
            leading: null,
            actions: [
              IconButton(
                icon: Icon(Icons.calendar_month),
                onPressed: () {
                  _selectDate(context);
                },
              ),
            ],
          ),
          body: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: names.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(8, 5, 20, 5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.black)),
                  // color: Colors.grey.withOpacity(0.2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${names[index]}',
                        style: TextStyle(fontSize: 18, color: Colors.indigo),
                      ).paddingSymmetric(horizontal: 10),
                      Icon(Icons.done_outline_sharp)
                    ],
                  ),
                );
              })),
    );
  }
}
