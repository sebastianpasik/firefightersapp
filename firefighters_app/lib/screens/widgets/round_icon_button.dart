import 'package:firefighters_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({
    this.child,
    this.onPress,
    this.diameter = 57.0,
    this.fillColor = kMainRedColor,
  });

  final void Function()? onPress;
  final double diameter;
  final Widget? child;
  final Color fillColor;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: fillColor,
      constraints: BoxConstraints.tightFor(
        width: diameter,
        height: diameter,
      ),
      child: child,
    );
  }
}
