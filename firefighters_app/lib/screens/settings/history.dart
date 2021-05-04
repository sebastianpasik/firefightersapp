// @dart=2.9
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firefighters_app/main.dart';
import 'package:firefighters_app/utilities/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';

NotificationContent notificationContent;
final _firestore = FirebaseFirestore.instance;

class History extends StatefulWidget {
  static const String id = 'historyScreen';
  @override
  _HistoryState createState() => _HistoryState();

  static void callbackDispatcher() {
    Workmanager.executeTask((task, inputData) {
      if (notificationContent != null) {
        showSoundUriNotification(
            0, notificationContent.title, notificationContent.message);
      }
      return Future.value(true);
    });
  }
}

class _HistoryState extends State<History> {
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
      loggedInUser = user;
      print(user.email);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: BackButton(color: kMainRedColor),
        backgroundColor: kLightGreyBackgroundColor,
        title: Text(
          'History',
          style: kFatAppBarText,
        ),
      ),
      backgroundColor: kLightGreyBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('messages')
                  .orderBy('timestamp')
                  .snapshots(),
              // ignore: missing_return
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final notifications = snapshot.data.docs.reversed;
                  var messageWidgets = <MessageBubble>[];
                  for (var notification in notifications) {
                    String textMessage = notification.data()['text'];
                    String sender = notification.data()['notifier'];
                    if (notification == notifications.first) {
                      // widget._sender = sender;
                      // widget._txtMessage = textMessage;
                      notificationContent = NotificationContent();
                      notificationContent.changeContent(sender, textMessage);
                      Workmanager.executeTask((task, inputData) {
                        if (notificationContent != null) {
                          showSoundUriNotification(0, notificationContent.title,
                              notificationContent.message);
                        }
                        return Future.value(true);
                      });
                    }
                    final messageWidget = MessageBubble(
                      message: textMessage,
                      sender: sender,
                      isCurrentUser: sender == loggedInUser.email,
                    );
                    messageWidgets.add(messageWidget);
                  }
                  return Expanded(
                    child: ListView(
                      reverse: true,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20.0),
                      children: messageWidgets,
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationContent extends ChangeNotifier {
  String title;
  String message;

  void changeContent(String newTitle, String newMessage) {
    title = newTitle;
    message = newMessage;
  }
}

Future<void> showSoundUriNotification(
    int id, String title, String description) async {
  /// this calls a method over a platform channel implemented within the
  /// example app to return the Uri for the default alarm sound and uses
  /// as the notification sound
  const insistentFlag = 4;
  final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'high_importance_channel',
      'High Importance Notifications',
      'This channel is used for important notifications.',
      icon: 'baseline_local_fire_black',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      sound: RawResourceAndroidNotificationSound('alert_tone'),
      additionalFlags: Int32List.fromList(<int>[insistentFlag]),
      largeIcon: DrawableResourceAndroidBitmap('baseline_local_fire_black'),
      styleInformation: const DefaultStyleInformation(true, true));
  final platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
      id, title, description, platformChannelSpecifics);
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.message, this.sender, this.isCurrentUser});
  final bool isCurrentUser;
  final String message;
  final String sender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(fontSize: 10.0, color: Colors.black54),
          ),
          Material(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isCurrentUser ? 30 : 0),
              topRight: Radius.circular(isCurrentUser ? 0 : 30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            elevation: 5.0,
            color: isCurrentUser ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                message,
                style: TextStyle(
                    fontSize: 15.0,
                    color: isCurrentUser ? Colors.white : Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
