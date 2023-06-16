import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/sign%20in/widgets/entry_filed.dart';
import 'package:flutter_application_1/presentation/sign%20in/sign%20up/house%20manager/change_house.dart';

class SignUpHouseManager extends StatelessWidget {
  final EntryField city = EntryField(label: 'City');
  final EntryField street = EntryField(label: 'Street');
  final EntryField house = EntryField(label: 'House');

  //ЗАГЛУШКА
  void _onClick() {
    print(
        city.resualtText + " " + street.resualtText + " " + house.resualtText);
  }
  //ЗАГЛУШКА

  SignUpHouseManager({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          const Padding(
              padding: EdgeInsets.only(top: 60, left: 30, bottom: 10),
              child: Text('Location of the building',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))),
          city,
          street,
          house,
          Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () {
                    _onClick(); //ЗАГЛУШКА
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ChangeHouse()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                  child: const Text('Go to design'))),
        ],
      ),
    );
  }
}
