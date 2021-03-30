import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../main.dart';

class SettingsService {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  void addNewFriend() {}

  void getNotificationsStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var notification in snapshot.docs) {
        final String sender = notification.data()!['notifier'];
        final String text = notification.data()!['text'];
        showSoundUriNotification(0, sender, text);
        //print(notification.data);
      }
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   showSoundUriNotification(0, 'Email: sebastian@email.com',
  //       'Alarm on the south street in New Jersey');
  //
  //   return Text('this is example widget');
  // }

  //     if (snapshot.hasError) {
  //     return Text('Something went wrong');
  //     }
  //
  //     if (snapshot.connectionState == ConnectionState.waiting) {
  //       return Text("Loading");
  //     }
  //
  //
  //   final notifications = snapshot.data.docs;
  //   for(var notification in notifications){
  //     final sender = notification.data['notifier'];
  //     final text = notification.data['text'];
  //     showSoundUriNotification(0, sender, text);
  // }
  Widget returnNotificationStream<QuerySnapshot>() {
    return StreamBuilder(
        stream: _firestore.collection('messages').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          final notifications = snapshot.data.documents;
          for (var notification in notifications) {
            final String sender = notification.data['notifier'];
            final String text = notification.data['text'];
            showSoundUriNotification(0, sender, text);
          }
          return Text('Success');
        });
  }

  Future<void> showSoundUriNotification(
      int id, String title, String description) async {
    /// this calls a method over a platform channel implemented within the
    /// example app to return the Uri for the default alarm sound and uses
    /// as the notification sound
    const int insistentFlag = 4;
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
            'uri channel id', 'uri channel name', 'uri channel description',
            icon: 'baseline_local_fire_black',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker',
            sound: RawResourceAndroidNotificationSound('alert_tone'),
            additionalFlags: Int32List.fromList(<int>[insistentFlag]),
            largeIcon:
                DrawableResourceAndroidBitmap('baseline_local_fire_black'),
            styleInformation: const DefaultStyleInformation(true, true));
    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        id, title, description, platformChannelSpecifics);
  }

  void logOut() {
    _auth.signOut();
  }
}
