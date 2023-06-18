import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/models/floor/apartment_model.dart';
import 'package:flutter_application_1/domain/models/floor/floor_model.dart';
import 'package:flutter_application_1/presentation/sign%20in/widgets/entry_field.dart';
import 'package:flutter_application_1/presentation/sign%20in/widgets/main_name_page.dart';

class ControllerFromApartmentText {
  final numberTheApartment = EntryField(label: 'Number of Apatment');
  final countOfRooms = EntryField(label: 'Count rooms');
}

// ignore: must_be_immutable
class EditFloor extends StatefulWidget {
  FloorModel thisFloor = FloorModel([]);
  EditFloor({super.key, required this.thisFloor});

  @override
  State<EditFloor> createState() => _EditFloorState();
}

class _EditFloorState extends State<EditFloor> {
  final typeOfApartmen = EntryField(label: 'Type of Apartmen');
  List<ControllerFromApartmentText> listToApartCntrl = [];

  @override
  void initState() {
    final listApartment = widget.thisFloor.listApartment;

    typeOfApartmen.controller.text = widget.thisFloor.typeOfFloor;
    for (int i = 0; i < listApartment.length; i++) {
      listToApartCntrl.add(ControllerFromApartmentText());
    }

    for (int i = 0; i < listApartment.length; i++) {
      listToApartCntrl[i].numberTheApartment.controller.text =
          listApartment[i].numberTheApartment.toString();

      listToApartCntrl[i].countOfRooms.controller.text =
          listApartment[i].countOfRooms.toString();
    }
    super.initState();
  }

  bool isValid() {
    bool isCorrect = true;
    setState(() {
      for (int i = 0; i < listToApartCntrl.length; i++) {
        if (listToApartCntrl[i].countOfRooms.controller.text == '' ||
            listToApartCntrl[i].numberTheApartment.controller.text == '') {
          isCorrect = false;
          break;
        }
      }
    });
    return isCorrect;
  }

  Future<bool> saveInformation() {
    if (isValid() == true) {
      var listApartment = widget.thisFloor.listApartment;
      for (int i = 0; i < listApartment.length; i++) {
        listApartment[i].numberTheApartment =
            listToApartCntrl[i].numberTheApartment.controller.text;

        listApartment[i].countOfRooms =
            listToApartCntrl[i].countOfRooms.controller.text;
      }
      Navigator.pop(context, widget.thisFloor);
    }
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, widget.thisFloor);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: <Widget>[
              const MainNamePage(text: 'Edit floor'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: typeOfApartmen,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 250),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.thisFloor.listApartment.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50))),
                            height: 50,
                            width: 50,
                            child: IconButton(
                              onPressed: () {
                                if (widget.thisFloor.listApartment.length !=
                                    1) {
                                  setState(() {
                                    widget.thisFloor.listApartment
                                        .removeAt(index);
                                    listToApartCntrl.removeAt(index);
                                  });
                                }
                              },
                              icon:
                                  const Icon(Icons.close, color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: listToApartCntrl[index].countOfRooms,
                          ),
                          SizedBox(
                            width: 150,
                            child: listToApartCntrl[index].numberTheApartment,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.thisFloor.listApartment
                              .add(ApartmentModel('0', '0'));
                          listToApartCntrl.add(ControllerFromApartmentText());
                          int index = listToApartCntrl.length - 1;
                          listToApartCntrl[index].countOfRooms.isEmpty = true;
                          listToApartCntrl[index].numberTheApartment.isEmpty =
                              true;
                        });
                      },
                      icon: const Icon(Icons.add, color: Colors.black),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 30),
                child: ElevatedButton(
                  onPressed: saveInformation,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                  child: const Text('Save Information'),
                ),
              ),
              const Divider(),
              const Text(
                'Remember. The order of the added apartments will be preserved in the final plan of the house',
                style: TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
