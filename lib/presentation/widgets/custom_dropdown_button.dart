//Стильозовано модифікований віджет DropdownButton

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropdownButton extends StatefulWidget {
  //Опис, варіанти відповідей та обраний індекс
  final String label;
  final List<String> listChoice;
  int selectedIndex = 0;

  //Метод для що буде викликатись під час змін стану
  VoidCallback updateState;

  CustomDropdownButton(
      {super.key,
      required this.label,
      required this.listChoice,
      required this.updateState});

  //Створення стану віджету, який буде відображенно
  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

//Клас-стан віджету
class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  //Значення обраного варіанту
  String dropdownValue = '';

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.listChoice[0];
  }

  void update() {
    widget.updateState();
  }

  //Створення віджету за допомогою методу build.
  @override
  Widget build(BuildContext context) {
    //InputDecoration для стилізації
    return InputDecorator(
      decoration: InputDecoration(
        //Опис віджету
        labelText: widget.label,
        //Рамка
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      //Список вибору
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.keyboard_arrow_down),
        iconSize: 25,
        elevation: 12,
        isExpanded: true,
        isDense: true,
        focusColor: Colors.white,
        underline: Container(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
            widget.selectedIndex = widget.listChoice.indexOf(dropdownValue);
            update();
          });
        },
        items: widget.listChoice.map<DropdownMenuItem<String>>((choice) {
          return DropdownMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList(),
      ),
    );
  }
}
