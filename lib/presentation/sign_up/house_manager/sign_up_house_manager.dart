import 'package:flutter/material.dart';
import 'dart:developer';
import '../house_manager/change_house.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/main_name_page.dart';
import '../../widgets/list_entry_field.dart';

class SignUpHouseManager extends StatefulWidget {
  const SignUpHouseManager({super.key});

  @override
  State<SignUpHouseManager> createState() => _SignUpHouseManagerState();
}

class _SignUpHouseManagerState extends State<SignUpHouseManager> {
  final ListEntryField entryField = ListEntryField(
    listLabel: const ['City', 'Street', 'House'],
    listTypeInput: const [
      TextInputType.text,
      TextInputType.text,
      TextInputType.text
    ],
    listIsObscureText: const [false, false, false],
  );
  //ЗАГЛУШКА
  void _onClick() {
    String result = entryField.toStringShort();
    log(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const MainNamePage(text: 'Location of the building'),
            entryField,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CustomButton(
                textButton: 'Go to design',
                onClick: () {
                  bool isCompletedForm = true;
                  setState(() {
                    isCompletedForm = entryField.isComplete();
                  });

                  if (isCompletedForm == true) {
                    _onClick(); //ЗАГЛУШКА
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ChangeHouse()));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
