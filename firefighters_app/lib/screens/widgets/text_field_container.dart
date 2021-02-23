import 'package:firefighters_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  TextFieldContainer({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.0,
        decoration: BoxDecoration(
          color: kInputTextBackgroundColor,
          border: Border(
            bottom: BorderSide(color: kMainRedColor),
          ),
        ),
        child: child);
  }
}
