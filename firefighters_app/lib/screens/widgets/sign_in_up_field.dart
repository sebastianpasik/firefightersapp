import 'package:flutter/material.dart';

class SignInUpField extends StatelessWidget {
  SignInUpField({this.onPress});
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Don\'t have an account?  ',
          style: TextStyle(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        GestureDetector(
          onTap: onPress,
          child: Text(
            'SIGN UP',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}