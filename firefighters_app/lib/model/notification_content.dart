// @dart=2.9
import 'package:flutter/material.dart';

class NotificationContent extends ChangeNotifier {
  String title;
  String message;

  void changeContent(String newTitle, String newMessage) {
    title = newTitle;
    message = newMessage;
  }
}
