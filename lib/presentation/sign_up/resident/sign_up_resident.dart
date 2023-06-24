//Додавання бібліотеки Flutter
import 'package:flutter/material.dart';

//Підключення необхідних кастомних віджетів
import '../resident/resident_data.dart';
import '../../widgets/main_name_page.dart';
import '../../widgets/list_entry_field.dart';

//StatefulWidget для динамічного відображення змін на екрані
class SignUpResident extends StatefulWidget {
  const SignUpResident({super.key});

  //Створення стану сторінки, яку буде відображенно
  @override
  State<SignUpResident> createState() => _SignUpResidentState();
}

//Клас-стан сторінки
class _SignUpResidentState extends State<SignUpResident> {
  //Список полів тексту з списками: опису поля, налаштування типу введення, та чи буде текст прихованим
  final ListEntryField entryField = ListEntryField(
    listLabel: const ['City', 'Street', 'House', 'Apartment'],
    listTypeInput: const [
      TextInputType.text,
      TextInputType.text,
      TextInputType.text,
      TextInputType.number
    ],
    listIsObscureText: const [false, false, false, false],
  );

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
          shrinkWrap: true,
          children: [
            //Головна назва сторінки
            const MainNamePageSignUp(text: 'House data'),

            //Поля вводу тексту
            entryField,
            const Padding(padding: EdgeInsets.symmetric(vertical: 15)),

            //Кнопка збереження та переходу
            ElevatedButton(
              child: const Text('Go Next'),
              onPressed: () {
                bool isCompletedForm = true;
                setState(() {
                  isCompletedForm = entryField.isComplete();
                });
                if (isCompletedForm == true) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ResidentData()));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
