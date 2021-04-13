import 'package:firebase_auth/firebase_auth.dart';
import 'package:firefighters_app/screens/login.dart';
import 'package:firefighters_app/screens/settings/history.dart';
import 'package:firefighters_app/screens/settings/settings_service.dart';
import 'package:firefighters_app/screens/widgets/onclick_action_button.dart';
import 'package:firefighters_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  static const String id = 'settings';
  final _settingsService = SettingsService();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        OnClickActionButton(
          label: 'History',
          textStyle: kSettingsText,
          onClick: () {
            Navigator.pushNamed(context, History.id);
            //_settingsService.getNotificationsStream();
          },
        ),
        OnClickActionButton(
          label: 'Log out',
          textStyle: kRedText,
          onClick: () {
            _settingsService.logOut();
            Navigator.pushReplacementNamed(context, Login.id);
          },
        ),
      ],
    );
  }
}
