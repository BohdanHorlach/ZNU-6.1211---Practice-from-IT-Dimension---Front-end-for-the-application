//Додавання бібліотеки Flutter
import 'package:flutter/material.dart';

//Підключення необхідних кастомних віджетів
import '../house_manager/change_house.dart';
import '../../widgets/main_name_page.dart';
import '../../widgets/list_entry_field.dart';

//StatefulWidget для динамічного відображення змін на екрані
class SignUpHouseManager extends StatefulWidget {
  const SignUpHouseManager({super.key});

  //Створення стану сторінки, яку буде відображенно
  @override
  State<SignUpHouseManager> createState() => _SignUpHouseManagerState();
}

//Клас-стан сторінки
class _SignUpHouseManagerState extends State<SignUpHouseManager> {
  //Список полів тексту з списками: опису поля, налаштування типу введення, та чи буде текст прихованим
  final ListEntryField entryField = ListEntryField(
    listLabel: const ['City', 'Street', 'House'],
    listTypeInput: const [
      TextInputType.text,
      TextInputType.text,
      TextInputType.text
    ],
    listIsObscureText: const [false, false, false],
  );
  //Мтеод для збереження інформації
  void _onClick() {
    // ignore: unused_local_variable
    String result = entryField.toStringShort();
  }

  //Створення сторінки за допомогою методу build що повертає віджет Scaffold, саму сторінку
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar для заповнення вільного місця зверху екрана.
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        //ListView для можливості прокрутки у разі якщо висоти екрану пристроя не вистачить для відображення
        child: ListView(
          children: [
            //Головна назва сторінки
            const MainNamePageSignUp(text: 'Location of the building'),

            //Поля вводу тексту
            entryField,

            //Кнопка збереження та переходу на наступну сторінку
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                child: const Text('Go to design'),
                onPressed: () {
                  bool isCompletedForm = true;
                  setState(() {
                    isCompletedForm = entryField.isComplete();
                  });

                  if (isCompletedForm == true) {
                    _onClick();
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
