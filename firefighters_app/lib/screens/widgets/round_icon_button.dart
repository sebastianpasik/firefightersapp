import 'package:firefighters_app/utilities/resources/ffa_colors.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({
    this.child,
    this.onPress,
    this.diameter = 57.0,
    this.fillColor = FFAColor.mainRedColor,
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
