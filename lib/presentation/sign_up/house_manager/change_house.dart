//Додавання бібліотеки Flutter
import 'package:flutter/material.dart';

//Підключення необхідних кастомних віджетів
import '../house_manager/adding_personal_info.dart';
import '../../widgets/floor/floor_info.dart';
import '../../widgets/main_name_page.dart';

//StatefulWidget для динамічного відображення змін на екрані
class ChangeHouse extends StatefulWidget {
  const ChangeHouse({super.key});

  //Створення стану сторінки, яку буде відображенно
  @override
  State<ChangeHouse> createState() => ChangeHouseState();
}

//Клас-стан сторінки
class ChangeHouseState extends State<ChangeHouse> {
  //Поле для більш зручного налаштування висоти віджетів
  double heightWidgets = 110, maxHeightFromWindows = 370;

  //Список з кастомних віджетів для відображення інформації до поверху
  List<FloorInfo> listFloor = [FloorInfo()];

  //Додавання до віджетів необхідної інформації
  @override
  void initState() {
    super.initState();
    setState(() {
      for (int i = 0; i < listFloor.length; i++) {
        listFloor[i].floor.typeOfFloor = 'Apartment';
      }
    });
  }

  //Створення сторінки за допомогою методу build що повертає віджет Scaffold, саму сторінку
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar для заповнення вільного місця зверху екрана.
      appBar: AppBar(),

      //Тіло з  доданимим до нього всіма необхідними віджетами
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),

        //ListView для можливості прокрутки у разі якщо висоти екрану пристроя не вистачить для відображення
        child: ListView(
          children: [
            //Головна назва сторінки
            const MainNamePageSignUp(text: 'Building defenitions'),

            //Створення вікна з відображеними у ньому поверхами
            Container(
              //Задання розмірів віджету
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              width: 100,
              height: listFloor.length <= 2
                  ? listFloor.length * heightWidgets + heightWidgets * 1.20
                  : maxHeightFromWindows,

              //Стовбчик для зображення декоративного надпису та інформції до поверху
              child: Column(
                children: [
                  //Контейнер для декоративного тексту
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
                  //Додатковий контенер для додання роздільної рамки, зроблено через проблеми відображення рамки у минулому віджеті
                  Container(
                    decoration:
                        const BoxDecoration(border: Border(top: BorderSide())),
                  ),

                  //Відображення віджету з інформацією про поверхи
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 200),

                      //ListView.builder для автоматичної побудови віджетів за списком
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

                  //Кнопка додавання поверхів
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

            //Кнопка для переходу на наступну сторінку
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
