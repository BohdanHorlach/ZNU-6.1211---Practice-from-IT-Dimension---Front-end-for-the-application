//Віджет що відображатиме допис для випадку якщо було обрано статус "Перший житель"

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FirstResident extends StatefulWidget {
  String result = 'Check whether the manager is the first tenant';
  FirstResident({super.key});

  @override
  String toStringShort() {
    return "FirstResident: $result";
  }

  @override
  State<FirstResident> createState() => _FirstResidentState();
}

class _FirstResidentState extends State<FirstResident> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Text(
          'The system will check if you are the only tenant of the house.',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ),
    );
  }
}
