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

class AllCompaniesNotifier extends ChangeNotifier {
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

class MenuPermission {
  MenuPermission({required this.name, required this.isAvailable});

  final String name;
  final bool isAvailable;
}

class ApprovedCompanyNotifier extends ChangeNotifier {
  CompanyModel? company;

  Set<String> _permissions = {};

  bool get isApprovedCompany => company != null;

  UnmodifiableSetView<String> get permissions =>
      UnmodifiableSetView(_permissions);

  void addCompany(CompanyModel newCompany) {
    company = newCompany;
    _permissions = {...committeeOptions.keys};
    notifyListeners();
  }

  void removeCompany() {
    company = null;
    _permissions.clear();
    notifyListeners();
  }

  void addPermission(String permission) {
    _permissions.add(permission);
    notifyListeners();
  }

  bool isPermission(String permission) {
    return _permissions.contains(permission);
  }

  void removePermission(String permission) {
    _permissions.remove(permission);
    notifyListeners();
  }
}
