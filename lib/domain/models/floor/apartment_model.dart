class ApartmentModel {
  String numberTheApartment = '1';
  String countOfRooms = '1';

  ApartmentModel(this.numberTheApartment, this.countOfRooms);

  @override
  String toString() {
    return "$numberTheApartment:$countOfRooms";
  }
}
