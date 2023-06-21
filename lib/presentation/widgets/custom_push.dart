// Import Flutter package for material design widgets
import 'package:flutter/material.dart';

// Define a custom function for navigating to a new page with a fade transition
Future customPush(BuildContext context, Widget page) {
  // Return the result of pushing a new route to the navigator
  return Navigator.push(
    // Pass the build context as an argument
      context,
      // Create a PageRouteBuilder with custom settings
      PageRouteBuilder(
        // Set the page builder to return the page widget
        pageBuilder: (context, animation, secondaryAnimation) => page,
        // Set the transitions builder to return a FadeTransition widget
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            // Set the opacity of the transition based on the animation
            opacity: animation,
            // Set the child of the transition as the page widget
            child: child,
          );
        },
      ));
}
