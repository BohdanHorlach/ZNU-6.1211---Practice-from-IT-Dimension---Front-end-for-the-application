import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer';
import '../../../domain/user/user_data.dart';
import 'proof_status.dart';
import '../../widgets/main_name_page.dart';
import '../../widgets/list_entry_field.dart';

class ResidentData extends StatefulWidget {
  const ResidentData({super.key});

  @override
  State<ResidentData> createState() => _ResidentDataState();
}

class _ResidentDataState extends State<ResidentData> {
  String name = '', email = '', phone = '';
  final ListEntryField entryField = ListEntryField(
    listLabel: const ['First and Last Name', 'E-mail', 'Passwors'],
    listTypeInput: const [
      TextInputType.text,
      TextInputType.text,
      TextInputType.text,
    ],
    listIsObscureText: const [false, false, true],
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
            const MainNamePageSignUp(text: 'Your data'),
            entryField,
            const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            ElevatedButton(
              child: const Text('Go Next'),
              onPressed: () {
                bool isCompletedForm = true;
                setState(() {
                  isCompletedForm = entryField.isComplete();
                  name = entryField.listController[0].text;
                  email = entryField.listController[1].text;
                });
                if (isCompletedForm == true) {
                  context.read<UserData>().changeBasedData(name, email, phone);
                  context.read<UserData>().changeType(UserType.resident);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ProofStatus()));
                  log(entryField.toStringShort());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
