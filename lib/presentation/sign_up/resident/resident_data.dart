//Додавання бібліотеки Flutter
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Підключення необхідних кастомних віджетів
import '../../../domain/user/user_data.dart';
import 'proof_status.dart';
import '../../widgets/main_name_page.dart';
import '../../widgets/list_entry_field.dart';

//StatefulWidget для динамічного відображення змін на екрані
class ResidentData extends StatefulWidget {
  const ResidentData({super.key});

  //Створення стану сторінки, яку буде відображенно
  @override
  State<ResidentData> createState() => _ResidentDataState();
}

//Клас-стан сторінки
class _ResidentDataState extends State<ResidentData> {
  //Поля для збереження результату змін та подальшого збереження.
  String name = '', email = '', phone = '';

  //Список полів тексту з списками: опису поля, налаштування типу введення, та чи буде текст прихованим
  final ListEntryField entryField = ListEntryField(
    listLabel: const ['First and Last Name', 'E-mail', 'Passwors'],
    listTypeInput: const [
      TextInputType.text,
      TextInputType.text,
      TextInputType.text,
    ],
    listIsObscureText: const [false, false, true],
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
            const MainNamePageSignUp(text: 'Your data'),

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
                  name = entryField.listController[0].text;
                  email = entryField.listController[1].text;
                });
                if (isCompletedForm == true) {
                  context.read<UserData>().changeBasedData(name, email, phone);
                  context.read<UserData>().changeType(UserType.resident);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ProofStatus()));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
