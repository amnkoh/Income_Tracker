import 'package:flutter_course/common_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class SocialSignInButton extends CustomElevatedButton {
  SocialSignInButton({
    @required String assetName,
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  }) : assert(assetName != null),
       assert(text != null),
        super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(assetName),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 15.0,
                ),
              ),
              Opacity(
                opacity: 0.0,
                child: Image.asset(assetName),
              ),
            ],
          ),
          color: color,
          borderRadius: 14.0,
          height: 45.0,
          onPressed: onPressed,
        );
}
