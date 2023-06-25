//Віджет головної назви сторінки

import 'package:flutter/material.dart';

//StatlessWidget для выджетыв що не будуть ні як змінюватись на екрані
class MainNamePageSignUp extends StatelessWidget {
  //Поле для тексту що потрібно відобразити
  final String text;

  const MainNamePageSignUp({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
        //Розташування тексту за допомогою padding
        padding: const EdgeInsets.only(top: 50, left: 10, bottom: 10),

        //Переданий та стильозований текст
        child: Text(text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)));
  }
}
