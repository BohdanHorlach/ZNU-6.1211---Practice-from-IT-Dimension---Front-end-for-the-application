import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/sign%20in/sign%20up/house%20manager/change_house.dart';
import 'package:flutter_application_1/presentation/sign%20in/widgets/entry_field.dart';
import 'package:flutter_application_1/presentation/sign%20in/widgets/main_name_page.dart';

class SignUpHouseManager extends StatefulWidget {
  const SignUpHouseManager({super.key});

  @override
  State<SignUpHouseManager> createState() => _SignUpHouseManagerState();
}

class _SignUpHouseManagerState extends State<SignUpHouseManager> {
  final listTextLield = [
    EntryField(label: 'City'),
    EntryField(label: 'Street'),
    EntryField(label: 'House')
  ];
  //ЗАГЛУШКА
  void _onClick() {
    String result = '';
    for (int i = 0; i < listTextLield.length; i++) {
      result += "${listTextLield[i].controller.text} ";
    }
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const MainNamePage(text: 'Location of the building'),
            ListView.builder(
              shrinkWrap: true,
              itemCount: listTextLield.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: listTextLield[index],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  bool isCompletedForm = true;
                  setState(() {
                    for (int i = 0; i < listTextLield.length; i++) {
                      if (listTextLield[i].controller.text == '') {
                        isCompletedForm = false;
                        listTextLield[i].isEmpty = true;
                      }
                    }
                  });

                  if (isCompletedForm == true) {
                    _onClick(); //ЗАГЛУШКА
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ChangeHouse()));
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white),
                child: const Text('Go to design'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
