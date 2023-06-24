import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../domain/models/management_companies/committees_data.dart';
import '../../../../../domain/models/management_companies/companies_data.dart';
import '../../../assets_path.dart';
import '../../../widgets/all_menu_options.dart';

//may be needed somewhere else
class AvatarInGradientCircle extends StatelessWidget {
  final String imagePath;
  final double size;
  final Gradient gradient;
  static const double borderWidth = 2;

  const AvatarInGradientCircle(
      {required this.imagePath,
      required this.size,
      required this.gradient,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: gradient,
      ),
      padding: const EdgeInsets.all(borderWidth),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class IconInCircle extends StatelessWidget {
  const IconInCircle({required this.icon, super.key});

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 1),
      ),
      width: 40,
      height: 40,
      child: icon,
    );
  }
}

//contacts row with icons in circles
class ContactsRow extends StatelessWidget {
  const ContactsRow({this.is4 = true, super.key});

  final bool is4;

  @override
  Widget build(context) {
    return Row(
      children: [
        const Text("Contacts"),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              if (is4)
                IconInCircle(
                    icon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(wwwIcon),
                )),
              const SizedBox(
                width: 10,
              ),
              const IconInCircle(
                  icon: Icon(
                Icons.mail_outline,
                //size: 30,
              )),
              const SizedBox(
                width: 10,
              ),
              const IconInCircle(
                  icon: Icon(
                Icons.call_outlined,
                //size: 30,
              )),
              const SizedBox(
                width: 10,
              ),
              IconInCircle(
                  icon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(phoneCircleIcon),
              )),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        )
      ],
    );
  }
}

//committee parts

/// All [ManagementCompanyCard]s or message that not offers for now
class CompanyOffers extends StatelessWidget {
  const CompanyOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AllCompaniesNotifier>(
      builder: (context, companies, child) {
        if (companies.items.isEmpty) {
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                child: Text(
                    textAlign: TextAlign.center,
                    "Don't worry, you will soon receive a response"
                    " from a management company."),
              ),
              Opacity(
                opacity: 0.08,
                child: SvgPicture.asset(logoBlockChange),
              ),
            ],
          );
        } else {
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                    textAlign: TextAlign.center, "Management company offers"),
              ),

              //

              Column(
                children: companies.items
                    .map((company) => ManagementCompanyCard(
                          company: company,
                        ))
                    .toList(),
              ),
            ],
          );
        }
      },
    );
  }
}

/// Column with company avatar, name, email, contacts
class ManagementCompanyCardTopPart extends StatelessWidget {
  const ManagementCompanyCardTopPart({super.key, required this.company});

  final CompanyModel company;
  static const Gradient gradient = LinearGradient(
    colors: [Colors.pink, Colors.purple],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const AvatarInGradientCircle(
            imagePath: avatarTest,
            size: 45,
            gradient: gradient,
          ),
          trailing: SvgPicture.asset(managementCompanyIcon),
          title: Text(company.name),
          subtitle: Text(company.email),
        ),
        const Divider(),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 25, bottom: 10, top: 10),
          child: ContactsRow(),
        ),
      ],
    );
  }
}

/// Approve and remove buttons of the company card
class _ManagementCompanyCardButtons extends StatelessWidget {
  const _ManagementCompanyCardButtons(
      {required this.company, this.isBottomSheet = false});

  final CompanyModel company;
  final bool isBottomSheet;

  @override
  Widget build(BuildContext context) {
    void onApprove() {
      Provider.of<ApprovedCompanyNotifier>(context, listen: false)
          .addCompany(company);
      if (isBottomSheet) {
        Navigator.of(context).pop();
      }
      context.replace("/approved");
    }

    void onRemove() {
      Provider.of<AllCompaniesNotifier>(context, listen: false).remove(company);
      if (isBottomSheet) {
        Navigator.of(context).pop();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 25, bottom: 10, top: 10),
      child: Row(
        children: [
          Expanded(
              child: FilledButton(
                  onPressed: onApprove, child: const Text("Approve"))),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: OutlinedButton(
                  onPressed: onRemove, child: const Text("Remove"))),
        ],
      ),
    );
  }
}

class ManagementCompanyCard extends StatelessWidget {
  const ManagementCompanyCard({required this.company, super.key});

