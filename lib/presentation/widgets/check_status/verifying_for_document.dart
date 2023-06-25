//Віджет що відображатиме кнопку додавання файлів для підтвердженя статусу
//На даному етапі без заванатаження файлів через відсутність бек-енду.
import 'package:flutter/material.dart';

//StatefulWidget для динамічного відображення змін на екрані
// ignore: must_be_immutable
class VerifyingDocument extends StatefulWidget {
  //Поле результату, який буде повертатись при виклику toStringShort
  String result = '';
  VerifyingDocument({super.key});

  @override
  String toStringShort() {
    return "Verifying Document: $result";
  }

  //Створення стану віджету, який буде відображенно
  @override
  State<VerifyingDocument> createState() => _VerifyingDocumentState();
}

//Клас-стан віджету
class _VerifyingDocumentState extends State<VerifyingDocument> {
  //Створення віджету за допомогою методу build.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),

      //Розміщення обєктів по центру
      child: Center(
        child: Column(
          children: [
            //Декоративний текст
            const Text(
              'The system will check if you are the only tenant of the house.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const Padding(padding: EdgeInsets.all(10)),

            //Кнопка для завантаження файлів
            Ink(
              decoration: const ShapeDecoration(
                  shape: CircleBorder(), color: Colors.blue),
              child: IconButton(
                icon: const Icon(Icons.attach_file),
                onPressed: () {
                  setState(() {
                    widget.result = 'path file';
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
