import 'package:firefighters_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.iconData, this.onPress});

  final IconData iconData;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      onPressed: onPress,
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: kMainRedColor,
      constraints: BoxConstraints.tightFor(
        width: 57.0,
        height: 57.0,
      ),
    );
  }
}
