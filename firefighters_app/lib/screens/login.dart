import 'package:firebase_auth/firebase_auth.dart';
import 'package:firefighters_app/screens/navigation.dart';
import 'package:firefighters_app/screens/registration.dart';
import 'package:firefighters_app/screens/widgets/round_icon_button.dart';
import 'package:firefighters_app/screens/widgets/sign_in_up_field.dart';
import 'package:firefighters_app/screens/widgets/text_field_container.dart';
import 'package:firefighters_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Login extends StatefulWidget {
  static const String id = 'login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;

  String _email;
  String _password;
  bool _showSpinner = false;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: ModalProgressHUD(
        child: SafeArea(
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
                buildTextFieldContainer(
                  txtInputType: TextInputType.emailAddress,
                  hintTxt: 'Email',
                  iconData: Icons.person,
                  onKeyWord: (value) {
                    _email = value;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                buildTextFieldContainer(
                  txtInputType: TextInputType.visiblePassword,
                  obscureText: true,
                  hintTxt: 'Password',
                  iconData: Icons.vpn_key_rounded,
                  onKeyWord: (value) {
                    _password = value;
                  },
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
                      onPress: _onLoginPressed,
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
        inAsyncCall: _showSpinner,
      ),
    );
  }

  void _onLoginPressed() async {
    setState(() {
      _showSpinner = true;
    });
    try {
      final existingUser = await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      if (existingUser != null) {
        User _user = _auth.currentUser;
        if (!_user.emailVerified) {
          _showAlertDialog();
        } else {
          Navigator.pushReplacementNamed(context, Navigation.id);
        }
      }
      hideSpinner();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        snackBar('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        snackBar('Wrong password provided for that user.');
      } else if (e.code == 'invalid-email') {
        snackBar('Invalid email format');
      }
      hideSpinner();
    } catch (e) {
      hideSpinner();
      snackBar('Invalid email or password.');
      print(e);
    }
  }

  TextFieldContainer buildTextFieldContainer(
      {bool obscureText,
      String hintTxt,
      IconData iconData,
      TextInputType txtInputType,
      Function(String) onKeyWord}) {
    return TextFieldContainer(
      child: TextFormField(
        keyboardType: txtInputType,
        obscureText: obscureText != null ? obscureText : false,
        onChanged: onKeyWord,
        decoration: InputDecoration(
          hintText: hintTxt,
          border: InputBorder.none,
          icon: Icon(
            iconData,
            color: kMainRedColor,
          ),
        ),
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

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Cannot Sign in',
            style: kFatAppBarText,
          ),
          content: Text('Email has not been verified.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