  final CompanyModel company;

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (context) => Column(mainAxisSize: MainAxisSize.min, children: [
        ManagementCompanyCardTopPart(
          company: company,
        ),
        const Divider(),
        const ListTile(
          title: Text("Company registration number"),
          subtitle: Text("ID"),
        ),
        const SizedBox(
          height: 10,
        ),
        _ManagementCompanyCardButtons(
          company: company,
          isBottomSheet: true,
        ),
        const SizedBox(
          height: 50,
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _showBottomSheet(context);
        },
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: Theme.of(context).dividerColor),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(children: [
                  ManagementCompanyCardTopPart(
                    company: company,
                  ),
                  const Divider(),
                  _ManagementCompanyCardButtons(
                    company: company,
                  ),
                ])),
          ],
        ));
  }
}

class ManagementCompanyCardApproved extends StatelessWidget {
  const ManagementCompanyCardApproved({required this.company, super.key});

  final CompanyModel company;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
            decoration: BoxDecoration(
                border:
                    Border.all(width: 1, color: Theme.of(context).dividerColor),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ManagementCompanyCardTopPart(
                  company: company,
                ),
                const Divider(),
                TextButton(
                    onPressed: () {
                      Provider.of<ApprovedCompanyNotifier>(context,
                              listen: false)
                          .removeCompany();
                      Provider.of<AllCompaniesNotifier>(context, listen: false)
                          .remove(company);
                      context.pop();
                    },
                    child: const Text("Remove")),
                const SizedBox(
                  height: 10,
                ),
              ],
            )),
      ],
    );
  }
}

//permissions for company

class PermissionTile extends StatefulWidget {
  const PermissionTile(
      {required this.title,
      required this.icon,
      required this.isAvailable,
      super.key});

  final String title;
  final Widget icon;
  final bool isAvailable;

  @override
  State<PermissionTile> createState() => _PermissionTileState();
}

class _PermissionTileState extends State<PermissionTile> {
  late bool isAvailable;

  @override
  void initState() {
    isAvailable = widget.isAvailable;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(widget.title),
      secondary: widget.icon,
      value: isAvailable,
      thumbIcon: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return const Icon(Icons.done_outlined);
        }
        return const Icon(Icons.close);
      }),
      onChanged: (bool newValue) {
        if (newValue == false) {
          Provider.of<ApprovedCompanyNotifier>(context, listen: false)
              .removePermission(widget.title);
        } else {
          Provider.of<ApprovedCompanyNotifier>(context, listen: false)
              .addPermission(widget.title);
        }
        setState(() {
          isAvailable = newValue;
        });
      },
    );
  }
}

class PermissionsWidgetList extends StatelessWidget {
  const PermissionsWidgetList({super.key});

  @override
  Widget build(BuildContext context) {
    var permissions =
        Provider.of<ApprovedCompanyNotifier>(context, listen: false)
            .permissions;
    return Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Theme.of(context).dividerColor),
            borderRadius: BorderRadius.circular(15)),
        child: Column(children: [
          for (var permission in committeeOptions.entries)
            PermissionTile(
              title: permission.key,
              icon: SizedBox(
                width: 25,
                height: 25,
                child: permission.value,
              ),
              isAvailable: permissions.contains(permission.key),
            )
        ]));
  }
}

//company parts

/// All [CommitteeCard]s or message that not offers for now
class CommitteeOffers extends StatelessWidget {
  const CommitteeOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AllCommitteeOffersNotifier>(
      builder: (context, committee, child) {
        if (committee.items.isEmpty) {
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                child: Text(
                    textAlign: TextAlign.center,
                    "Don't worry, you will soon receive an answer from home."),
              ),
              Opacity(
                opacity: 0.08,
                child: SvgPicture.asset(logoBlockChange),
              ),
            ],
          );
        } else {
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(textAlign: TextAlign.center, "House committee"),
              ),

              //

              Column(
                children: committee.items
                    .map((committee) => CommitteeCard(
                          committee: committee,
                        ))
                    .toList(),
              ),
            ],
          );
        }
      },
    );
  }
}

/// Approve and remove buttons of the committee card
class _CommitteeCardButtons extends StatelessWidget {
  const _CommitteeCardButtons(
      {required this.committee, this.isBottomSheet = false});

  final CommitteeModel committee;
  final bool isBottomSheet;

  @override
  Widget build(BuildContext context) {
    void onApprove() {
      Provider.of<ApprovedCommitteeNotifier>(context, listen: false)
          .addCommittee(committee);
      if (isBottomSheet) {
        Navigator.of(context).pop();
      }
      context.replace("/approved");
    }

    void onRemove() {
      Provider.of<AllCommitteeOffersNotifier>(context, listen: false)
          .remove(committee);
      if (isBottomSheet) {
        Navigator.of(context).pop();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 25, bottom: 10, top: 10),
      child: Row(
        children: [
          Expanded(
              child: FilledButton(
                  onPressed: onApprove, child: const Text("Approve"))),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: OutlinedButton(
                  onPressed: onRemove, child: const Text("Remove"))),
        ],
      ),
    );
  }
}

