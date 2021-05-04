import 'package:firefighters_app/screens/login.dart';
import 'package:firefighters_app/screens/widgets/round_icon_button.dart';
import 'package:firefighters_app/screens/widgets/sign_in_up_field.dart';
import 'package:firefighters_app/screens/widgets/text_field_container.dart';
import 'package:firefighters_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Registration extends StatefulWidget {
  static const String id = 'registration';

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _auth = FirebaseAuth.instance;
  String? _email;
  String? _password;
  String? _passwordRepeated;
  bool _showSpinner = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
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
                buildTextFieldContainer(
                  obscureText: true,
                  hintTxt: 'Repeat Password',
                  iconData: Icons.vpn_key_rounded,
                  onKeyWord: (value) {
                    _passwordRepeated = value;
                  },
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
                      onPress: _handleRegisterPressed,
                      child: Icon(Icons.arrow_right_alt),
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
      ),
    );
  }

  void _handleRegisterPressed() async {
    if (_password == _passwordRepeated) {
      showSpinner();
      try {
        await _auth.createUserWithEmailAndPassword(
            email: _email!, password: _password!);
        var user = _auth.currentUser;
        if (!user!.emailVerified) {
          await user.sendEmailVerification();
          await _showMyDialog();
        }
        _hideSpinner();
      } on FirebaseAuthException catch (e) {
        _hideSpinner();

        if (e.code == 'weak-password') {
          _hideSpinner();
          snackBar('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          snackBar('The account already exists for that email.');
        }
      } catch (e) {
        _hideSpinner();
        snackBar('Invalid email or password.');

        print(e);
      }
      _hideSpinner();
    } else {
      snackBar('Password in both fields does not match.');
    }
  }

  TextFieldContainer buildTextFieldContainer(
      {bool? obscureText,
      String? hintTxt,
      IconData? iconData,
      TextInputType? txtInputType,
      Function(String)? onKeyWord}) {
    return TextFieldContainer(
      child: TextFormField(
        keyboardType: txtInputType,
        obscureText: obscureText ?? false,
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

  void _hideSpinner() {
    setState(() {
      _showSpinner = false;
    });
  }

  void showSpinner() {
    setState(() {
      _showSpinner = true;
    });
  }

  void snackBar(String message) {
    _scaffoldKey.currentState!.showSnackBar(
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
              onPressed: () {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName(Login.id),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
