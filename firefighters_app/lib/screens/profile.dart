import 'package:firefighters_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  static const String id = 'profile';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
        loggedInUser = user;
        print(user!.email);
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
          'Profile',
          style: kFatAppBarText,
        ),
      ),
      backgroundColor: kLightGreyBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ElevatedBoxCard(
            label: 'Full name',
            value: 'Adolf Russledorf',
          ),
          ElevatedBoxCard(
            label: 'Email',
            value: loggedInUser!.email,
          ),
        ],
      ),
    );
  }
}

class ElevatedBoxCard extends StatelessWidget {
  ElevatedBoxCard({required this.label, required this.value});

  final String? label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            child: Text(
              label!,
              style: kOptionText,
            ),
            padding: EdgeInsets.only(
              left: 16.0,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.0,
            ),
            child: Text(
              value!,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
