import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:znu_flutter_it_dimension/presentation/main_menu/menu_options/building_management/widgets/parts.dart';

import '../../../../domain/models/management_companies/committees_data.dart';
import '../../../../domain/models/management_companies/companies_data.dart';

// screens for admin

class BuildingManagementScreenCommittee extends StatefulWidget {
  const BuildingManagementScreenCommittee({super.key});

  @override
  State<BuildingManagementScreenCommittee> createState() =>
      BuildingManagementScreenCommitteeState();
}

class BuildingManagementScreenCommitteeState
    extends State<BuildingManagementScreenCommittee> {
  static const mainColor = Color.fromRGBO(0, 68, 148, 1);

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  String? _validateEmail(value) {
    if (value == null || value.isEmpty) {
      return "Please enter an email";
    } else if (!EmailValidator.validate(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  void addCompanyFromForm() {
    if (_formKey.currentState!.validate()) {
      Provider.of<AllCompaniesNotifier>(context, listen: false)
          .add(CompanyModel(name: "Test name", email: emailController.text));
      emailController.clear();
      FocusScope.of(context).unfocus();
    }
  }

  void addCompany(companyData) {
    if (companyData case {'name': String name, 'email': String email}) {
      Provider.of<AllCompaniesNotifier>(context, listen: false)
          .add(CompanyModel(name: name, email: email));
    }
  }

  @override
  initState() {
    super.initState();
    getCompanies();
  }

  Future<void> getCompanies() async {
    await Future.delayed(const Duration(seconds: 5));
    final response =
        await http.get(Uri.parse('http://192.168.0.107/data.json'));
    if (response.statusCode == 200) {
      for (var companyData in jsonDecode(response.body)) {
        addCompany(companyData);
      }
    } else {
      debugPrint('Failed to load data');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
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
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                context.pop();
              },
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
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        //focusNode: _focusNode,
                        controller: emailController,
                        validator: _validateEmail,
                        decoration: const InputDecoration(
                            labelText: 'Management company email',
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                            onPressed: addCompanyFromForm,
                            child: const Text('Send an invitation')),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Divider(),
                const CompanyOffers(),
              ],
            ), //),
            //],
          ),
        ),
      ),
    );
  }
}

class CommitteeApprovedScreen extends StatefulWidget {
  const CommitteeApprovedScreen({super.key});

  @override
  State<CommitteeApprovedScreen> createState() =>
      CommitteeApprovedScreenState();
}

class CommitteeApprovedScreenState extends State<CommitteeApprovedScreen> {
  static const mainColor = Color.fromRGBO(0, 68, 148, 1);

  //late final Map<Widget, bool> permissions;
  late final CompanyModel company;

  @override
  void initState() {
    // permissions =
    //     Provider.of<ApprovedCompany>(context, listen: false).permissions;
    company =
        Provider.of<ApprovedCompanyNotifier>(context, listen: false).company!;
    super.initState();
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
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                context.pop();
              },
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
                const Text('Management company',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                ManagementCompanyCardApproved(
                  company: company,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Divider(),
                const Text(
                  "Permissions",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                const PermissionsWidgetList(),
              ],
            ), //),
            //],
          ),
        ),
      ),
    );
  }
}

// screens for management company

class BuildingManagementScreenCompany extends StatefulWidget {
  const BuildingManagementScreenCompany({super.key});

  @override
  State<BuildingManagementScreenCompany> createState() =>
      BuildingManagementScreenCompanyState();
}

class BuildingManagementScreenCompanyState
    extends State<BuildingManagementScreenCompany> {
  static const mainColor = Color.fromRGBO(0, 68, 148, 1);

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  String? _validateEmail(value) {
    if (value == null || value.isEmpty) {
      return "Please enter an email";
    } else if (!EmailValidator.validate(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  void addCommitteeFromForm() {
    if (_formKey.currentState!.validate()) {
      Provider.of<AllCommitteeOffersNotifier>(context, listen: false).add(
          CommitteeModel(name: "Committee Name", email: emailController.text));
      emailController.clear();
      FocusScope.of(context).unfocus();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
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
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                context.pop();
              },
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
                const Text('Send an invitation to the house committee',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 25,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        //focusNode: _focusNode,
                        controller: emailController,
                        validator: _validateEmail,
                        decoration: const InputDecoration(
                            labelText: 'E-mail of the house committee',
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                            onPressed: addCommitteeFromForm,
                            child: const Text('Send an invitation')),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Divider(),
                const CommitteeOffers(),
              ],
            ), //),
            //],
          ),
        ),
      ),
    );
  }
}

class CompanyApprovedScreen extends StatefulWidget {
  const CompanyApprovedScreen({super.key});

  @override
  State<CompanyApprovedScreen> createState() => CompanyApprovedScreenState();
}

class CompanyApprovedScreenState extends State<CompanyApprovedScreen> {
  static const mainColor = Color.fromRGBO(0, 68, 148, 1);

  late final CommitteeModel committee;

  @override
  void initState() {
    committee = Provider.of<ApprovedCommitteeNotifier>(context, listen: false)
        .committee!;
    super.initState();
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
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                context.pop();
              },
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
                const Text('House committee',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                CommitteeCardApproved(
                  committee: committee,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Divider(),
                const Text(
                  "Permissions",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                const PermissionsWidgetListCompanyScreen(),
              ],
            ), //),
            //],
          ),
        ),
      ),
    );
  }
}
