//Додавання бібліотеки Flutter
import 'package:flutter/material.dart';

//Підключення необхідних кастомних віджетів
import '../../main_menu/menus_roots.dart';
import '../../widgets/custom_push_replacement.dart';
import '../../widgets/main_name_page.dart';
import '../../widgets/check_status/verifying_for_document.dart';

//StatefulWidget для динамічного відображення змін на екрані
class ProofStatus extends StatefulWidget {
  const ProofStatus({super.key});

  //Створення стану сторінки, яку буде відображенно
  @override
  State<ProofStatus> createState() => _ProofStatusState();
}

//Клас-стан сторінки
class _ProofStatusState extends State<ProofStatus> {
  //Віджет для верифікації статусу за документом
  final verifyingDocument = VerifyingDocument();

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
            const MainNamePageSignUp(text: 'Proof your status'),

            //Роздільна смуга
            const Padding(padding: EdgeInsets.only(top: 20), child: Divider()),

            //Віджет для перевірки статусу
            verifyingDocument,

            //Кнопка збереження
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: ElevatedButton(
                  child: const Text('Save'),
                  onPressed: () {
                    customPushReplacement(context, const TenantApp());
                  }),
            ),

            //Попереджувальний допис
            const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Divider()),
            const Text(
              'If your apartment was previously registered in the system. But you cannot access the QR code.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
