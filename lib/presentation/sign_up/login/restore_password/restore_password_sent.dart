// Import Dart package for asynchronous programming
import 'dart:async';

// Import Flutter package for material design widgets
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/sign_up/login/restore_password/restore_password_new.dart';
import 'package:flutter_application_1/presentation/sign_up/login/restore_password/restore_password_send.dart';

// Import widgets for restore password new and send screens


// Import custom widgets for navigating to a new page with a fade transition and text display
import '../../../widgets/custom_push.dart';
import '../../../widgets/custom_push_replacement.dart';
import '../../../widgets/custom_text_main.dart';

// Define RestorePasswordSent class as a StatefulWidget
class RestorePasswordSent extends StatefulWidget {
  // Declare a constructor with an optional key parameter
  const RestorePasswordSent({super.key});

  // Override createState method to create the mutable state for this widget
  @override
  State<RestorePasswordSent> createState() => _RestorePasswordSentState();
}

// Define a state class for the RestorePasswordSent widget
class _RestorePasswordSentState extends State<RestorePasswordSent> {
  // Declare a late field for storing the sent flag
  late bool _isSent = false;

  // Declare a field for storing the text to display
  String _text = 'The letter was sent to your email!';

  // Override initState method to initialize the sent flag and set a timer
  @override
  void initState() {
    super.initState();
    // Set a timer to update the state with the sent flag after 450 milliseconds
    Future.delayed(const Duration(milliseconds: 450), () {
      setState(() {
        _isSent = true;
      });
    });
  }

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
              // Set the child as a ListView widget with child widgets for displaying the app bar, text and image
              child: ListView(
                children: [
                  // Add an AppBar widget with a leading icon button that navigates to the restore password send screen when pressed
                  AppBar(
                    leading: IconButton(
                        onPressed: () {
                          customPushReplacement(
                              context, const RestorePasswordSend());
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
                          // Add a custom text widget with the main style and text from the field
                          CustomTextMain(text: _text),
                          // Add a Padding widget with padding on top and a Container child for displaying the image
                          Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                    // Set the background color as light blue with some transparency
                                    color: Colors.lightBlue[50]?.withAlpha(100),
                                    // Set the border radius as circular with 16 pixels radius
                                    borderRadius: BorderRadius.circular(16),
                                    // Set the border as black with 0.5 pixels width
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    // Add an AnimatedSwitcher widget for displaying different images based on the sent flag with animation duration and key parameters
                                    child: AnimatedSwitcher(
                                      duration:
                                          const Duration(milliseconds: 400),
                                      child: _isSent
                                          ? GestureDetector(
                                              // Set the onTap handler for the image as navigating to the restore password new screen
                                              onTap: () {
                                                customPush(context,
                                                    const RestorePasswordNew());
                                              },
                                              // Set the child of the gesture detector as an Image widget with an asset image and a key parameter
                                              child: Image.asset(
                                                'assets/images/box_sent.png',
                                                key: const ValueKey('sent'),
                                              ),
                                            )
                                          : Image.asset(
                                              'assets/images/box_to_send.png',
                                              key: const ValueKey('to_send'),
                                            ),
                                    ),
                                  ))),
                          // Add a Padding widget with padding on top and a Divider child for displaying a horizontal line
                          const Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                          ),
                          // Add a Center widget with a Column child for displaying text and gesture detector widgets
                          Center(
                            child: Column(children: [
                              // Add a Text widget with text 'Didn't get the message?'
                              const Text('Didn\'t get the message?'),
                              // Add a Padding widget with padding on top and a GestureDetector child for handling taps
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: GestureDetector(
                                  // Set the onTap handler for the gesture detector as updating the state with a new text
                                  onTap: () {
                                    setState(() {
                                      _text =
                                          'The letter was resent to your email!';
                                    });
                                  },
                                  // Set the child of the gesture detector as a Text widget with text 'Resend' and a custom style
                                  child: Text(
                                    'Resend',
                                    style: TextStyle(
                                        color: Colors.blue[800],
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ]),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
