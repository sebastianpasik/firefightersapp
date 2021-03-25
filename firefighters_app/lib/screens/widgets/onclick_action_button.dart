import 'package:flutter/material.dart';

class OnClickActionButton extends StatelessWidget {
  OnClickActionButton(
      {@required this.label, @required this.onClick, this.textStyle});

  final String? label;
  final void Function()? onClick;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2.0,
            offset: Offset(1.0, 3.0), // shadow direction: bottom right
          )
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          margin: EdgeInsets.only(top: 12.0, left: 12.0),
          child: Text(
            label!,
            textAlign: TextAlign.start,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
