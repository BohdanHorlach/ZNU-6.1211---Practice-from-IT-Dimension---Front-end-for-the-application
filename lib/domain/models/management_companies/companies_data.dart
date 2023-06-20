import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/main_screen/main_screen_widgets/all_menu_options.dart';

class CompanyModel {
  const CompanyModel({required this.name, required this.email});

  final String name;
  final String email;
//photo
//whats up
//phone number
//Company registration number
//ID
}

class AllCompaniesModel extends ChangeNotifier {
  final List<CompanyModel> _companies = [];

  UnmodifiableListView<CompanyModel> get items =>
      UnmodifiableListView(_companies);

  void add(CompanyModel item) {
    _companies.add(item);
    notifyListeners();
  }

  void remove(CompanyModel item) {
    _companies.remove(item);
    notifyListeners();
  }
}


class ApprovedCompany extends ChangeNotifier {
  CompanyModel? company;
  Map<Widget, bool>? _permissions;

  bool get isApprovedCompany => company != null;

  UnmodifiableMapView<Widget, bool> get permissions =>
      UnmodifiableMapView(_permissions!);

  void addCompany(CompanyModel newCompany) {
    company = newCompany;
    _permissions = {for (var widget in mainMenuOptions) widget: true};
    notifyListeners();
  }

  void removeCompany() {
    company = null;
    _permissions = null;
    notifyListeners();
  }
}
