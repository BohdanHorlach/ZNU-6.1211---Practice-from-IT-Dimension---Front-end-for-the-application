// import 'package:flutter/material.dart';
// import 'iternal/application.dart';
//
// void main() {
//   runApp(const MyApp());
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/models/management_companies/companies_data.dart';
import 'package:provider/provider.dart';

import 'main_screen/screens.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AllCompaniesModel()),
    ChangeNotifierProvider(create: (context) => ApprovedCompany()),
    //another models...
  ], child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(
        //     seedColor: const Color.fromRGBO(216, 226, 255, 1)),
        useMaterial3: true,
        //appBarTheme: const AppBarTheme(centerTitle: true),
        //outlinedButtonTheme: const OutlinedButtonThemeData(style: ButtonStyle(backgroundColor: ),),
      ),
      home: const MainScreenManager(),
      debugShowCheckedModeBanner: false,
    );
  }
}
