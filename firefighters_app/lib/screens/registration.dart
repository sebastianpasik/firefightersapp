import 'package:firefighters_app/screens/home.dart';
import 'package:firefighters_app/screens/widgets/round_icon_button.dart';
import 'package:firefighters_app/screens/widgets/sign_in_up_field.dart';
import 'package:firefighters_app/screens/widgets/text_field_container.dart';
import 'package:firefighters_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Registration extends StatelessWidget {
  static const String id = 'registration';
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Create Account',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 36.0,
                  color: Color(0xFFC62828),
                ),
              ),
              Expanded(
                child: SvgPicture.asset(
                  'images/undraw_secure_login.svg',
                ),
              ),
              TextFieldContainer(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Username',
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.person,
                      color: kMainRedColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFieldContainer(
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.vpn_key_rounded,
                      color: kMainRedColor,
                    ),
                    suffixIcon: Icon(Icons.visibility),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFieldContainer(
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Repeat Password',
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.vpn_key_rounded,
                      color: kMainRedColor,
                    ),
                    suffixIcon: Icon(Icons.visibility),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    ' Sign up',
                    style: kRedText,
                  ),
                  RoundIconButton(
                    child: Icon(Icons.arrow_right_alt),
                    onPress: () {
                      Navigator.pushNamed(context, Home.id);
                    },
                  ),
                ],
              ),
              SignInUpField(
                login: false,
                onPress: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
