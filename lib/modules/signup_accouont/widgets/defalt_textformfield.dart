import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  final String hintText; // Added hintText parameter
  final bool isPassword;
  final String? Function(String?)? validator;
  final Color backgroundColor; // Added background color parameter

  const CustomTextFormField({
    required this.controller,
    required this.text,
    required this.hintText, // Initialize hintText
    required this.isPassword,
    required this.validator,
    required this.backgroundColor, // Initialize background color
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword && !_isPasswordVisible,
          decoration: InputDecoration(
            filled: true, // Enables the fill color
            fillColor: widget.backgroundColor, // Uses the passed background color
            hintText: widget.hintText, // Uses the passed hint text
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(
                _isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            )
                : (widget.validator != null
                ? (widget.validator!(widget.controller.text) == null
                ? Icon(Icons.check, color: Colors.grey)
                : Icon(Icons.close, color: Colors.grey))
                : Icon(Icons.check, color: Colors.grey)),
          ),
          validator: widget.validator,
        ),
      ],
    );
  }
}
