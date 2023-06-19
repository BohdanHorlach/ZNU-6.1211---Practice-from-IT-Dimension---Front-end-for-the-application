import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../main_screen/assets_path.dart';

class CompanyOffers extends StatelessWidget {
  const CompanyOffers({required this.companyOffers, super.key});

  final Map<String, String> companyOffers;

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
      return const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5, bottom: 20),
            child:
                Text(textAlign: TextAlign.center, "Management company offers"),
          ),
          //
          ManagementCompanyCard(name: "Name", email: "email"),
        ],
      );
    }
  }
}

class ManagementCompanyCard extends StatelessWidget {
  const ManagementCompanyCard(
      {required this.name, required this.email, super.key});

  final String name;
  final String email;

  //final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
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
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 25, bottom: 10, top: 10),
            child: Row(
              children: [
                Text("Contacts"),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.pin_end),
                      Icon(Icons.pin_end),
                      Icon(Icons.pin_end),
                      Icon(Icons.pin_end),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 25, bottom: 10, top: 10),
            child: Row(
              children: [
                Expanded(
                    child: FilledButton(
                        onPressed: () {}, child: const Text("data"))),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: OutlinedButton(
                        onPressed: () {}, child: const Text("data"))),
              ],
            ),
          )
        ],
      ),
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
