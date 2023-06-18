import 'apartment_model.dart';

class FloorModel {
  String typeOfFloor = '';
  List<ApartmentModel> listApartment = [];

  FloorModel(this.listApartment);

  @override
  String toString() {
    String result = "${typeOfFloor}_";
    for (int i = 0; i < listApartment.length; i++) {
      result += listApartment[i].toString();
      result += "_";
    }

    return result;
  }
}
