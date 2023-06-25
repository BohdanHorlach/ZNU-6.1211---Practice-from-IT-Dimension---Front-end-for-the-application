//Віджет для більш зрчного створення поллей вводу, які стилістично однакові

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListEntryField extends StatefulWidget {
  List<TextEditingController> listController = [];
  final List<String> listLabel;
  final List<TextInputType> listTypeInput;
  final List<bool> listIsObscureText;
  ListEntryField(
      {super.key,
      required this.listLabel,
      required this.listTypeInput,
      required this.listIsObscureText});
  final _ListEntryFieldState _state = _ListEntryFieldState();

  bool isComplete() {
    return _state.checkField();
  }

  @override
  String toStringShort() {
    return _state.toStringShort();
  }

  @override
  // ignore: no_logic_in_create_state
  State<ListEntryField> createState() => _state;
}

class _ListEntryFieldState extends State<ListEntryField> {
  List<String> listLabel = [];
  List<TextInputType> listTypeInput = [];
  List<bool> validateIsEmpty = [];
  List<bool> listObscureText = [];

  @override
  void initState() {
    super.initState();
    listLabel = widget.listLabel;
    listTypeInput = widget.listTypeInput;
    listObscureText = widget.listIsObscureText;
    for (int i = 0; i < listLabel.length; i++) {
      widget.listController.add(TextEditingController());
      validateIsEmpty.add(false);
    }
  }

  bool checkField() {
    bool isCompletedForm = true;
    setState(() {
      for (int i = 0; i < widget.listController.length; i++) {
        if (widget.listController[i].text == '') {
          isCompletedForm = false;
          validateIsEmpty[i] = true;
        }
      }
    });
    return isCompletedForm;
  }

  @override
  String toStringShort() {
    String result = '';
    for (int i = 0; i < widget.listController.length; i++) {
      result += '${widget.listController[i].text}|';
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.listController.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextField(
            controller: widget.listController[index],
            keyboardType: listTypeInput[index],
            obscureText: listObscureText[index],
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: listLabel[index],
              errorText: validateIsEmpty[index]
                  ? '${listLabel[index]} is Empty'
                  : null,
            ),
            onChanged: (value) {
              setState(() {
                validateIsEmpty[index] =
                    widget.listController[index].text == '';
              });
            },
          ),
        );
      },
    );
  }
}
