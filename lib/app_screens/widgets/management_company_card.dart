import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/models/management_companies/companies_data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../main_screen/assets_path.dart';

class CompanyOffers extends StatelessWidget {
  const CompanyOffers({required this.companyOffers, super.key});

  final List<CompanyModel> companyOffers;

  @override
  Widget build(BuildContext context) {
    if (companyOffers.isEmpty) {
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
            child:
                Text(textAlign: TextAlign.center, "Management company offers"),
          ),
          //

          Consumer<AllCompaniesModel>(
              builder: (context, companies, child) => Column(
                    children: companies.items
                        .map((company) => ManagementCompanyCard(
                            name: company.name, email: company.email))
                        .toList(),
                  )),
          // ManagementCompanyCard(name: "Name", email: "email"),
          // ManagementCompanyCard(name: "Name", email: "email"),
          // ManagementCompanyCard(name: "Name", email: "email"),
        ],
      );
    }
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
  const _ManagementCompanyCardTopPart(
      {required this.name, required this.email});

  final String name;
  final String email;

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
          title: Text(name),
          subtitle: Text(email),
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
  const _ManagementCompanyCardButtons();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 25, bottom: 10, top: 10),
      child: Row(
        children: [
          Expanded(
              child:
                  FilledButton(onPressed: () {}, child: const Text("Approve"))),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: OutlinedButton(
                  onPressed: () {}, child: const Text("Remove"))),
        ],
      ),
    );
  }
}

class ManagementCompanyCard extends StatelessWidget {
  const ManagementCompanyCard(
      {required this.name, required this.email, super.key});

  final String name;
  final String email;

  //final String imageUrl;

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (context) => Column(mainAxisSize: MainAxisSize.min, children: [
        _ManagementCompanyCardTopPart(
          name: name,
          email: email,
        ),
        const Divider(),
        const ListTile(
          title: Text("Company registration number"),
          subtitle: Text("ID"),
        ),
        const SizedBox(
          height: 10,
        ),
        const _ManagementCompanyCardButtons(),
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
                    name: name,
                    email: email,
                  ),
                  const Divider(),
                  const _ManagementCompanyCardButtons(),
                ])),
          ],
        ));
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
