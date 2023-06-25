//Додавання бібліотек Flutter та Provider (збереження стану застосунку)
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Підключення необхідних кастомних віджетів
import '../../../domain/user/user_data.dart';
import '../house_manager/choice_of_voting_type.dart';
import '../../widgets/main_name_page.dart';
import '../../widgets/list_entry_field.dart';

//StatefulWidget для динамічного відображення змін на екрані
class AddingPersonalInfo extends StatefulWidget {
  const AddingPersonalInfo({super.key});

  //Створення стану сторінки, яку буде відображенно
  @override
  State<AddingPersonalInfo> createState() => _AddingPersonalInfoState();
}

//Клас-стан сторінки
class _AddingPersonalInfoState extends State<AddingPersonalInfo> {
  //Поля для збереження результату змін та подальшого збереження.
  String name = '', email = '', phone = '';

  //Список полів тексту з списками: опису поля, налаштування типу введення, та чи буде текст прихованим
  final entryField = ListEntryField(listLabel: const [
    'First name Last Name',
    'E-mail',
    'Phone Number',
    'Password'
  ], listTypeInput: const [
    TextInputType.text,
    TextInputType.emailAddress,
    TextInputType.number,
    TextInputType.visiblePassword
  ], listIsObscureText: const [
    false,
    false,
    false,
    true
  ]);

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
          children: [
            //Головна назва сторінки
            const MainNamePageSignUp(text: 'Personal Information'),

            //Поля вводу тексту
            entryField,

            //Кнопка збереження інформації
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                child: const Text('Go Next'),
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
                    context.read<UserData>().changeType(UserType.houseManager);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ChoiceVotingType()));
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
