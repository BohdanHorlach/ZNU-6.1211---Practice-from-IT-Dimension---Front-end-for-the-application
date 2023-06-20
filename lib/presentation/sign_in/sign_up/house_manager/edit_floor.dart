import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/models/floor/apartment_model.dart';
import 'package:flutter_application_1/domain/models/floor/floor_model.dart';
import 'package:flutter_application_1/presentation/sign_in/widgets/custom_button.dart';
import 'package:flutter_application_1/presentation/sign_in/widgets/main_name_page.dart';

class ControllerFromApartmentText {
  final numberTheApartment = TextEditingController();
  final countOfRooms = TextEditingController();
  bool isEmpty = false;
}

// ignore: must_be_immutable
class EditFloor extends StatefulWidget {
  FloorModel thisFloor = FloorModel([]);
  EditFloor({super.key, required this.thisFloor});

  @override
  State<EditFloor> createState() => _EditFloorState();
}

class _EditFloorState extends State<EditFloor> {
  final controllerType = TextEditingController();
  bool typeApartmentIsEmpty = false;
  List<ControllerFromApartmentText> listToApartCntrl = [];

  @override
  void initState() {
    final listApartment = widget.thisFloor.listApartment;

    controllerType.text = widget.thisFloor.typeOfFloor;
    for (int i = 0; i < listApartment.length; i++) {
      listToApartCntrl.add(ControllerFromApartmentText());
    }

    for (int i = 0; i < listApartment.length; i++) {
      listToApartCntrl[i].numberTheApartment.text =
          listApartment[i].numberOfApartments.toString();

      listToApartCntrl[i].countOfRooms.text =
          listApartment[i].countOfRooms.toString();
    }
    super.initState();
  }

  bool isValid() {
    bool isCorrect = true;
    setState(() {
      for (int i = 0; i < listToApartCntrl.length; i++) {
        if (listToApartCntrl[i].countOfRooms.text == '' ||
            listToApartCntrl[i].numberTheApartment.text == '') {
          listToApartCntrl[i].isEmpty = true;
          isCorrect = false;
        }
      }
    });
    return isCorrect;
  }

  Future<bool> saveInformation() {
    if (isValid() == true) {
      var listApartment = widget.thisFloor.listApartment;
      for (int i = 0; i < listApartment.length; i++) {
        listApartment[i].numberOfApartments =
            listToApartCntrl[i].numberTheApartment.text;

        listApartment[i].countOfRooms = listToApartCntrl[i].countOfRooms.text;
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
                child: TextField(
                  controller: controllerType,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Type of Apartment',
                    errorText: typeApartmentIsEmpty ? 'Type is Empty' : null,
                  ),
                  onChanged: (value) {
                    setState(() {
                      typeApartmentIsEmpty = controllerType.text == '';
                    });
                  },
                ),
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
                            child: TextField(
                              controller: listToApartCntrl[index].countOfRooms,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'Count Rooms',
                                errorText: listToApartCntrl[index].isEmpty
                                    ? 'Count is Empty'
                                    : null,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  listToApartCntrl[index].isEmpty =
                                      listToApartCntrl[index]
                                              .countOfRooms
                                              .text ==
                                          '';
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: TextField(
                              controller:
                                  listToApartCntrl[index].numberTheApartment,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'Count Rooms',
                                errorText: listToApartCntrl[index].isEmpty
                                    ? 'Count is Empty'
                                    : null,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  listToApartCntrl[index].isEmpty =
                                      listToApartCntrl[index]
                                              .numberTheApartment
                                              .text ==
                                          '';
                                });
                              },
                            ),
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
                        });
                      },
                      icon: const Icon(Icons.add, color: Colors.black),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 30),
                child: CustomButton(
                    textButton: 'Save Information', onClick: saveInformation),
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
