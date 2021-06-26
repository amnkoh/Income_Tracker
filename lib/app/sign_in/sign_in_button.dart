import 'package:flutter_course/common_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class SignInButton extends CustomElevatedButton {
  SignInButton({
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  }) : assert(text != null),
        super(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 15.0,
            ),
          ),
          color: color,
          borderRadius: 14.0,
          height: 45.0,
          onPressed: onPressed,
        );
}
