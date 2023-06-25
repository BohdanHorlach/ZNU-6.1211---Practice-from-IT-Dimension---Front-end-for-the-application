//Віджет що відображатиме допис для випадку якщо було обрано статус "Перший житель"

import 'package:flutter/material.dart';

//StatefulWidget для динамічного відображення змін на екрані
// ignore: must_be_immutable
class FirstResident extends StatefulWidget {
  //Поле результату, який буде повертатись при виклику toStringShort
  String result = 'Check whether the manager is the first tenant';
  FirstResident({super.key});

  @override
  String toStringShort() {
    return "FirstResident: $result";
  }

  //Створення стану віджету, який буде відображенно
  @override
  State<FirstResident> createState() => _FirstResidentState();
}

//Клас-стан віджету
class _FirstResidentState extends State<FirstResident> {
  //Створення віджету за допомогою методу build.
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      //Розміщення обєктів по центру
      child: Center(
        //Декоративний текст
        child: Text(
          'The system will check if you are the only tenant of the house.',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ),
    );
  }
}
