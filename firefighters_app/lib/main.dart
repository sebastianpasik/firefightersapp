import 'package:firefighters_app/screens/home.dart';
import 'package:firefighters_app/screens/login.dart';
import 'package:firefighters_app/screens/registration.dart';
import 'package:firefighters_app/utilities/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: kMainRedColor,
      theme: ThemeData(
        fontFamily: 'OpenSans',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/registration': (context) => Registration(),
        '/home': (context) => Home(),
      },
    );
  }
}
