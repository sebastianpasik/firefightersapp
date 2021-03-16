import 'package:firefighters_app/screens/location.dart';
import 'package:firefighters_app/screens/widgets/custom_app_bar.dart';
import 'file:///C:/Users/spasik/dev/firefightersapp/firefighters_app/lib/screens/settings.dart';
import 'package:firefighters_app/utilities/constants.dart';
import 'package:flutter/material.dart';

import 'home/home.dart';

class Navigation extends StatefulWidget {
  static const String id = 'navigation';
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;
  final List<Widget> _fragments = [
    Home(),
    Location(),
    Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        titleText: appBarTitles[_currentIndex],
      ),
      backgroundColor: kLightGreyBackgroundColor,
      body: _fragments[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kMainRedColor,
        onTap: onItemTapped,
        currentIndex: _currentIndex,
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

  void onItemTapped(int bnbItemIndex) {
    setState(() {
      _currentIndex = bnbItemIndex;
    });
  }
}
