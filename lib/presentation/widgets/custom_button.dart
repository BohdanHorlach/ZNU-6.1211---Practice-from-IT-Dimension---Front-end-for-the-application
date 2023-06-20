import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String textButton;
  final VoidCallback onClick;

  const CustomButton(
      {super.key, required this.textButton, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, foregroundColor: Colors.white),
      onPressed: onClick,
      child: Text(textButton),
    );
  }
}
