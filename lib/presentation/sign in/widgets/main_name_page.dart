import 'package:flutter/material.dart';

class MainNamePage extends StatelessWidget {
  final String text;

  const MainNamePage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 50, left: 10, bottom: 10),
        child: Text(text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)));
  }
}
