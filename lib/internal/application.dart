import 'package:flutter/material.dart';
import '../presentation/sign_up/house_manager/sign_up_house_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Application',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const SignUpHouseManager(),
    );
  }
}
