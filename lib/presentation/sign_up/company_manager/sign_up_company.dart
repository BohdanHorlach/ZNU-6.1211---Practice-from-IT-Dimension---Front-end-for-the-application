import 'dart:developer';
import 'package:flutter/material.dart';
import '../../widgets/check_status/verifying_for_document.dart';
import '../../widgets/main_name_page.dart';
import '../../widgets/list_entry_field.dart';

class SignUpCompany extends StatefulWidget {
  const SignUpCompany({super.key});

  @override
  State<SignUpCompany> createState() => _SignUpCompanyState();
}

class _SignUpCompanyState extends State<SignUpCompany> {
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
  VerifyingDocument verifyingDocument = VerifyingDocument();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            const MainNamePageSignUp(text: 'Company data'),
            entryField,
            const Divider(),
            verifyingDocument,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                child: const Text('Save'),
                onPressed: () {
                  bool isCompletedForm = true;
                  setState(() {
                    isCompletedForm = entryField.isComplete();
                  });
                  log(isCompletedForm.toString());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
