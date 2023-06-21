// Import Flutter package for material design widgets
import 'package:flutter/material.dart';

// Define a custom text widget class as a StatelessWidget
class CustomTextMain extends StatelessWidget {
  // Declare a final String field for storing the text
  final String text;

  // Declare a constructor with a required text parameter and an optional key parameter
  const CustomTextMain({super.key, required this.text});

  // Override the build method to construct the widget
  @override
  Widget build(BuildContext context) {
    // Return a Text widget with the text and a custom style
    return Text(
      text,
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
    );
  }
}
