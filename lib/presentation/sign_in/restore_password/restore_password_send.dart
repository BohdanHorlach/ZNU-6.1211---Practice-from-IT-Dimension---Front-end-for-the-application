// Import Flutter package for material design widgets
import 'package:flutter/material.dart';
import 'restore_password_sent.dart';

// Import custom widgets for navigating to a new page with a fade transition and text display
import '../../widgets/custom_push.dart';
import '../../widgets/custom_push_replacement.dart';
import '../../widgets/custom_text_main.dart';

// Import login screen widget and restore password sent screen widget
import '../login.dart';

// Import custom widget for email input
import '../../widgets/custom_email.dart';

// Define RestorePasswordSend class as a StatefulWidget
class RestorePasswordSend extends StatefulWidget {
  // Declare a constructor with an optional key parameter
  const RestorePasswordSend({super.key});

  // Override createState method to create the mutable state for this widget
  @override
  State<RestorePasswordSend> createState() => _RestorePasswordSendState();
}

// Define a state class for the RestorePasswordSend widget
class _RestorePasswordSendState extends State<RestorePasswordSend> {
  // Declare a final field for storing the email controller
  final _emailController = TextEditingController();

  // Declare a field for storing the validity flag for the email input
  bool _isEmailInvalid = false;

  // Override build method to construct the widget
  @override
  Widget build(BuildContext context) {
    // Return a SafeArea widget that provides safe insets for the visible part of the interface
    return SafeArea(
        top: true,
        bottom: true,
        child: Scaffold(
          // Set the body as a Center widget with a ConstrainedBox child
          body: Center(
            child: ConstrainedBox(
              // Set the maximum width constraint for the child
              constraints: const BoxConstraints(maxWidth: 400),
              // Set the child as a ListView widget with child widgets for displaying the app bar, text and email input
              child: ListView(children: [
                // Add an AppBar widget with a leading icon button that navigates to the login screen when pressed
                AppBar(
                  leading: IconButton(
                      onPressed: () {
                        customPushReplacement(context, const Login());
                      },
                      icon: const Icon(Icons.arrow_back)),
                ),
                // Add a Padding widget that adds padding around its child widget
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 80, bottom: 25),
                  // Add a Column widget that contains child widgets with alignment to the left edge
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Add a custom text widget with the main style and text 'Restore Password'
                      const CustomTextMain(text: 'Restore Password'),
                      // Add a Padding widget with padding on top and a custom email widget child for entering the email address
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: CustomEmail(
                          emailController: _emailController,
                          isEmailInvalid: _isEmailInvalid,
                        ),
                      ),
                      // Add a Padding widget with padding on top and a Row child
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          children: [
                            // Add an Expanded widget with an ElevatedButton child
                            Expanded(
                              child: ElevatedButton(
                                // Set the onPressed handler for the button
                                onPressed: () {
                                  // Define a regular expression for validating email addresses
                                  final emailRegExp =
                                      RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$');
                                  // Check if the email input matches the regular expression and update state accordingly
                                  if (!emailRegExp
                                      .hasMatch(_emailController.text)) {
                                    setState(() => _isEmailInvalid = true);
                                  } else {
                                    setState(() => _isEmailInvalid = false);
                                  }
                                  // If the email input is valid, navigate to the restore password sent screen
                                  if (!_isEmailInvalid) {
                                    customPush(
                                        context, const RestorePasswordSent());
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  // Set the shape of the button as a rounded rectangle
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  // Set the border of the button as none
                                  side: BorderSide.none,
                                ),
                                // Set the child of the button as a Text widget with text 'Submit'
                                child: const Text('Submit'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ));
  }
}
