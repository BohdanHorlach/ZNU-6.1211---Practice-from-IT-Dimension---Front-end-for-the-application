import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/models/management_companies/companies_data.dart';
import 'package:provider/provider.dart';

import '../assets_path.dart';
import 'menu_option.dart';

class BuildingManagementOption extends StatelessWidget {
  const BuildingManagementOption({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("build...");
    return Consumer<ApprovedCompany>(builder: (context, company, child) {
      String nextRoute = company.isApprovedCompany ? '/approved' : '/management';
      return MenuOption(
        title: 'Building Management',
        iconRoute: houseIcon,
        borderColor: const Color.fromRGBO(0, 68, 148, 1),
        routeName: nextRoute,
      );
    });
  }
}

class CollectionOption extends StatelessWidget {
  const CollectionOption({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuOption(
      title: 'Collection',
      iconRoute: handWithMoneyIcon,
      borderColor: Color.fromRGBO(8, 139, 148, 1),
      routeName: '/management',
    );
  }
}

class InvoiceTableOption extends StatelessWidget {
  const InvoiceTableOption({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuOption(
      title: 'Invoice Table',
      iconRoute: folderIcon,
      borderColor: Color.fromRGBO(192, 150, 0, 1),
      routeName: '/management',
    );
  }
}

//

class AccountStatusOption extends StatelessWidget {
  const AccountStatusOption({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuOption(
      title: 'Account Status',
      iconRoute: moneyIcon,
      borderColor: Color.fromRGBO(0, 110, 5, 1),
      routeName: '/management',
    );
  }
}

class PaymentsOption extends StatelessWidget {
  const PaymentsOption({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuOption(
      title: 'Payments',
      iconRoute: paymentCardIcon,
      borderColor: Color.fromRGBO(125, 146, 0, 1),
      routeName: '/management',
    );
  }
}

class ServiceCallOption extends StatelessWidget {
  const ServiceCallOption({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuOption(
      title: 'Service call',
      iconRoute: exclamationMarkIcon,
      borderColor: Color.fromRGBO(198, 107, 2, 1),
      routeName: '/management',
    );
  }
}

//

class TenantRoomOption extends StatelessWidget {
  const TenantRoomOption({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuOption(
      title: 'Tenant Room',
      iconRoute: paperIcon,
      borderColor: Color.fromRGBO(150, 28, 208, 1),
      routeName: '/management',
    );
  }
}

class ProfessionalsOption extends StatelessWidget {
  const ProfessionalsOption({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuOption(
      title: 'Professionals',
      iconRoute: caseIcon,
      borderColor: Color.fromRGBO(158, 3, 3, 1),
      routeName: '/management',
    );
  }
}

class BuildingMaintenanceOption extends StatelessWidget {
  const BuildingMaintenanceOption({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuOption(
      title: 'Building Maintenance',
      iconRoute: toolBoxIcon,
      borderColor: Color.fromRGBO(174, 25, 61, 1),
      routeName: '/management',
    );
  }
}

//

class ForumOption extends StatelessWidget {
  const ForumOption({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuOption(
      title: 'Forum',
      iconRoute: forumIcon,
      borderColor: Color.fromRGBO(1, 35, 210, 1),
      routeName: '/management',
    );
  }
}

class DiscussionOption extends StatelessWidget {
  const DiscussionOption({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuOption(
      title: 'Discussion',
      iconRoute: libraIcon,
      borderColor: Color.fromRGBO(1, 90, 193, 1),
      routeName: '/management',
    );
  }
}

//

class ManagementFeeOption extends StatelessWidget {
  const ManagementFeeOption({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuOption(
      title: 'Management Fee',
      iconRoute: reportIcon,
      borderColor: Color.fromRGBO(192, 150, 0, 1),
      routeName: '/management',
    );
  }
}

//

class RevenuesOption extends StatelessWidget {
  const RevenuesOption({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuOption(
      title: 'Revenues',
      iconRoute: diagramIcon,
      borderColor: Color.fromRGBO(1, 90, 193, 1),
      routeName: '/management',
    );
  }
}

class HistoryOption extends StatelessWidget {
  const HistoryOption({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuOption(
      title: 'History',
      iconRoute: caseTimeIcon,
      borderColor: Color.fromRGBO(192, 150, 0, 1),
      routeName: '/management',
    );
  }
}

class JobBoardOption extends StatelessWidget {
  const JobBoardOption({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuOption(
      title: 'Job Board',
      iconRoute: calendarIcon,
      borderColor: Color.fromRGBO(0, 68, 148, 1),
      width: 400,
      height: 200,
      routeName: '/management',
    );
  }
}

List<Widget> mainMenuOptions = [
  const BuildingManagementOption(),
  const CollectionOption(),
  const InvoiceTableOption(),
  //
  const AccountStatusOption(),
  const PaymentsOption(),
  const ServiceCallOption(),
  //
  const TenantRoomOption(),
  const ProfessionalsOption(),
  const BuildingMaintenanceOption(),
  //
  const ForumOption(),
  const DiscussionOption(),
  //
  const ManagementFeeOption(),
];
