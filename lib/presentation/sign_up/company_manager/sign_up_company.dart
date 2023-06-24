import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/user/user_data.dart';
import '../../main_menu/menus_roots.dart';
import '../../widgets/check_status/verifying_for_document.dart';
import '../../widgets/custom_push_replacement.dart';
import '../../widgets/main_name_page.dart';
import '../../widgets/list_entry_field.dart';

class SignUpCompany extends StatefulWidget {
  const SignUpCompany({super.key});

  @override
  State<SignUpCompany> createState() => _SignUpCompanyState();
}

class _SignUpCompanyState extends State<SignUpCompany> {
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
                    name = entryField.listController[0].text;
                    email = entryField.listController[1].text;
                    phone = entryField.listController[2].text;
                  });
                  if (isCompletedForm == true) {
                    context
                        .read<UserData>()
                        .changeBasedData(name, email, phone);
                    context.read<UserData>().changeType(UserType.company);
                  }
                  log(isCompletedForm.toString());
                  customPushReplacement(context, const CompanyApp());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
