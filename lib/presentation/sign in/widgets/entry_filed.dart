import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EntryField extends StatefulWidget {
  String resualtText = '';
  final String label;

  EntryField({super.key, required this.label});

  @override
  State<EntryField> createState() => _EntryFieldState();
}

class _EntryFieldState extends State<EntryField> {
  void _changeResualtText(text) {
    setState(() {
      widget.resualtText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.label,
        ),
        onChanged: _changeResualtText,
      ),
    );
  }
}
