import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/models/management_companies/committees_data.dart';
import '../../domain/models/management_companies/companies_data.dart';
import 'main_menu_go_routers.dart';

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
          useMaterial3: true,
        ),
        routerConfig: routerManager,
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
        ChangeNotifierProvider(
            create: (context) => AllCommitteeOffersNotifier()),
        ChangeNotifierProvider(
            create: (context) => ApprovedCommitteeNotifier()),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          useMaterial3: true,
        ),
        routerConfig: routerCompany,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class TenantApp extends StatelessWidget {
  const TenantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => AllCommitteeOffersNotifier()),
        ChangeNotifierProvider(
            create: (context) => ApprovedCommitteeNotifier()),
        // Todo remove
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          useMaterial3: true,
        ),
        routerConfig: routerTenant,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class WorkerApp extends StatelessWidget {
  const WorkerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => AllCommitteeOffersNotifier()),
        ChangeNotifierProvider(
            create: (context) => ApprovedCommitteeNotifier()),
        //todo remove
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          useMaterial3: true,
        ),
        routerConfig: routerWorker,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
