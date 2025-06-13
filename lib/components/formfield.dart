import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool? obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FormFieldValidator? validator;
  final Function(String?)? onSaved;
  const MyTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextFormField(
        controller: controller,
        onSaved: onSaved,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          prefixIconColor: Colors.grey.shade700,
          suffixIcon: suffixIcon,
          suffixIconColor: Colors.grey.shade700,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[700], fontSize: 16),
          fillColor: Colors.grey[100],
          filled: true,
          // enabledBorder: OutlineInputBorder(
          // borderSide: BorderSide(color: Colors.grey.shade700, width: 0.3),
          // ),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade500, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red.shade500,
              width: 1.0,
            ), // Reduced thickness
          ),

          // Border when focused AND there's an error
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red.shade500,
              width: 1.5,
            ), // Reduced thickness
          ),
        ),
      ),
    );
  }
}
