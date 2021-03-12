import 'package:firefighters_app/screens/home.dart';
import 'package:firefighters_app/screens/login.dart';
import 'package:firefighters_app/screens/navigation.dart';
import 'package:firefighters_app/screens/widgets/round_icon_button.dart';
import 'package:firefighters_app/screens/widgets/sign_in_up_field.dart';
import 'package:firefighters_app/screens/widgets/text_field_container.dart';
import 'package:firefighters_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class Registration extends StatefulWidget {
  static const String id = 'registration';

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _auth = FirebaseAuth.instance;
  String _email;
  String _password;
  String _passwordRepeated;
  bool _showSpinner = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ModalProgressHUD(
        child: SafeArea(
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
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      _email = value;
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
                      _password = value;
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
                TextFieldContainer(
                  child: TextFormField(
                    obscureText: true,
                    onChanged: (value) {
                      _passwordRepeated = value;
                    },
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
                      onPress: () async {
                        if (_password == _passwordRepeated) {
                          setState(() {
                            _showSpinner = true;
                          });
                          try {
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: _email, password: _password);
                            if (newUser != null) {
                              User user = _auth.currentUser;
                              if (!user.emailVerified) {
                                await user.sendEmailVerification();
                                _showMyDialog();
                              }
                            }
                            hideSpinner();
                          } on FirebaseAuthException catch (e) {
                            hideSpinner();

                            if (e.code == 'weak-password') {
                              hideSpinner();
                              snackBar('The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              snackBar(
                                  'The account already exists for that email.');
                            }
                          } catch (e) {
                            hideSpinner();
                            snackBar('Invalid email or password.');

                            print(e);
                          }
                          hideSpinner();
                        } else {
                          snackBar('Password in both fields does not match.');
                        }
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
        inAsyncCall: _showSpinner,
      ),
    );
  }

  void hideSpinner() {
    setState(() {
      _showSpinner = false;
    });
  }

  void snackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Verify email',
            style: kFatAppBarText,
          ),
          content: Text(
              'Email has been sent to your inbox, please check and verify.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName(Login.id),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
