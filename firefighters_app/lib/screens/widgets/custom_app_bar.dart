import 'package:firefighters_app/screens/profile.dart';
import 'package:firefighters_app/utilities/resources/ffa_colors.dart';
import 'package:firefighters_app/utilities/resources/ffa_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({this.appBar, this.titleText});
  final AppBar? appBar;
  final String? titleText;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: FFAColor.lightGreyBackgroundColor,
      title: Text(
        titleText!,
        style: FFAStyles.fatAppBarText,
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
                  color: FFAColor.mainRedColor,
                ),
                Text(
                  'Profile',
                  style: TextStyle(
                    color: FFAColor.mainRedColor,
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
  Size get preferredSize => new Size.fromHeight(appBar!.preferredSize.height);
}
