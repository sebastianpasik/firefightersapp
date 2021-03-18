import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SendAlarmData extends StatefulWidget {
  SendAlarmData({this.alarmMessage});
  final String alarmMessage;

  @override
  _SendAlarmDataState createState() => _SendAlarmDataState();
}

class _SendAlarmDataState extends State<SendAlarmData> {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference messages =
        FirebaseFirestore.instance.collection('messages');
    Future<void> sendAlarmData() {
      return messages
          .add({
            'notifier': loggedInUser.email,
            'setAlarm': true,
            'text': widget.alarmMessage
          })
          .then((value) => print("Message Sent"))
          .catchError((error) => print("Failed to send message: $error"));
    }

    return TextButton(
      onPressed: sendAlarmData,
      child: Text(
        'Alarm',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0),
      ),
    );
  }
}
