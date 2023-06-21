// Import Flutter package for material design widgets
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/sign_up/login/registration/choose_status.dart';
import 'package:flutter_application_1/presentation/sign_up/login/restore_password/restore_password_send.dart';

// Import custom widgets for email input, page navigation and text display
import '../../widgets/custom_email.dart';
import '../../widgets/custom_push.dart';
import '../../widgets/custom_text_main.dart';

// Import widgets for registration and restore password screens


// Define Login class as a StatefulWidget
class Login extends StatefulWidget {
  // Declare a constructor with an optional key parameter
  const Login({super.key});

  // Override createState method to create the mutable state for this widget
  @override
  State<Login> createState() => _LoginState();
}

// Define _LoginState class as the mutable state for the Login widget
class _LoginState extends State<Login> {
  // Define controllers for email and password text fields
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Define boolean variables to track invalid email and password inputs
  bool _isEmailInvalid = false;
  bool _isPasswordInvalid = false;

  // Define boolean variable to track visibility of password
  bool _isPasswordVisible = false;

  // Override build method to construct the widget tree
  @override
  Widget build(BuildContext context) {
    // Return a SafeArea widget with a Scaffold child
    // Returns a widget that provides safe insets for the visible part of the interface
    return SafeArea(
        // Sets safe insets on top and bottom
        top: true,
        bottom: true,
        // Returns a widget that provides basic functionality for the application
        child: Scaffold(
          // Sets the widget for the main content of the screen
          body: Center(
            // Returns a widget that centers its child within itself
            child: ConstrainedBox(
              // Sets constraints for the maximum width of the child
              constraints: const BoxConstraints(maxWidth: 400),
              // Returns a widget that allows scrolling a list of child widgets
              child: ListView(children: [
                // Returns a widget that adds padding around its child
                Padding(
                  // Sets the sizes of the padding
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 80, bottom: 25),
                  // Returns a widget that contains a column of child widgets with alignment to the left edge
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Returns a custom text widget with the main style
                      const CustomTextMain(text: 'Welcome!'),
                      // Returns a widget with padding on top
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        // Returns a custom widget for entering email with controller and validity check
                        child: CustomEmail(
                          emailController: _emailController,
                          isEmailInvalid: _isEmailInvalid,
                        ),
                      ),
                      // Returns a widget with padding on top
                      Padding(
                          padding: const EdgeInsets.only(top: 20),
                          // Returns a widget for entering password with controller and ability to hide/show password
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: _isEmailInvalid
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              labelText: 'Password',
                              errorText: _isPasswordInvalid
                                  ? 'Password cannot be empty'
                                  : null,
                              suffixIcon: IconButton(
                                icon: Icon(_isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() =>
                                      _isPasswordVisible = !_isPasswordVisible);
                                },
                              ),
                            ),
                          )),
                      // Returns a widget with padding on top
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        // Returns a widget that contains a row of child widgets
                        child: Row(
                          children: [
                            // Returns a widget that expands its child to fill the available width
                            Expanded(
                              // Returns a button widget with an onPressed handler and a style
                              child: ElevatedButton(
                                onPressed: () {
                                  customPush(context, const ChooseStatus());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.blue[800],
                                ),
                                child: const Text('Register'),
                              ),
                            ),
                            // Add a SizedBox for spacing
                            const SizedBox(
                              width: 15,
                            ),
                            // Add an Expanded widget with an ElevatedButton child
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  // Define a regular expression to validate email input
                                  final emailRegExp =
                                      RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$');
                                  // Check if email input is valid and update state accordingly
                                  if (!emailRegExp
                                      .hasMatch(_emailController.text)) {
                                    setState(() => _isEmailInvalid = true);
                                  } else {
                                    setState(() => _isEmailInvalid = false);
                                  }
                                  // Check if password input is empty and update state accordingly
                                  if (_passwordController.text.isEmpty) {
                                    setState(() => _isPasswordInvalid = true);
                                  } else {
                                    setState(() => _isPasswordInvalid = false);
                                  }
                                },
                                // Set the style for the button
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  side: BorderSide.none,
                                ),
                                // Set the text for the button
                                child: const Text('Login'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 30),
                        // Add a Divider widget for visual separation
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                      // Add a Center widget with a Column child
                      Center(
                        child: Column(children: [
                          // Add a Text widget for displaying a message
                          const Text('Forgot the password?'),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            // Add a GestureDetector widget for handling user interaction
                            child: GestureDetector(
                              onTap: () {
                                // Navigate to the restore password screen
                                customPush(
                                    context, const RestorePasswordSend());
                              },
                              // Add a Text widget for displaying a link
                              child: Text(
                                'Restore',
                                style: TextStyle(
                                    color: Colors.blue[800],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ]),
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
