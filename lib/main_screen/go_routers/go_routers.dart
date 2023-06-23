import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../app_screens/building_management_screens.dart';
import '../screens.dart';

final GoRouter routerManager = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MainScreenManager();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'management',
          builder: (BuildContext context, GoRouterState state) {
            return const BuildingManagementScreenCommittee();
          },
        ),
        GoRoute(
          path: 'approved',
          builder: (BuildContext context, GoRouterState state) {
            return const CommitteeApprovedScreen();
          },
        ),
      ],
    ),
  ],
);

final GoRouter routerCompany = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MainScreenManagementCompany();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'management',
          builder: (BuildContext context, GoRouterState state) {
            return const BuildingManagementScreenCompany();
          },
        ),
        GoRoute(
          path: 'approved',
          builder: (BuildContext context, GoRouterState state) {
            return const CompanyApprovedScreen();
          },
        ),
      ],
    ),
  ],
);