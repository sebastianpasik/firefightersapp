import 'package:firefighters_app/screens/home/send_alarm_data.dart';
import 'package:firefighters_app/screens/widgets/round_icon_button.dart';
import 'package:firefighters_app/screens/widgets/text_field_container.dart';
import 'package:firefighters_app/utilities/resources/ffa_colors.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const String id = 'home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final notificationTextController = TextEditingController();
  String? _alarmMessage = '';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: RoundIconButton(
                diameter: 150.0,
                child: SendAlarmData(
                  alarmMessage: _alarmMessage!,
                  textEditingController: notificationTextController,
                ),
              ),
            ),
            Expanded(
              child: TextFieldContainer(
                margin: 16.0,
                child: TextFormField(
                  controller: notificationTextController,
                  onChanged: (value) {
                    setState(() {
                      _alarmMessage = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Alert message',
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.messenger,
                      color: FFAColor.mainRedColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
