import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/sign%20in/sign%20up/house%20manager/change_house.dart';
import 'package:flutter_application_1/presentation/sign%20in/widgets/main_name_page.dart';

class SignUpHouseManager extends StatefulWidget {
  final List<TextEditingController> listController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  final List<String> listLabel = ['City', 'Street', 'House'];
  SignUpHouseManager({super.key});

  @override
  State<SignUpHouseManager> createState() => _SignUpHouseManagerState();
}

class _SignUpHouseManagerState extends State<SignUpHouseManager> {
  List<bool> listValidate = [false, false, false];
  //ЗАГЛУШКА
  void _onClick() {
    String result = '';
    for (int i = 0; i < widget.listController.length; i++) {
      result += "${widget.listController[i].text} ";
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
              itemCount: widget.listController.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: widget.listLabel[index],
                      errorText: listValidate[index]
                          ? '${widget.listLabel[index]} is Empty'
                          : null,
                    ),
                    controller: widget.listController[index],
                    onChanged: (value) {
                      setState(() {
                        listValidate[index] =
                            widget.listController[index].text == '';
                      });
                    },
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  bool isCompletedForm = true;
                  setState(() {
                    for (int i = 0; i < widget.listController.length; i++) {
                      if (widget.listController[i].text == '') {
                        isCompletedForm = false;
                        listValidate[i] = true;
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
