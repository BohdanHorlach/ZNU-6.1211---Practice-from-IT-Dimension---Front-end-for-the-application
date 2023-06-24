import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../../../presentation/main_menu/widgets/all_menu_options.dart';

class CommitteeModel {
  const CommitteeModel({required this.name, required this.email});

  final String name;
  final String email;
//photo
//whats up
//phone number
//Company registration number
//ID
}

class AllCommitteeOffersNotifier extends ChangeNotifier {
  final List<CommitteeModel> _committees = [];

  UnmodifiableListView<CommitteeModel> get items =>
      UnmodifiableListView(_committees);

  void add(CommitteeModel item) {
    _committees.add(item);
    notifyListeners();
  }

  void remove(CommitteeModel item) {
    _committees.remove(item);
    notifyListeners();
  }
}

class ApprovedCommitteeNotifier extends ChangeNotifier {
  CommitteeModel? committee;
  Set<String> _usedPermissions = {"Building Management"};

  bool get isApprovedCommittee => committee != null;

  UnmodifiableSetView<String> get permissions =>
      UnmodifiableSetView(_usedPermissions);

  void addCommittee(CommitteeModel newCommittee) {
    committee = newCommittee;
    _usedPermissions = {...committeeOptions.keys};
    notifyListeners();
  }

  void removeCommittee() {
    committee = null;
    _usedPermissions = {"Building Management"};
    notifyListeners();
  }

  void addPermission(String permission) {
    _usedPermissions.add(permission);
    notifyListeners();
  }

  bool isPermission(String permission) {
    return _usedPermissions.contains(permission);
  }

  void removePermission(String permission) {
    _usedPermissions.remove(permission);
    notifyListeners();
  }
}
