import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/models/management_companies/companies_data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../main_screen/assets_path.dart';
import '../building_management_screen.dart';

class CompanyOffers extends StatelessWidget {
  const CompanyOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AllCompaniesModel>(
      builder: (context, companies, child) {
        if (companies.items.isEmpty) {
          return const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 20),
                child: Text(
                    textAlign: TextAlign.center,
                    "Don't worry, you will soon receive a response from a management company."),
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

              Consumer<AllCompaniesModel>(
                  builder: (context, companies, child) => Column(
                        children: companies.items
                            .map((company) => ManagementCompanyCard(
                                  company: company,
                                ))
                            .toList(),
                      )),
            ],
          );
        }
      },
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

class _ManagementCompanyCardTopPart extends StatelessWidget {
  const _ManagementCompanyCardTopPart({required this.company});

  final CompanyModel company;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const CompanyAvatar(
            imagePath: avatarTest,
            size: 45,
          ),
          trailing: SvgPicture.asset(managementCompanyIcon),
          title: Text(company.name),
          subtitle: Text(company.email),
        ),
        const Divider(),
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 25, bottom: 10, top: 10),
          child: Row(
            children: [
              const Text("Contacts"),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
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
          ),
        ),
      ],
    );
  }
}

class _ManagementCompanyCardButtons extends StatelessWidget {
  const _ManagementCompanyCardButtons(
      {required this.onApprove, required this.onRemove});

  final void Function() onApprove;
  final void Function() onRemove;

  @override
  Widget build(BuildContext context) {
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

  void remove() {}

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (context) => Column(mainAxisSize: MainAxisSize.min, children: [
        _ManagementCompanyCardTopPart(
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
          onApprove: () {
            Provider.of<ApprovedCompany>(context, listen: false)
                .addCompany(company);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const ApprovedCompanyScreen()),
            );
          },
          onRemove: () {
            Provider.of<AllCompaniesModel>(context, listen: false)
                .remove(company);
          },
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
                  _ManagementCompanyCardTopPart(
                    company: company,
                  ),
                  const Divider(),
                  _ManagementCompanyCardButtons(
                    onApprove: () {
                      Provider.of<ApprovedCompany>(context, listen: false)
                          .addCompany(company);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ApprovedCompanyScreen()),
                      );
                    },
                    onRemove: () {
                      Provider.of<AllCompaniesModel>(context, listen: false)
                          .remove(company);
                    },
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
                _ManagementCompanyCardTopPart(
                  company: company,
                ),
                const Divider(),
                TextButton(
                    onPressed: () {
                      Provider.of<ApprovedCompany>(context, listen: false)
                          .removeCompany();
                      Provider.of<AllCompaniesModel>(context, listen: false)
                          .remove(company);
                      Navigator.of(context).pop();
                    },
                    child: const Text("Remove"))
              ],
            )),
      ],
    );
  }
}

class CompanyAvatar extends StatelessWidget {
  final String imagePath;
  final double size;
  static const double borderWidth = 2;
  static const Gradient gradient = LinearGradient(
    colors: [Colors.pink, Colors.purple],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  const CompanyAvatar({required this.imagePath, required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
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
