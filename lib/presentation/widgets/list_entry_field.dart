//Віджет для більш зрчного створення поллей вводу, які стилістично однакові

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListEntryField extends StatefulWidget {
  //Список контролерів для зберігання тексту
  List<TextEditingController> listController = [];

  //Список описів полів вводу
  final List<String> listLabel;

  //Список типів введення даних
  final List<TextInputType> listTypeInput;

  //Список для зазанечення чи будуть тест прихованим
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

//Клас-стан віджету
class _ListEntryFieldState extends State<ListEntryField> {
  //Списки описів, типу введення, чи пусті поля, та чи прихований текст
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

  //Перевірка на те чи пусте поле
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

  //Створення віджету за допомогою методу build.
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      //Задання кількості елементів
      itemCount: widget.listController.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextField(
            //Додавання контролера
            controller: widget.listController[index],

            //Визначення типу тексту
            keyboardType: listTypeInput[index],

            //Чи буде тест прихованим
            obscureText: listObscureText[index],

            //Стилізація поля
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: listLabel[index],
              errorText: validateIsEmpty[index]
                  ? '${listLabel[index]} is Empty'
                  : null,
            ),

            //На той випадок якщо з поля все буде стерто, для відображення помилки
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
