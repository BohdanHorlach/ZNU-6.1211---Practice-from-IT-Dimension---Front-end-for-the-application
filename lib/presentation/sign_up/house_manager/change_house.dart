import 'package:flutter/material.dart';
import '../house_manager/adding_personal_info.dart';
import '../../widgets/floor/floor_info.dart';
import '../../widgets/main_name_page.dart';

class ChangeHouse extends StatefulWidget {
  const ChangeHouse({super.key});

  @override
  State<ChangeHouse> createState() => ChangeHouseState();
}

class ChangeHouseState extends State<ChangeHouse> {
  double heightWidgets = 110;
  List<FloorInfo> listFloor = [FloorInfo()];

  @override
  void initState() {
    super.initState();
    setState(() {
      for (int i = 0; i < listFloor.length; i++) {
        listFloor[i].floor.typeOfFloor = 'Apartment';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            const MainNamePageSignUp(text: 'Building defenitions'),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              width: 100,
              height: listFloor.length <= 2
                  ? listFloor.length * heightWidgets + heightWidgets * 1.20
                  : 370,
              child: Column(
                children: [
                  Container(
                    height: heightWidgets / 2,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 229, 243, 250),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: const Center(
                        child: Text(
                      'My Building',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
                  ),
                  Container(
                    decoration:
                        const BoxDecoration(border: Border(top: BorderSide())),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 200),
                      child: ListView.builder(
                        shrinkWrap: true,
                        reverse: true,
                        itemCount: listFloor.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              const Padding(padding: EdgeInsets.only(top: 10)),
                              Text('${index + 1} Floor'),
                              listFloor[index],
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: IconButton(
                        color: Colors.blue,
                        onPressed: () {
                          setState(() {
                            listFloor.add(FloorInfo());
                          });
                        },
                        icon: const Icon(Icons.add, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: ElevatedButton(
                child: const Text('Go Next'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddingPersonalInfo()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
