import 'package:firefighters_app/screens/widgets/round_icon_button.dart';
import 'package:firefighters_app/screens/widgets/text_field_container.dart';
import 'package:firefighters_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kLightGreyBackgroundColor,
        title: Text(
          'Emergency',
          style: TextStyle(
            color: kMainRedColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
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
      ),
      backgroundColor: kLightGreyBackgroundColor,
      body: Center(
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kMainRedColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alert),
            label: 'Emergency',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
