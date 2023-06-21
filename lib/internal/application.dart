// Import Flutter packages and loading screen
import 'package:flutter/material.dart';
import '../presentation/sign_up/loading/loading.dart';

// Define MyApp class as a StatelessWidget
class MyApp extends StatelessWidget {
  // Declare a constructor with an optional key parameter
  const MyApp({super.key});

  // Override the build method to construct the widget
  @override
  Widget build(BuildContext context) {
    // Return a MaterialApp with theme settings and loading screen
    return MaterialApp(
      // Set the title of the application
      title: 'Project',
      // Disable the debug banner on the top right corner
      debugShowCheckedModeBanner: false,
      // Set the theme data for the application
      theme: ThemeData(
        // Set the color scheme based on a seed color
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        // Set the elevated button theme data
        elevatedButtonTheme: ElevatedButtonThemeData(
          // Set the style for the elevated buttons
          style: ElevatedButton.styleFrom(
            // Set the shape of the buttons as rounded rectangles
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            // Set the background color of the buttons as dark blue
            backgroundColor: Colors.blue[800],
            foregroundColor: Colors.white,
            side: const BorderSide(color: Colors.black),
          ),
        ),
        // Enable Material 3 design system
        useMaterial3: true,
      ),
      // Set the home widget as loading screen
      home: const Loading(),
    );
  }
}
