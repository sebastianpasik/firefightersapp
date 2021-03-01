import 'package:firefighters_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  static const String id = 'profile';
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  child: Text(
                    'Full name',
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
                    'Adolf Russledorf',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  child: Text(
                    'Phone number',
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
                    '+44 07567 23080',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
