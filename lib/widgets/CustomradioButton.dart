import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioGroup extends StatefulWidget {
  String? value;
  String? value1;
  String? value2;
  RadioGroup(
      {Key? key,
      required this.value,
      required this.value1,
      required this.value2})
      : super(key: key);

  @override
  RadioGroupWidget createState() =>
      RadioGroupWidget(value: value, value1: value1, value2: value2);
}

class RadioGroupWidget extends State {
  RadioGroupWidget({this.value, this.value1, this.value2});
  String? value;
  String? value1;
  String? value2;

  // Default Radio Button Selected Item When App Starts.

  // Group Value for Radio Button.
  int id = 0;

  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Radio(
                value: 1,
                groupValue: id,
                onChanged: (val) {
                  setState(() {
                    value = value1;
                    id = 1;
                  });
                },
              ),
              Text(value1!),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.34,
          ),
          Row(
            children: [
              Radio(
                value: 2,
                groupValue: id,
                onChanged: (val) {
                  setState(() {
                    value = value2;
                    id = 2;
                  });
                },
              ),
              Text(value2!),
            ],
          ),
        ],
      ),
    );
  }
}
