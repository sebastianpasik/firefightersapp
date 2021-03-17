import 'package:firebase_auth/firebase_auth.dart';
import 'package:firefighters_app/screens/login.dart';
import 'package:firefighters_app/screens/widgets/onclick_action_button.dart';
import 'package:firefighters_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  static const String id = 'settings';
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        OnClickActionButton(
          label: 'Log out',
          textStyle: kRedText,
          onClick: () {
            _auth.signOut();
            Navigator.pushReplacementNamed(context, Login.id);
          },
        ),
      ],
    );
  }
}
