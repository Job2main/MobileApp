import 'package:flutter/material.dart';

Widget getFormField(TextEditingController controller, String labelText, IconData icon, {bool expands = false, IconData? suffixIcon}) {
  return TextFormField(
      controller: controller,
      expands: expands,
      decoration: InputDecoration(labelText: labelText, prefixIcon: Icon(icon), suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null));
}