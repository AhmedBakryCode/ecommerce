import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsCheckbox extends StatefulWidget {
  @override
  _TermsCheckboxState createState() => _TermsCheckboxState();
}

class _TermsCheckboxState extends State<TermsCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(

      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            text: "I hereby agree to the ",
            style: TextStyle(color: Colors.black), // Regular text style
            children: [
              TextSpan(
                text: "terms of services",
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Handle terms of services action
                  },
              ),
              TextSpan(
                text: " and \n",
                style: TextStyle(color: Colors.black), // Regular text style
              ),
              TextSpan(
                text: "privacy policy",
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Handle privacy policy action
                  },
              ),
              TextSpan(
                text: ".",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
