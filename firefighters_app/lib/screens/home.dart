import 'package:firefighters_app/screens/widgets/custom_app_bar.dart';
import 'package:firefighters_app/screens/widgets/round_icon_button.dart';
import 'package:firefighters_app/screens/widgets/text_field_container.dart';
import 'package:firefighters_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
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
                child: Text(
                  'Alarm',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0),
                ),
              ),
            ),
            Expanded(
              child: TextFieldContainer(
                margin: 16.0,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Alert message',
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.messenger,
                      color: kMainRedColor,
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
