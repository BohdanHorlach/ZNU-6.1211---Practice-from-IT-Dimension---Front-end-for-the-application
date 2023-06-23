// import 'package:flutter/material.dart';
// import 'iternal/application.dart';
//
// void main() {
//   runApp(const MyApp());
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/models/management_companies/committees_data.dart';
import 'package:flutter_application_1/domain/models/management_companies/companies_data.dart';
import 'package:provider/provider.dart';

import 'main_screen/go_routers/go_routers.dart';

void main() {
  runApp(const CompanyApp());
}

class ManagerApp extends StatelessWidget {
  const ManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AllCompaniesNotifier()),
        ChangeNotifierProvider(create: (context) => ApprovedCompanyNotifier()),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(
          //     seedColor: const Color.fromRGBO(216, 226, 255, 1)),
          useMaterial3: true,
          //appBarTheme: const AppBarTheme(centerTitle: true),
          //outlinedButtonTheme: const OutlinedButtonThemeData(style: ButtonStyle(backgroundColor: ),),
        ),
        routerConfig: routerManager,
        //home: const MainScreenManager(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class CompanyApp extends StatelessWidget {
  const CompanyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AllCommitteeOffersNotifier()),
        ChangeNotifierProvider(create: (context) => ApprovedCommitteeNotifier()),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(
          //     seedColor: const Color.fromRGBO(216, 226, 255, 1)),
          useMaterial3: true,
          //appBarTheme: const AppBarTheme(centerTitle: true),
          //outlinedButtonTheme: const OutlinedButtonThemeData(style: ButtonStyle(backgroundColor: ),),
        ),
        routerConfig: routerCompany,
        //home: const MainScreenManager(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
