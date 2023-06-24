import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:znu_flutter_it_dimension/domain/user/user_data.dart';
import 'package:znu_flutter_it_dimension/presentation/widgets/custom_push_replacement.dart';

import '../../main_menu/menus_roots.dart';
import '../../widgets/check_status/first_resident.dart';
import '../../widgets/check_status/verifying_for_document.dart';
import '../../widgets/check_status/voting.dart';
import '../../widgets/custom_dropdown_button.dart';
import '../../widgets/main_name_page.dart';

class ChoiceVotingType extends StatefulWidget {
  const ChoiceVotingType({super.key});

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
    curentWidget = listShowWidgets[dropdownButton.selectedIndex];
  }

  @override
  Widget build(BuildContext context) {
    dropdownButton = CustomDropdownButton(
        label: context.watch<UserData>().getFirstAndLastName,
        listChoice: choice,
        updateState: () {
          setState(() {
            curentWidget = listShowWidgets[dropdownButton.selectedIndex];
          });
        });
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: const MainNamePageSignUp(text: 'Status check'),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            dropdownButton,
            const Padding(padding: EdgeInsets.only(top: 20), child: Divider()),
            curentWidget,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                child: const Text('Save'),
                onPressed: () {
                  log(listShowWidgets[dropdownButton.selectedIndex]
                      .toStringShort());
                  customPushReplacement(context, const ManagerApp());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
