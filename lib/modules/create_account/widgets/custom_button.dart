import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final Color buttonColor;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.child,
    required this.buttonColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the width of the screen
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * 0.8,  // 80% of the screen width
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
        ),
        onPressed: onPressed,
        child: child,  // Can be text or row of elements
      ),
    );
  }
}
