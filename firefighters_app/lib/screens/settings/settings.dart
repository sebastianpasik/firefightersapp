import 'package:firefighters_app/screens/login.dart';
import 'package:firefighters_app/screens/settings/history.dart';
import 'package:firefighters_app/screens/settings/settings_service.dart';
import 'package:firefighters_app/screens/widgets/onclick_action_button.dart';
import 'package:firefighters_app/utilities/resources/ffa_styles.dart';
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
          textStyle: FFAStyles.settingsText,
          onClick: () {
            Navigator.pushNamed(context, History.id);
            //_settingsService.getNotificationsStream();
          },
        ),
        OnClickActionButton(
          label: 'Log out',
          textStyle: FFAStyles.redText,
          onClick: () {
            _settingsService.logOut();
            Navigator.pushReplacementNamed(context, Login.id);
          },
        ),
      ],
    );
  }
}
