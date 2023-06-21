// Import Flutter package for material design widgets
import 'package:flutter/material.dart';

// Define a custom email widget class as a StatelessWidget
class CustomEmail extends StatelessWidget {
  // Declare final fields for storing the email controller and the validity flag
  final TextEditingController emailController;
  final bool isEmailInvalid;

  // Declare a constructor with required parameters for the email controller and the validity flag and an optional key parameter
  const CustomEmail(
      {super.key, required this.emailController, required this.isEmailInvalid});

  // Override the build method to construct the widget
  @override
  Widget build(BuildContext context) {
    // Return a TextFormField widget with the email controller and a custom decoration
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        // Set the border as an OutlineInputBorder with a custom border side color based on the validity flag
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: isEmailInvalid ? Colors.red : Colors.black,
          ),
        ),
        // Set the label text as 'Email'
        labelText: 'Email',
        // Set the error text based on the validity flag
        errorText: isEmailInvalid ? 'Wrong e-mail' : null,
        // Set the suffix icon based on the validity flag
        suffixIcon:
            isEmailInvalid ? const Icon(Icons.error, color: Colors.red) : null,
      ),
    );
  }
}
