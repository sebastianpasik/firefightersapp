import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SettingsService {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  void getNotificationsStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var notification in snapshot.docs) {
        final String sender = notification.data()!['notifier'];
        final String text = notification.data()!['text'];
        //showSoundUriNotification(0, sender, text);
      }
    }
  }

  Widget returnNotificationStream<QuerySnapshot>() {
    return StreamBuilder(
        stream:
            _firestore.collection('messages').orderBy('timestamp').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading');
          }

          final notifications = snapshot.data.documents;
          for (var notification in notifications) {
            final String sender = notification.data['notifier'];
            final String text = notification.data['text'];
            //showSoundUriNotification(0, sender, text);
          }
          return Text('Success');
        });
  }

  void logOut() {
    _auth.signOut();
  }
}
