import 'package:flutter/material.dart';
import 'dart:developer';
import '../resident/resident_data.dart';
import '../../widgets/main_name_page.dart';
import '../../widgets/list_entry_field.dart';
import '../../widgets/custom_button.dart';

class SignUpResident extends StatefulWidget {
  const SignUpResident({super.key});

  @override
  State<SignUpResident> createState() => _SignUpResidentState();
}

class _SignUpResidentState extends State<SignUpResident> {
  final ListEntryField entryField = ListEntryField(
    listLabel: const ['City', 'Street', 'House', 'Apartment'],
    listTypeInput: const [
      TextInputType.text,
      TextInputType.text,
      TextInputType.text,
      TextInputType.number
    ],
    listIsObscureText: const [false, false, false, false],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            const MainNamePage(text: 'House data'),
            entryField,
            const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            CustomButton(
              textButton: 'Go Next',
              onClick: () {
                bool isCompletedForm = true;
                setState(() {
                  isCompletedForm = entryField.isComplete();
                });
                if (isCompletedForm == true) {
                  log(entryField.toStringShort());
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ResidentData()));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
