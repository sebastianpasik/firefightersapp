import 'package:firefighters_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({
    this.child,
    this.onPress,
    this.diameter = 57.0,
  });

  final void Function()? onPress;
  final double diameter;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: child,
      onPressed: onPress,
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: kMainRedColor,
      constraints: BoxConstraints.tightFor(
        width: diameter,
        height: diameter,
      ),
    );
  }
}
