import 'package:flutter/material.dart';

class SignInUpField extends StatelessWidget {
  SignInUpField({this.onPress, this.login = true});

  final bool login;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? 'Don\'t have an account?  ' : 'Already have an account?  ',
          style: TextStyle(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        GestureDetector(
          onTap: onPress,
          child: Text(
            login ? 'SIGN UP' : 'SIGN IN',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
