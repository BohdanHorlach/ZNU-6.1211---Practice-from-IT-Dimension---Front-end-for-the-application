import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EntryField extends StatefulWidget {
  final String label;
  final controller = TextEditingController();
  bool isEmpty = false;
  EntryField({super.key, required this.label});

  @override
  State<EntryField> createState() => _EntryFieldState();
}

class _EntryFieldState extends State<EntryField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: widget.label,
        errorText: widget.isEmpty ? '${widget.label} is Empty' : null,
      ),
      controller: widget.controller,
      onChanged: (value) {
        setState(() {
          widget.isEmpty = widget.controller.text == '';
        });
      },
    );
  }
}
