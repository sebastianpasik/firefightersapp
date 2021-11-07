// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:firefighters_app/screens/home/home.dart';
import 'package:firefighters_app/screens/location.dart';
import 'package:firefighters_app/screens/login.dart';
import 'package:firefighters_app/screens/navigation.dart';
import 'package:firefighters_app/screens/profile.dart';
import 'package:firefighters_app/screens/registration.dart';
import 'package:firefighters_app/screens/settings/history.dart';
import 'package:firefighters_app/screens/settings/settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firefighters_app/utilities/resources/ffa_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';
import 'package:dcdg/dcdg.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //FirebaseMessaging messaging = FirebaseMessaging.instance;
  const initializationSettingsAndroid =
      AndroidInitializationSettings('baseline_local_fire_black');
  const channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.max,
    sound: RawResourceAndroidNotificationSound('alert_tone'),
  );

  // await flutterLocalNotificationsPlugin
  //     .resolvePlatformSpecificImplementation<
  //         AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);

  final initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    if (payload != null) {
      print('notification payload: $payload');
    }
  });

  await Workmanager.initialize(

      // The top level function, aka callbackDispatcher
      History.callbackDispatcher,

      // If enabled it will post a notification whenever
      // the task is running. Handy for debugging tasks
      isInDebugMode: true);
  //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //FirebaseMessaging.instance.sendMessage();
  //RemoteMessage remoteMessage = RemoteMessage();

  runApp(MyApp());

  //showSoundUriNotification(0, senderstr!, txtMessagestr!);
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          //return SomethingWentWrong();
          print('Something went wrong in Flutter Fire');
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                fontFamily: 'OpenSans', accentColor: FFAColor.mainRedColor),
            initialRoute: Login.id,
            routes: {
              Login.id: (context) => Login(),
              Registration.id: (context) => Registration(),
              Home.id: (context) => Home(),
              Navigation.id: (context) => Navigation(),
              Settings.id: (context) => Settings(),
              LocationScreen.id: (context) => LocationScreen(),
              Profile.id: (context) => Profile(),
              History.id: (context) => History(),
            },
          );
        }
        // Otherwise, show something whilst waiting for initialization to complete
        print('firebase not Initialised');
        return Container(
          height: double.infinity,
          width: double.infinity,
          color: Color.fromRGBO(34, 36, 49, 1),
          alignment: Alignment.bottomCenter,
        );
      },
    );
  }
}

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();
//   print('Got a message whilst in the foreground!');
//   print('Message data: ${message.data}');
//
//   if (message.notification != null) {
//     print('Message also contained a notification: ${message.notification}');
//   }
//   // showSoundUriNotification(
//   //     0, message.notification!.title!, message.notification!.body!);
//   //print("Handling a background message: ${message.messageId}");
//   print('Category ${message.category}');
//   print('Message id ${message.messageId}');
//   print('senderId id ${message.senderId}');
//   print('message type ${message.messageType}');
//   print('ttl ${message.ttl}');
//   //print('Notification to string ${message.notification.android.}');
// }
