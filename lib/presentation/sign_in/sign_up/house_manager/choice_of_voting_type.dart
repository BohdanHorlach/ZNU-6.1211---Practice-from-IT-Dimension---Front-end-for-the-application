import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/sign_in/widgets/main_name_page.dart';
import '../../widgets/check_status/verifying_for_document.dart';
import '../../widgets/check_status/voting.dart';
import '../../widgets/check_status/first_resident.dart';
import '../../widgets/custom_button.dart';

class ChoiceVotinType extends StatefulWidget {
  final String firstAndLastName;
  const ChoiceVotinType({super.key, required this.firstAndLastName});

  @override
  State<ChoiceVotinType> createState() => _ChoiceVotinTypeState();
}

class _ChoiceVotinTypeState extends State<ChoiceVotinType> {
  VerifyingDocument verifyingDocument = VerifyingDocument();
  Voting voting = Voting();
  FirstResident firstResident = FirstResident();
  List<Widget> listShowWidgets = [];
  List<String> listChoice = [
    'I have a document',
    'I was elected by vote',
    'I am the first tenant to install the app'
  ];
  String dropdownValue = '';

  int indexShowWidget = 0;

  @override
  void initState() {
    super.initState();
    dropdownValue = listChoice[0];
    listShowWidgets = [verifyingDocument, voting, firstResident];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: const MainNamePage(text: 'Status check'),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            InputDecorator(
              decoration: InputDecoration(
                labelText: widget.firstAndLastName,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.keyboard_arrow_down),
                iconSize: 25,
                elevation: 12,
                isExpanded: true,
                isDense: true,
                focusColor: Colors.white,
                underline: Container(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                    for (int i = 0; i < listChoice.length; i++) {
                      if (dropdownValue == listChoice[i]) {
                        indexShowWidget = i;
                        break;
                      }
                    }
                  });
                },
                items: listChoice.map<DropdownMenuItem<String>>((choice) {
                  return DropdownMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList(),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20), child: Divider()),
            listShowWidgets[indexShowWidget],
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CustomButton(
                textButton: 'Save',
                onClick: () {
                  print(listShowWidgets[indexShowWidget].toStringShort());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
