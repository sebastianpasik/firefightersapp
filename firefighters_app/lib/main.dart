import 'package:firebase_core/firebase_core.dart';
import 'package:firefighters_app/screens/home/home.dart';
import 'package:firefighters_app/screens/location.dart';
import 'package:firefighters_app/screens/login.dart';
import 'package:firefighters_app/screens/navigation.dart';
import 'package:firefighters_app/screens/profile.dart';
import 'package:firefighters_app/screens/registration.dart';
import 'package:firefighters_app/screens/settings/settings.dart';
import 'package:firefighters_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('baseline_local_fire_black');
  final InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
  });
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'OpenSans', accentColor: kMainRedColor),
      initialRoute: Login.id,
      routes: {
        Login.id: (context) => Login(),
        Registration.id: (context) => Registration(),
        Home.id: (context) => Home(),
        Navigation.id: (context) => Navigation(),
        Settings.id: (context) => Settings(),
        Location.id: (context) => Location(),
        Profile.id: (context) => Profile(),
      },
    );
  }
}