/// Column with committee avatar, name, email, contacts
class CommitteeCardTopPart extends StatelessWidget {
  const CommitteeCardTopPart({super.key, required this.committee});

  final CommitteeModel committee;
  static const Gradient gradient = LinearGradient(
    colors: [Color.fromRGBO(255, 220, 95, 1), Color.fromRGBO(245, 166, 29, 1)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const AvatarInGradientCircle(
            imagePath: avatarTest,
            size: 45,
            gradient: gradient,
          ),
          trailing: SvgPicture.asset(committeeIcon),
          title: Text(committee.name),
          subtitle: Text(committee.email),
        ),
        const Divider(),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 25, bottom: 10, top: 10),
          child: ContactsRow(),
        ),
      ],
    );
  }
}

class CommitteeCard extends StatelessWidget {
  const CommitteeCard({required this.committee, super.key});

  final CommitteeModel committee;

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (context) => Column(mainAxisSize: MainAxisSize.min, children: [
        CommitteeCardTopPart(
          committee: committee,
        ),
        const Divider(),
        const ListTile(
          title: Text("Committee registration number"),
          subtitle: Text("ID"),
        ),
        const SizedBox(
          height: 10,
        ),
        _CommitteeCardButtons(
          committee: committee,
          isBottomSheet: true,
        ),
        const SizedBox(
          height: 50,
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _showBottomSheet(context);
        },
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: Theme.of(context).dividerColor),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(children: [
                  CommitteeCardTopPart(
                    committee: committee,
                  ),
                  const Divider(),
                  _CommitteeCardButtons(
                    committee: committee,
                  ),
                ])),
          ],
        ));
  }
}

class CommitteeCardApproved extends StatelessWidget {
  const CommitteeCardApproved({required this.committee, super.key});

  final CommitteeModel committee;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
            decoration: BoxDecoration(
                border:
                    Border.all(width: 1, color: Theme.of(context).dividerColor),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommitteeCardTopPart(
                  committee: committee,
                ),
                const Divider(),
                TextButton(
                    onPressed: () {
                      Provider.of<ApprovedCommitteeNotifier>(context,
                              listen: false)
                          .removeCommittee();
                      Provider.of<AllCommitteeOffersNotifier>(context,
                              listen: false)
                          .remove(committee);
                      context.pop();
                    },
                    child: const Text("Remove")),
                const SizedBox(
                  height: 10,
                ),
              ],
            )),
      ],
    );
  }
}

//

class PermissionTileCompanyScreen extends StatefulWidget {
  const PermissionTileCompanyScreen(
      {required this.title,
      required this.icon,
      required this.isAvailable,
      super.key});

  final String title;
  final Widget icon;
  final bool isAvailable;

  @override
  State<PermissionTileCompanyScreen> createState() =>
      _PermissionTileCompanyScreenState();
}

class _PermissionTileCompanyScreenState
    extends State<PermissionTileCompanyScreen> {
  late bool isAvailable;

  @override
  void initState() {
    isAvailable = widget.isAvailable;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.title),
      secondary: widget.icon,
      value: isAvailable,
      onChanged: (bool? newValue) {
        if (newValue == false) {
          Provider.of<ApprovedCommitteeNotifier>(context, listen: false)
              .removePermission(widget.title);
        } else {
          Provider.of<ApprovedCommitteeNotifier>(context, listen: false)
              .addPermission(widget.title);
        }
        setState(() {
          isAvailable = newValue!;
        });
      },
    );
  }
}

class PermissionsWidgetListCompanyScreen extends StatelessWidget {
  const PermissionsWidgetListCompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var permissions =
        Provider.of<ApprovedCommitteeNotifier>(context, listen: false)
            .permissions;
    return Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Theme.of(context).dividerColor),
            borderRadius: BorderRadius.circular(15)),
        child: Column(children: [
          for (var permission in companyOptions.entries)
            PermissionTileCompanyScreen(
              title: permission.key,
              icon: SizedBox(
                width: 25,
                height: 25,
                child: permission.value,
              ),
              isAvailable: permissions.contains(permission.key),
            )
        ]));
  }
}
