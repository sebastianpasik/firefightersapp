import 'package:firefighters_app/utilities/resources/ffa_colors.dart';
import 'package:flutter/material.dart';

abstract class FFAStyles {
  FFAStyles._();

  static const fatAppBarText = TextStyle(
    color: FFAColor.mainRedColor,
    fontWeight: FontWeight.bold,
  );

  static const redText = TextStyle(
    color: FFAColor.mainRedColor,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );

  static const optionText = TextStyle(
    color: FFAColor.mainRedColor,
    fontSize: 16.0,
  );

  static const settingsText = TextStyle(
    fontSize: 18.0,
  );
}
