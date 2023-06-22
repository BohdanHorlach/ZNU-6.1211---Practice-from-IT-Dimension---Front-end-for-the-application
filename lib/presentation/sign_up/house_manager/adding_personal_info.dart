import 'package:flutter/material.dart';
import '../house_manager/choice_of_voting_type.dart';
import '../../widgets/main_name_page.dart';
import '../../widgets/list_entry_field.dart';

class AddingPersonalInfo extends StatefulWidget {
  const AddingPersonalInfo({super.key});

  @override
  State<AddingPersonalInfo> createState() => _AddingPersonalInfoState();
}

class _AddingPersonalInfoState extends State<AddingPersonalInfo> {
  final listEntryField = ListEntryField(listLabel: const [
    'First name Last Name',
    'E-mail',
    'Phone Number',
    'Password'
  ], listTypeInput: const [
    TextInputType.text,
    TextInputType.emailAddress,
    TextInputType.number,
    TextInputType.visiblePassword
  ], listIsObscureText: const [
    false,
    false,
    false,
    true
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const MainNamePageSignUp(text: 'Personal Information'),
            listEntryField,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                child: const Text('Go Next'),
                onPressed: () {
                  bool isCompletedForm = true;
                  setState(() {
                    isCompletedForm = listEntryField.isComplete();
                  });
                  if (isCompletedForm == true) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ChoiceVotingType(
                            firstAndLastName:
                                listEntryField.listController[0].text)));
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
