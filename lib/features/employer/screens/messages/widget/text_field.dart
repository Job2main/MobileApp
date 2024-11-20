import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String hintText;
  bool obscureText;
  final FocusNode focusNode;
  final TextEditingController controller;

  MyTextfield(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.focusNode,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
        ),
      )
    );
  }
}