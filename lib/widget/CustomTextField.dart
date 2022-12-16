import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.green.shade900),
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 217, 253, 219),
        contentPadding: const EdgeInsets.all(10),
        hoverColor: Colors.white,
        floatingLabelStyle:
            const TextStyle(color: Color.fromARGB(255, 3, 102, 41)),
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.green.shade900),
        hintStyle: TextStyle(color: Colors.green.shade900),
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
      ),
    );
  }
}
