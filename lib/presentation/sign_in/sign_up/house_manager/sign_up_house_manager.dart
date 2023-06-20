import 'package:flutter/material.dart';
import '../house_manager/change_house.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/main_name_page.dart';

class SignUpHouseManager extends StatefulWidget {
  const SignUpHouseManager({super.key});

  @override
  State<SignUpHouseManager> createState() => _SignUpHouseManagerState();
}

class _SignUpHouseManagerState extends State<SignUpHouseManager> {
  final listController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  final listLabel = ['City', 'Street', 'House'];
  List<bool> validateIsEmpty = List<bool>.filled(3, false);
  //ЗАГЛУШКА
  void _onClick() {
    String result = '';
    for (int i = 0; i < listController.length; i++) {
      result += "${listController[i].text} ";
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
              itemCount: listController.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    controller: listController[index],
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: listLabel[index],
                      errorText: validateIsEmpty[index]
                          ? '${listLabel[index]} is Empty'
                          : null,
                    ),
                    onChanged: (value) {
                      setState(() {
                        validateIsEmpty[index] =
                            listController[index].text == '';
                      });
                    },
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CustomButton(
                textButton: 'Go to design',
                onClick: () {
                  bool isCompletedForm = true;
                  setState(() {
                    for (int i = 0; i < listController.length; i++) {
                      if (listController[i].text == '') {
                        isCompletedForm = false;
                        validateIsEmpty[i] = true;
                      }
                    }
                  });

                  if (isCompletedForm == true) {
                    _onClick(); //ЗАГЛУШКА
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ChangeHouse()));
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
