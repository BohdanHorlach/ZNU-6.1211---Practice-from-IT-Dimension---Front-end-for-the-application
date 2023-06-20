import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropdownButton extends StatefulWidget {
  final String label;
  final List<String> listChoice;
  int selectedIndex = 0;
  VoidCallback updateState;

  CustomDropdownButton(
      {super.key,
      required this.label,
      required this.listChoice,
      required this.updateState});

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String dropdownValue = '';

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.listChoice[0];
  }

  void update() {
    widget.updateState();
  }

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: widget.label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
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
