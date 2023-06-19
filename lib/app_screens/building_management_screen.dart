import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_screens/widgets/management_company_card.dart';

// void addCompany() {
//   setState(() {
//     companyOffers.addAll({"name": "Adam"});
//   });
//   debugPrint(companyOffers.length as String?);
// }

class BuildingManagementScreen extends StatefulWidget {
  const BuildingManagementScreen({super.key});

  //Map<String, String> companyOffers;

  @override
  State<BuildingManagementScreen> createState() =>
      BuildingManagementScreenState();
}

class BuildingManagementScreenState extends State<BuildingManagementScreen> {
  static const mainColor = Color.fromRGBO(0, 68, 148, 1);

  late Map<String, String> companyOffers;

  void addCompany() {
    setState(() {
      companyOffers.addAll({"name": "Adam"});
    });
    debugPrint(companyOffers.length as String?);
  }

  @override
  void initState() {
    super.initState();
    companyOffers = {};
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
          appBarTheme: const AppBarTheme(
              foregroundColor: Colors.white,
              backgroundColor: mainColor,
              centerTitle: true)),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            //leadingWidth: 70,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
            title: const Text(
              'Building management',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            actions: const [
              Icon(
                Icons.home_work_outlined,
              ),
              SizedBox(
                width: 15,
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: ListView(
              children: <Widget>[
                const SizedBox(
                  height: 25,
                ),
                const Text('Send an invitation to the company',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 25,
                ),
                const TextField(
                  decoration: InputDecoration(
                      labelText: 'Management company email',
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 25,
                ),
                FilledButton(
                    onPressed: addCompany,
                    child: const Text('Send an invitation')),
                const SizedBox(
                  height: 25,
                ),
                const Divider(),
                CompanyOffers(companyOffers: companyOffers),
              ],
            ),
            //),
            //],
          ),
        ),
      ),
    );
  }
}
