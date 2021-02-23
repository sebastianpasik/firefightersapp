import 'package:firefighters_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Welcome Back',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 36.0,
                    color: Color(0xFFC62828),
                  ),
                ),
                SvgPicture.asset('images/undraw_secure_login.svg'),
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
                  height: 5.0,
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
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Sign in',
                      style: kRedText,
                    ),
                    RoundIconButton(
                      iconData: Icons.arrow_right_alt,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  TextFieldContainer({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.0,
        decoration: BoxDecoration(
          color: kInputTextBackgroundColor,
          border: Border(
            bottom: BorderSide(color: kMainRedColor),
          ),
        ),
        child: child);
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.iconData, this.onTap});

  final IconData iconData;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      onPressed: onTap,
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: kMainRedColor,
      constraints: BoxConstraints.tightFor(
        width: 57.0,
        height: 57.0,
      ),
    );
  }
}
