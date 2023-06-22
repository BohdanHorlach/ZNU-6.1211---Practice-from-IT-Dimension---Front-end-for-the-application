import 'package:flutter/material.dart';
import 'dart:developer';
import './proof_status.dart';
import '../../widgets/main_name_page.dart';
import '../../widgets/list_entry_field.dart';

class ResidentData extends StatefulWidget {
  const ResidentData({super.key});

  @override
  State<ResidentData> createState() => _ResidentDataState();
}

class _ResidentDataState extends State<ResidentData> {
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
                });
                if (isCompletedForm == true) {
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
