import 'apartment_data.dart';

enum UserType { houseManager, resident, company, serviceProvider }

class UserData {
  UserType typeOfUser = UserType.resident;
  String email = '';
  String phone = '';
  bool status = false;
  ApartmentData apartmentData = ApartmentData();
}
