import 'package:flutter/widgets.dart';
import 'apartment_data.dart';

enum UserType { houseManager, resident, company, serviceProvider }

class UserData with ChangeNotifier {
  UserType _typeOfUser = UserType.resident;
  String _firstAndLastName = '';
  String _email = '';
  String _phone = '';
  bool _status = false;
  ApartmentData _apartmentData = ApartmentData();

  UserType get getTypeUser => _typeOfUser;

  String get getFirstAndLastName => _firstAndLastName;

  String get getEmail => _email;

  String get getPhone => _phone;

  bool get getStatus => _status;

  ApartmentData get getApartmentData => _apartmentData;

  void changeType(UserType newType) {
    _typeOfUser = newType;

    notifyListeners();
  }

  void changeBasedData(String newName, String newEmail, String newPhone) {
    _firstAndLastName = newName;
    _email = newEmail;
    _phone = newPhone;

    notifyListeners();
  }

  void changeStatus(bool newStatus) {
    _status = newStatus;

    notifyListeners();
  }

  void changeApartmentData(ApartmentData newData) {
    _apartmentData = newData;

    notifyListeners();
  }
}
