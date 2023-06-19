// import 'package:flutter/material.dart';
// import 'iternal/application.dart';
//
// void main() {
//   runApp(const MyApp());
// }

import 'package:flutter/material.dart';

import 'app_screens/building_management_screen.dart';
import 'main_screen/screens.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(
        //     seedColor: const Color.fromRGBO(216, 226, 255, 1)),
        useMaterial3: true,
        //appBarTheme: const AppBarTheme(centerTitle: true),
        //outlinedButtonTheme: const OutlinedButtonThemeData(style: ButtonStyle(backgroundColor: ),),
      ),
      home: const MainScreenManager(),
      debugShowCheckedModeBanner: false,
    );
  }
}
