import 'package:flutter/material.dart';

class CustomTextComponent extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;

  const CustomTextComponent({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'DM Sans', // Make sure DM Sans is added in pubspec.yaml
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
