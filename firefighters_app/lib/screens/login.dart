import 'package:firebase_auth/firebase_auth.dart';
import 'package:firefighters_app/screens/navigation.dart';
import 'package:firefighters_app/screens/registration.dart';
import 'package:firefighters_app/screens/widgets/round_icon_button.dart';
import 'package:firefighters_app/screens/widgets/sign_in_up_field.dart';
import 'package:firefighters_app/screens/widgets/text_field_container.dart';
import 'package:firefighters_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  static const String id = 'login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0),
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
              Expanded(
                child: SvgPicture.asset(
                  'images/undraw_secure_login.svg',
                  height: size.height * 0.40,
                ),
              ),
              TextFieldContainer(
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Email',
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
                  onChanged: (value) {
                    password = value;
                  },
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    ' Sign in',
                    style: kRedText,
                  ),
                  RoundIconButton(
                    child: Icon(Icons.arrow_right_alt),
                    onPress: () async {
                      try {
                        final existingUser =
                            await _auth.signInWithEmailAndPassword(
                                email: email, password: password);
                        if (existingUser != null) {
                          Navigator.pushNamed(context, Navigation.id);
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                ],
              ),
              SignInUpField(
                onPress: () {
                  Navigator.pushNamed(context, Registration.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
