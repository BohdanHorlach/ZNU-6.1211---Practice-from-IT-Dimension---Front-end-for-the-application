// Import Dart package for asynchronous programming
import 'dart:async';

// Import Flutter package for material design widgets
import 'package:flutter/material.dart';

// Import custom widget for replacing the current page with a new page with a fade transition
import '../widgets/custom_push_replacement.dart';

// Import login screen widget
import '../sign_in/login/login.dart';

// Define a loading screen widget class as a StatefulWidget
class Loading extends StatefulWidget {
  // Declare a constructor with an optional key parameter
  const Loading({super.key});

  // Override the createState method to return an instance of _LoadingState
  @override
  State<Loading> createState() => _LoadingState();
}

// Define a state class for the loading screen widget
class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  // Declare a late field for storing the animation controller
  late AnimationController _controller;

  // Override the initState method to initialize the animation controller and set a timer
  @override
  void initState() {
    super.initState();
    // Initialize the animation controller with vsync, duration, value, lower bound and upper bound parameters
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
      value: 0.5,
      lowerBound: 0,
      upperBound: 1,
    );
    // Start the animation controller in repeat mode
    _controller.repeat();
    // Set a timer to stop the animation controller and navigate to the login screen after 2.5 seconds
    Timer(const Duration(milliseconds: 2500), () {
      _controller.stop();
      customPushReplacement(context, const Login());
    });
  }

  // Override the build method to construct the widget
  @override
  Widget build(BuildContext context) {
    // Return a Scaffold widget with a centered body
    return Scaffold(
      body: Center(
        // Add a Column widget with child widgets for displaying the logo and loading text
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add a RotationTransition widget with an animation based on the controller and an image child
            RotationTransition(
              turns: Tween(begin: 0.0, end: 2.5).animate(_controller),
              child: Image.asset(
                'assets/images/logo.png',
                width: 100,
                height: 100,
              ),
            ),
            // Add a SizedBox widget for spacing
            const SizedBox(
              height: 5,
            ),
            // Add an Image widget for displaying the logo shadow
            Image.asset(
              'assets/images/logo_shadow.png',
              width: 50,
              height: 20,
            ),
            // Add a SizedBox widget for spacing
            const SizedBox(
              height: 10,
            ),
            // Add a Text widget for displaying the loading message with a custom style
            const Text('Loading...',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }
}
