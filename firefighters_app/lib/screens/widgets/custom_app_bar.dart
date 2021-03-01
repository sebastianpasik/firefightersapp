import 'package:firefighters_app/screens/profile.dart';
import 'package:firefighters_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({this.appBar, this.titleText});
  final AppBar appBar;
  final String titleText;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: kLightGreyBackgroundColor,
      title: Text(
        titleText,
        style: kFatAppBarText,
      ),
      automaticallyImplyLeading: false,
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, Profile.id),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.account_circle,
                  color: kMainRedColor,
                ),
                Text(
                  'Profile',
                  style: TextStyle(
                    color: kMainRedColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
