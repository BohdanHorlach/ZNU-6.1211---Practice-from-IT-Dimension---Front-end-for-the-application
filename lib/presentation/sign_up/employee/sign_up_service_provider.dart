import 'package:flutter/material.dart';
import 'dart:developer';
import '../../widgets/check_status/verifying_for_document.dart';
import '../../widgets/main_name_page.dart';
import '../../widgets/list_entry_field.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_dropdown_button.dart';

class SignUpServiceProvider extends StatefulWidget {
  const SignUpServiceProvider({super.key});

  @override
  State<SignUpServiceProvider> createState() => _SignUpServiceProviderState();
}

class _SignUpServiceProviderState extends State<SignUpServiceProvider> {
  final ListEntryField entryField = ListEntryField(
    listLabel: const ['Company Name', 'E-mail', 'Phone Number', 'Password'],
    listTypeInput: const [
      TextInputType.text,
      TextInputType.emailAddress,
      TextInputType.number,
      TextInputType.text
    ],
    listIsObscureText: const [false, false, false, true],
  );

  final List<String> choice = [
    'Builder',
    'Electrician',
    'Carpenter',
    'Plumber'
  ];

  String selectedChoice = '';

  CustomDropdownButton dropdownButton =
      CustomDropdownButton(label: '', listChoice: const [], updateState: () {});

  VerifyingDocument verifyingDocument = VerifyingDocument();

  @override
  void initState() {
    super.initState();
    selectedChoice = choice[0];
    dropdownButton = CustomDropdownButton(
        label: 'Your Profession',
        listChoice: choice,
        updateState: () {
          setState(() {
            selectedChoice = choice[dropdownButton.selectedIndex];
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            const MainNamePageSignUp(text: 'Employee data'),
            entryField,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: dropdownButton,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Divider(),
            ),
            verifyingDocument,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CustomButton(
                textButton: 'Save',
                onClick: () {
                  bool isCompletedForm = true;
                  setState(() {
                    isCompletedForm = entryField.isComplete();
                  });
                  if (isCompletedForm == true) {
                    log("${entryField.toStringShort()}$selectedChoice|${verifyingDocument.toStringShort()}");
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
