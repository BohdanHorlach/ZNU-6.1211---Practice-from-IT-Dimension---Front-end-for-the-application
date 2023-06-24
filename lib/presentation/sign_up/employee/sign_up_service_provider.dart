//Додавання бібліотек Flutter та Provider (збереження стану застосунку)
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Підключення необхідних кастомних віджетів
import '../../main_menu/menus_roots.dart';
import '../../widgets/custom_push_replacement.dart';
import '../../../domain/user/user_data.dart';
import '../../widgets/check_status/verifying_for_document.dart';
import '../../widgets/main_name_page.dart';
import '../../widgets/list_entry_field.dart';
import '../../widgets/custom_dropdown_button.dart';

//StatefulWidget для динамічного відображення змін на екрані
class SignUpServiceProvider extends StatefulWidget {
  const SignUpServiceProvider({super.key});

  //Створення стану сторінки, яку буде відображенно
  @override
  State<SignUpServiceProvider> createState() => _SignUpServiceProviderState();
}

//Клас-стан сторінки
class _SignUpServiceProviderState extends State<SignUpServiceProvider> {
  //Поля для збереження результату змін та подальшого збереження.
  String name = '', email = '', phone = '';

  //Список полів тексту з списками: опису поля, налаштування типу введення, та чи буде текст прихованим
  final ListEntryField entryField = ListEntryField(
    listLabel: const ['Company Name', 'E-mail', 'Phone Number', 'Password'],
    listTypeInput: const [
      TextInputType.text,
      TextInputType.emailAddress,
      TextInputType.number,
      TextInputType.text
    ],
    listIsObscureText: const [false, false, false, true],
  );

  //Список варіантів відповідей для випадаючого списку
  final List<String> choice = [
    'Builder',
    'Electrician',
    'Carpenter',
    'Plumber'
  ];

  //Полк для збереження обраної відповіді
  String selectedChoice = '';

  //Випадаючий список для обрання одного з варантів виду відповіді
  CustomDropdownButton dropdownButton =
      CustomDropdownButton(label: '', listChoice: const [], updateState: () {});

  //Віджет для верифікації статусу за документом
  VerifyingDocument verifyingDocument = VerifyingDocument();

  //Додавання до віджетів необхідної інформації
  @override
  void initState() {
    super.initState();
    selectedChoice = choice[0];
    dropdownButton = CustomDropdownButton(
        label: 'Your Profession',
        listChoice: choice,
        updateState: () {
          setState(() {
            selectedChoice = choice[dropdownButton.selectedIndex];
          });
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
        padding: const EdgeInsets.symmetric(horizontal: 20),

        //ListView для можливості прокрутки у разі якщо висоти екрану пристроя не вистачить для відображення
        child: ListView(
          shrinkWrap: true,
          children: [
            //Головна назва сторінки
            const MainNamePageSignUp(text: 'Employee data'),

            //Поля вводу тексту
            entryField,

            //Випадаючий список з варіантами відповідей
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: dropdownButton,
            ),

            //Роздільна смуга
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Divider(),
            ),

            //Віджет для перевірки статусу
            verifyingDocument,

            //Кнопка збереження інформації
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                child: const Text('Save'),
                onPressed: () {
                  bool isCompletedForm = true;
                  setState(() {
                    isCompletedForm = entryField.isComplete();
                    name = entryField.listController[0].text;
                    email = entryField.listController[1].text;
                    phone = entryField.listController[2].text;
                  });
                  if (isCompletedForm == true) {
                    context
                        .read<UserData>()
                        .changeBasedData(name, email, phone);
                    context
                        .read<UserData>()
                        .changeType(UserType.serviceProvider);
                    customPushReplacement(context, const WorkerApp());
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
