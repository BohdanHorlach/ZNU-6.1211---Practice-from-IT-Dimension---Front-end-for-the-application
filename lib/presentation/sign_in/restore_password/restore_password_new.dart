// Import Flutter package for material design widgets
import 'package:flutter/material.dart';
import 'restore_password_sent.dart';

// Import custom widgets for replacing the current page with a new page with a fade transition and text display
import '../../widgets/custom_push_replacement.dart';
import '../../widgets/custom_text_main.dart';

// Import login screen widget and restore password sent screen widget
import '../login.dart';

// Define RestorePasswordNew class as a StatefulWidget
class RestorePasswordNew extends StatefulWidget {
  // Declare a constructor with an optional key parameter
  const RestorePasswordNew({super.key});

  // Override createState method to create the mutable state for this widget
  @override
  State<RestorePasswordNew> createState() => _RestorePasswordNewState();
}

// Define a state class for the RestorePasswordNew widget
class _RestorePasswordNewState extends State<RestorePasswordNew> {
  // Declare fields for storing the text controllers and the validity flags for the password inputs
  final _passwordController1 = TextEditingController();
  final _passwordController2 = TextEditingController();
  bool _isPasswordInvalid1 = false;
  bool _isPasswordInvalid2 = false;

  // Declare fields for storing the visibility flags for the password inputs
  bool _isPasswordVisible1 = false;
  bool _isPasswordVisible2 = false;

  // Declare fields for storing the error texts for the password inputs
  String _errorText1 = "";
  String _errorText2 = "";

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
              // Set the child as a ListView widget with child widgets for displaying the app bar, text and password inputs
              child: ListView(children: [
                // Add an AppBar widget with a leading icon button that navigates to the restore password sent screen when pressed
                AppBar(
                  leading: IconButton(
                      onPressed: () {
                        customPushReplacement(
                            context, const RestorePasswordSent());
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
                      // Add a custom text widget with the main style and text 'Create a new password'
                      const CustomTextMain(text: 'Create a new password'),
                      // Add a Padding widget with padding on top and a TextFormField child for entering the new password
                      Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: TextFormField(
                            controller: _passwordController1,
                            obscureText: !_isPasswordVisible1,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: _isPasswordInvalid1
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              labelText: 'New password',
                              errorText:
                                  _isPasswordInvalid1 ? _errorText1 : null,
                              suffixIcon: IconButton(
                                icon: Icon(_isPasswordVisible1
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() => _isPasswordVisible1 =
                                      !_isPasswordVisible1);
                                },
                              ),
                            ),
                          )),
                      // Add a Padding widget with padding on top and a TextFormField child for confirming the new password
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: TextFormField(
                          controller: _passwordController2,
                          obscureText: !_isPasswordVisible2,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: _isPasswordInvalid2
                                    ? Colors.red
                                    : Colors.black,
                              ),
                            ),
                            labelText: 'Repeat new password',
                            errorText: _isPasswordInvalid2 ? _errorText2 : null,
                            suffixIcon: IconButton(
                              // Set the icon of the button based on the visibility flag
                              icon: Icon(_isPasswordVisible2
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              // Set the onPressed handler for the button
                              onPressed: () {
                                // Update the state with the toggled visibility flag
                                setState(() =>
                                    _isPasswordVisible2 = !_isPasswordVisible2);
                              },
                            ),
                          ),
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
                                  // Check if the first password input is empty and update state accordingly
                                  if (_passwordController1.text == '') {
                                    setState(() {
                                      _isPasswordInvalid1 = true;
                                      _errorText1 = 'Password cannot be empty';
                                    });
                                  }
                                  // Check if the second password input is empty and update state accordingly
                                  if (_passwordController2.text == '') {
                                    setState(() {
                                      _isPasswordInvalid2 = true;
                                      _errorText2 = 'Password cannot be empty';
                                    });
                                  }
                                  // Check if the first password input is empty and the second one is not and update state accordingly
                                  if (_passwordController1.text == '' &&
                                      _passwordController2.text != '') {
                                    setState(() {
                                      _isPasswordInvalid2 = true;
                                      _errorText2 =
                                          'Passwords must be the same';
                                    });
                                  }
                                  // Check if the second password input is empty and the first one is not and update state accordingly
                                  if (_passwordController2.text == '' &&
                                      _passwordController1.text != '') {
                                    setState(() {
                                      _isPasswordInvalid1 = true;
                                      _errorText1 =
                                          'Passwords must be the same';
                                    });
                                  }
                                  // Check if both password inputs are not empty but not equal and update state accordingly
                                  if (_passwordController1.text !=
                                          _passwordController2.text &&
                                      _passwordController1.text != '' &&
                                      _passwordController2.text != '') {
                                    setState(() {
                                      _isPasswordInvalid1 = true;
                                      _isPasswordInvalid2 = true;
                                      _errorText1 =
                                          'Passwords must be the same';
                                      _errorText2 =
                                          'Passwords must be the same';
                                    });
                                  } else if (_passwordController1.text != '' &&
                                      _passwordController2.text != '') {
                                    // If both password inputs are not empty and equal, update state and navigate to the login screen
                                    setState(() {
                                      _isPasswordInvalid1 = false;
                                      _isPasswordInvalid2 = false;
                                    });
                                    customPushReplacement(
                                        context, const Login());
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
