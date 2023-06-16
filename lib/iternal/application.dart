import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/sign in/sign up/house manager/first_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ApplicationName',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: SignUpHouseManager(),
    );
  }
}
