import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final IconData prefixIcon;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;

  TextEditingController controller = TextEditingController();

  CustomTextFormField({
    Key? key,
    required this.prefixIcon,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.validator,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: IconButton(
          icon: Icon(
            widget.prefixIcon,
          ),
          onPressed: widget.obscureText
              ? () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                }
              : null,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Colors.black, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Colors.black, width: 2.0),
        ),
      ),
    );
  }
}
