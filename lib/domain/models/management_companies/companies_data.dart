import 'dart:collection';

import 'package:flutter/cupertino.dart';

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
  bool _isApproved = false;

  UnmodifiableListView<CompanyModel> get items =>
      UnmodifiableListView(_companies);

  bool get isApproved => _isApproved;

  void add(CompanyModel item) {
    _companies.add(item);
    notifyListeners();
  }

  void approve() {
    _isApproved = true;
    notifyListeners();
  }
}
