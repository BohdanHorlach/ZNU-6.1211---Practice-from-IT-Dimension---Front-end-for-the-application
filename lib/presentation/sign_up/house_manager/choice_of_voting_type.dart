import 'package:flutter/material.dart';
import 'dart:developer';
import '../../widgets/main_name_page.dart';
import '../../widgets/check_status/verifying_for_document.dart';
import '../../widgets/check_status/voting.dart';
import '../../widgets/check_status/first_resident.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_dropduwn_button.dart';

class ChoiceVotingType extends StatefulWidget {
  final String firstAndLastName;
  const ChoiceVotingType({super.key, required this.firstAndLastName});

  @override
  State<ChoiceVotingType> createState() => _ChoiceVotingTypeState();
}

class _ChoiceVotingTypeState extends State<ChoiceVotingType> {
  VerifyingDocument verifyingDocument = VerifyingDocument();
  Voting voting = Voting();
  FirstResident firstResident = FirstResident();
  List<Widget> listShowWidgets = [];
  List<String> choice = [
    'I have a document',
    'I was elected by vote',
    'I am the first tenant to install the app'
  ];
  Widget curentWidget = Container();

  CustomDropdownButton dropdownButton =
      CustomDropdownButton(label: '', listChoice: const [], updateState: () {});

  @override
  void initState() {
    super.initState();
    listShowWidgets = [verifyingDocument, voting, firstResident];
    dropdownButton = CustomDropdownButton(
        label: widget.firstAndLastName,
        listChoice: choice,
        updateState: () {
          setState(() {
            curentWidget = listShowWidgets[dropdownButton.selectedIndex];
          });
        });
    curentWidget = listShowWidgets[dropdownButton.selectedIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: const MainNamePage(text: 'Status check'),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            dropdownButton,
            const Padding(padding: EdgeInsets.only(top: 20), child: Divider()),
            curentWidget,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CustomButton(
                textButton: 'Save',
                onClick: () {
                  log(listShowWidgets[dropdownButton.selectedIndex]
                      .toStringShort());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
