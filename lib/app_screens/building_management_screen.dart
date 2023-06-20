import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_screens/widgets/management_company_card.dart';
import 'package:flutter_application_1/domain/models/management_companies/companies_data.dart';
import 'package:provider/provider.dart';

class BuildingManagementScreen extends StatefulWidget {
  const BuildingManagementScreen({super.key});

  @override
  State<BuildingManagementScreen> createState() =>
      BuildingManagementScreenState();
}

class BuildingManagementScreenState extends State<BuildingManagementScreen> {
  static const mainColor = Color.fromRGBO(0, 68, 148, 1);

  //final _companyInvitationFormKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  //late List<CompanyModel> companyOffers;

  String? _validateEmail(value) {
    if (value == null || value.isEmpty) {
      return "Please enter an email";
    } else if (!EmailValidator.validate(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  void addCompany() {
    if (_formKey.currentState!.validate()) {
      Provider.of<AllCompaniesModel>(context, listen: false)
          .add(CompanyModel(name: "Test name", email: emailController.text));
      emailController.clear();
      FocusScope.of(context).unfocus();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   companyOffers =
  //       Provider.of<AllCompaniesModel>(context, listen: false).items;
  // }

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
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: emailController,
                        validator: _validateEmail,
                        decoration: const InputDecoration(
                            labelText: 'Management company email',
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      FilledButton(
                          onPressed: addCompany,
                          child: const Text('Send an invitation')),
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

class ApprovedCompanyScreen extends StatefulWidget {
  const ApprovedCompanyScreen({super.key});

  @override
  State<ApprovedCompanyScreen> createState() => ApprovedCompanyScreenState();
}

class ApprovedCompanyScreenState extends State<ApprovedCompanyScreen> {
  static const mainColor = Color.fromRGBO(0, 68, 148, 1);
  late final Map<Widget, bool> permissions;
  late final CompanyModel company;

  @override
  void initState() {
    permissions =
        Provider.of<ApprovedCompany>(context, listen: false).permissions;
    company = Provider.of<ApprovedCompany>(context, listen: false).company!;
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
                const Text('Management company',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 25,
                ),
                ManagementCompanyCardApproved(
                  company: company,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Divider(),
              ],
            ), //),
            //],
          ),
        ),
      ),
    );
  }
}
