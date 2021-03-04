import 'package:firebase_auth/firebase_auth.dart';
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
        Container(
          height: 60.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2.0,
                offset: Offset(1.0, 3.0), // shadow direction: bottom right
              )
            ],
          ),
          margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: GestureDetector(
            onTap: () {
              _auth.signOut();
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(top: 12.0, left: 12.0),
              child: Text(
                'Log out',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: kMainRedColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
