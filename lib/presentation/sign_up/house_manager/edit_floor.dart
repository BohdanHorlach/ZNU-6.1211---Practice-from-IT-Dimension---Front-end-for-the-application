//Додавання бібліотеки Flutter
import 'package:flutter/material.dart';

//Підключення необхідних кастомних віджетів
import '../../../domain/models/floor/apartment_model.dart';
import '../../../domain/models/floor/floor_model.dart';
import '../../widgets/main_name_page.dart';

//Клас для зручного збереження контроллерів полів вводу, що будуть розташованні по двічі у рядку
//Поля потрібні для зазначеня номеру та кількості кімнат
class ControllerFromApartmentText {
  final numberTheApartment = TextEditingController();
  final countOfRooms = TextEditingController();
  bool isEmpty = false;
}

//StatefulWidget для динамічного відображення змін на екрані
// ignore: must_be_immutable
class EditFloor extends StatefulWidget {
  //Стан поверху, зі списком квартир
  FloorModel thisFloor = FloorModel([]);

  EditFloor({super.key, required this.thisFloor});

  //Створення сторінки стану, яку буде відображенно
  @override
  State<EditFloor> createState() => _EditFloorState();
}

//Клас-стан сторінки
class _EditFloorState extends State<EditFloor> {
  //Контроллер для поля з описом про тип поверху
  final controllerType = TextEditingController();
  bool typeApartmentIsEmpty = false;

  //Список контролерів для відображення інформації усіх квартир
  List<ControllerFromApartmentText> listToApartCntrl = [];

  //Додавання до віджетів необхідної інформаці
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

  //Метод для перевірки чи є пусті поля
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

  //Збереження інформації та перехід на минулу сторінку
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

  //Створення сторінки за допомогою методу build що повертає віджет Scaffold, саму сторінку
  @override
  Widget build(BuildContext context) {
    //Перевизначення кнопки повертання на минулу сторінку.
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, widget.thisFloor);
        return Future.value(false);
      },
      child: Scaffold(
        //AppBar для заповнення вільного місця зверху екрана.
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          //ListView для можливості прокрутки у разі якщо висоти екрану пристроя не вистачить для відображення
          child: ListView(
            children: <Widget>[
              //Головна назва сторінки
              const MainNamePageSignUp(text: 'Edit floor'),

              //Поле вводу для визначення типу поверху
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

              //Обмеження місця для відображення доданих квартир до поверху
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 250),
                //ListView.builder для відображення всіх кравтир на поверсі
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

                            //Кнопка видалення квартири
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
                          //Поле для визанчення кількості кімнат
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
                          //Поле для визначення номеру квратири
                          SizedBox(
                            width: 150,
                            child: TextField(
                              controller:
                                  listToApartCntrl[index].numberTheApartment,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'Number Of Apartment',
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
              //Кнопка додавання нової квартири
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

              //Кнопка збереження
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 30),
                child: ElevatedButton(
                    onPressed: saveInformation,
                    child: const Text('Save Information')),
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
