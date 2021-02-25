import 'package:firefighters_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  TextFieldContainer(
      {this.child, this.height = 50, this.width, this.margin = 0.0});
  final Widget child;
  final double height;
  final double width;
  final double margin;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(margin),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: kInputTextBackgroundColor,
          border: Border(
            bottom: BorderSide(color: kMainRedColor),
          ),
        ),
        child: child);
  }
}
