import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final VoidCallback onTap;
  final TextEditingController controller;

  const PasswordField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.obscureText,
    required this.onTap,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.green.shade900),
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 217, 253, 219),
        labelStyle: TextStyle(color: Colors.green.shade900),
        hintStyle: TextStyle(color: Colors.green.shade900),
        hoverColor: Colors.white,
        labelText: labelText,
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 255, 255, 255), width: 2.0),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 12.0,
              right: 15.0,
              bottom: 10.0,
            ),
            child: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
          ),
        ),
      ),
    );
  }
}
