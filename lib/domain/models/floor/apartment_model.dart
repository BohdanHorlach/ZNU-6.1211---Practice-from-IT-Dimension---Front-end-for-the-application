class ApartmentModel {
  String numberOfApartments = '1';
  String countOfRooms = '1';

  ApartmentModel(this.numberOfApartments, this.countOfRooms);

  @override
  String toString() {
    return "$numberOfApartments:$countOfRooms";
  }
}
