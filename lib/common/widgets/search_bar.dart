import 'package:flutter/material.dart';
import 'package:job2main/utils/helpers/helper_functions.dart';

Widget buildSearchBar(String text, Function(String) onChanged, BuildContext context) {
  final darkMode = THelperFunctions.isDarkMode(context);
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search, color: Colors.black),
        hintText: text,
        filled: true, 
        fillColor: darkMode ?  Colors.black.withOpacity(0.2) : Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    ),
  );
}
