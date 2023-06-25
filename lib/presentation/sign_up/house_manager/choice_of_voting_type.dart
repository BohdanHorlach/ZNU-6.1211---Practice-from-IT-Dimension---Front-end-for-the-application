//Додавання бібліотек Flutter та Provider (збереження стану застосунку)
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Підключення необхідних кастомних віджетів
import '../../widgets/custom_push_replacement.dart';
import '../../main_menu/menus_roots.dart';
import '../../../domain/user/user_data.dart';
import '../../widgets/main_name_page.dart';
import '../../widgets/check_status/verifying_for_document.dart';
import '../../widgets/check_status/voting.dart';
import '../../widgets/check_status/first_resident.dart';
import '../../widgets/custom_dropdown_button.dart';

//StatefulWidget для динамічного відображення змін на екрані
class ChoiceVotingType extends StatefulWidget {
  const ChoiceVotingType({super.key});

  //Створення стану сторінки, яку буде відображенно
  @override
  State<ChoiceVotingType> createState() => _ChoiceVotingTypeState();
}

//Клас-стан сторінки
class _ChoiceVotingTypeState extends State<ChoiceVotingType> {
  //Віджети верифікації статусу
  VerifyingDocument verifyingDocument = VerifyingDocument();
  Voting voting = Voting();
  FirstResident firstResident = FirstResident();

  //Список для відображення обраного варіанту
  List<Widget> listShowWidgets = [];

  //Список можливих варінтів відповідей
  List<String> choice = [
    'I have a document',
    'I was elected by vote',
    'I am the first tenant to install the app'
  ];

  //Обраний віджет
  Widget curentWidget = Container();

  //Випадаючий список для обрання одного з варантів виду відповіді
  CustomDropdownButton dropdownButton =
      CustomDropdownButton(label: '', listChoice: const [], updateState: () {});

  //Додавання до віджетів необхідної інформаці
  @override
  void initState() {
    super.initState();
    listShowWidgets = [verifyingDocument, voting, firstResident];
    curentWidget = listShowWidgets[dropdownButton.selectedIndex];
  }

  //Створення сторінки за допомогою методу build що повертає віджет Scaffold, саму сторінку
  @override
  Widget build(BuildContext context) {
    //Ініціалізація списку варіантів відповідей, додано до методу build для коректної змінни віджету у curentWidget
    dropdownButton = CustomDropdownButton(
        label: context.watch<UserData>().getFirstAndLastName,
        listChoice: choice,
        updateState: () {
          setState(() {
            curentWidget = listShowWidgets[dropdownButton.selectedIndex];
          });
        });

    return Scaffold(
      //AppBar для заповнення вільного місця зверху екрана.
      appBar: AppBar(),

      //Тіло з  доданимим до нього всіма необхідними віджетами
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),

        //ListView для можливості прокрутки у разі якщо висоти екрану пристроя не вистачить для відображення
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            //Головна назва сторінки
            Container(
              alignment: Alignment.topLeft,
              child: const MainNamePageSignUp(text: 'Status check'),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),

            //Випадаючий список з варіантами відповідей
            dropdownButton,

            //Роздільна смуга
            const Padding(padding: EdgeInsets.only(top: 20), child: Divider()),

            //Обраний віджет
            curentWidget,

            //Кнопка збереження
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                child: const Text('Save'),
                onPressed: () {
                  customPushReplacement(context, const ManagerApp());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
