import 'package:firebase_core/firebase_core.dart';
import 'package:firefighters_app/screens/home.dart';
import 'package:firefighters_app/screens/location.dart';
import 'package:firefighters_app/screens/login.dart';
import 'package:firefighters_app/screens/navigation.dart';
import 'package:firefighters_app/screens/profile.dart';
import 'package:firefighters_app/screens/registration.dart';
import 'package:firefighters_app/screens/settings.dart';
import 'package:firefighters_app/utilities/constants.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: kMainRedColor,
      theme: ThemeData(
        fontFamily: 'OpenSans',
      ),
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
