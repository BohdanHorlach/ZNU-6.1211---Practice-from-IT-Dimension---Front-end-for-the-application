import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/management_companies/committees_data.dart';
import '../../../domain/models/management_companies/companies_data.dart';
import '../assets_path.dart';
import 'menu_option.dart';

Map<String, Widget> committeeOptions = {
  "Building Management": SvgPicture.asset(houseIcon),
  "Collection": SvgPicture.asset(handWithMoneyIcon),
  "Invoice Table": SvgPicture.asset(folderIcon),
  "Account Status": SvgPicture.asset(moneyIcon),
  "Payment": SvgPicture.asset(paymentCardIcon),
  "Service call": SvgPicture.asset(exclamationMarkIcon),
  "Tenant Room": SvgPicture.asset(paperIcon),
  "Professionals": SvgPicture.asset(caseIcon),
  "Building Maintenance": SvgPicture.asset(toolBoxIcon),
  "Forum": SvgPicture.asset(forumIcon),
  "Discussion": SvgPicture.asset(libraIcon),
  "Management Fee": SvgPicture.asset(reportIcon),
};

Map<String, Widget> companyOptions = {
  //"Building Management": SvgPicture.asset(houseIcon),
  "Collection": SvgPicture.asset(handWithMoneyIcon),
  "Invoice Table": SvgPicture.asset(folderIcon),
  //
  "Account Status": SvgPicture.asset(moneyIcon),
  "Payment": SvgPicture.asset(paymentCardIcon),
  "Service call": SvgPicture.asset(exclamationMarkIcon),
  //
  "Tenant Room": SvgPicture.asset(paperIcon),
  "Professionals": SvgPicture.asset(caseIcon),
  "Building Maintenance": SvgPicture.asset(toolBoxIcon),
  //
  "Forum": SvgPicture.asset(forumIcon),
  "Discussion": SvgPicture.asset(libraIcon),
  //
  "Management Fee": SvgPicture.asset(reportIcon),
};

//

final Map<String, Widget> mainMenuOptions = {
  "Building Management": const BuildingManagementOption(user: User.company),
  "Collection": const CollectionOption(),
  "Invoice Table": const InvoiceTableOption(),
  //
  "Account Status": const AccountStatusOption(),
  "Payment": const PaymentsOption(),
  "Service call": const ServiceCallOption(),
  //
  "Tenant Room": const TenantRoomOption(),
  "Professionals": const ProfessionalsOption(),
  "Building Maintenance": const BuildingMaintenanceOption(),
  //
  "Forum": const ForumOption(),
  "Discussion": const DiscussionOption(),
  //
  "Management Fee": const ManagementFeeOption(),
};

//
enum User { manager, company }

class BuildingManagementOption extends StatelessWidget {
  const BuildingManagementOption({required this.user, super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    if (user == User.manager) {
      return Consumer<ApprovedCompanyNotifier>(
          builder: (context, company, child) {
        String nextRoute =
            company.isApprovedCompany ? '/approved' : '/management';
        return MenuOption(
          title: 'Building Management',
          iconRoute: houseIcon,
          borderColor: const Color.fromRGBO(0, 68, 148, 1),
          routeName: nextRoute,
        );
      });
    } else {
      return Consumer<ApprovedCommitteeNotifier>(
          builder: (context, committee, child) {
        String nextRoute =
            committee.isApprovedCommittee ? '/approved' : '/management';
        return MenuOption(
          title: 'Building Management',
          iconRoute: houseIcon,
          borderColor: const Color.fromRGBO(0, 68, 148, 1),
          routeName: nextRoute,
        );
      });
    }
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
