import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/user/user_data.dart';
import 'dart:developer';
import '../../widgets/check_status/verifying_for_document.dart';
import '../../widgets/main_name_page.dart';
import '../../widgets/list_entry_field.dart';
import '../../widgets/custom_dropdown_button.dart';

class SignUpServiceProvider extends StatefulWidget {
  const SignUpServiceProvider({super.key});

  @override
  State<SignUpServiceProvider> createState() => _SignUpServiceProviderState();
}

class _SignUpServiceProviderState extends State<SignUpServiceProvider> {
  String name = '', email = '', phone = '';
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
              child: ElevatedButton(
                child: const Text('Save'),
                onPressed: () {
                  bool isCompletedForm = true;
                  setState(() {
                    isCompletedForm = entryField.isComplete();
                    name = entryField.listController[0].text;
                    email = entryField.listController[1].text;
                    phone = entryField.listController[2].text;
                  });
                  if (isCompletedForm == true) {
                    context
                        .read<UserData>()
                        .changeBasedData(name, email, phone);
                    context
                        .read<UserData>()
                        .changeType(UserType.serviceProvider);
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
