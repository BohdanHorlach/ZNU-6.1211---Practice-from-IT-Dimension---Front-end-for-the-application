import 'package:flutter/material.dart';
import '../house_manager/choice_of_voting_type.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/main_name_page.dart';

class AddingPersonalInfo extends StatefulWidget {
  const AddingPersonalInfo({super.key});

  @override
  State<AddingPersonalInfo> createState() => _AddingPersonalInfoState();
}

class _AddingPersonalInfoState extends State<AddingPersonalInfo> {
  final listController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  final listLabel = [
    'First name Last Name',
    'E-mail',
    'Phone Number',
    'Password'
  ];

  final listTypeInput = [
    TextInputType.text,
    TextInputType.emailAddress,
    TextInputType.number,
    TextInputType.visiblePassword
  ];

  List<bool> validateList = List.filled(4, false);

  bool isCorrectEntryinfo() {
    bool result = true;
    for (int i = 0; i < listController.length; i++) {
      if (listController[i].text == '') {
        setState(() {
          validateList[i] = true;
        });
        result = false;
      }
    }
    if (listController[1].text.contains('@gmail.com') == false) {
      setState(() {
        validateList[1] = true;
      });
      result = false;
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const MainNamePage(text: 'Personal Information'),
            ListView.builder(
              shrinkWrap: true,
              itemCount: listController.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    controller: listController[index],
                    keyboardType: listTypeInput[index],
                    obscureText: index == 3 ? true : false,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: listLabel[index],
                      errorText: validateList[index]
                          ? '${listLabel[index]} is incorrect'
                          : null,
                    ),
                    onChanged: (value) {
                      setState(() {
                        validateList[index] = listController[index].text == '';
                      });
                    },
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CustomButton(
                textButton: 'Go Next',
                onClick: () {
                  bool isCompletedForm = isCorrectEntryinfo();
                  if (isCompletedForm == true) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ChoiceVotinType(
                            firstAndLastName: listController[0].text)));
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
