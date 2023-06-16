import 'package:flutter/material.dart';

class ChangeHouse extends StatefulWidget {
  const ChangeHouse({super.key});

  @override
  State<ChangeHouse> createState() => ChangeHouseState();
}

class ChangeHouseState extends State<ChangeHouse> {
  List<Apartment> listApartment = [
    Apartment(numberOfApartment: 1),
    Apartment(numberOfApartment: 2),
    Apartment(numberOfApartment: 3)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: listApartment.length,
        itemBuilder: (BuildContext context, index) {
          return ListTile(
            title: listApartment[index],
          );
        },
      ),
      /*ListView(
        children: [
          const Padding(
              padding: EdgeInsets.only(top: 60, left: 30, bottom: 10),
              child: Text('Building defenitions',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))),
          Container(
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            width: 100,
            height: 150,
            child: ,
          ),
        ],
      ),*/
    );
  }
}

// ignore: must_be_immutable
class Apartment extends StatelessWidget {
  int numberOfApartment = 1;

  Apartment({super.key, required this.numberOfApartment});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Container(
            height: 50,
            width: 50,
            color: Color.fromARGB(255, 193, 234, 252),
            child: Center(child: Text('$numberOfApartment'))));
  }
}

// ignore: must_be_immutable
class Floor extends StatefulWidget {
  List<Apartment> listApartment = [Apartment(numberOfApartment: 1)];
  Floor({super.key});

  @override
  State<Floor> createState() => _FloorState();
}

class _FloorState extends State<Floor> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.listApartment.length,
      itemBuilder: (BuildContext context, index) {
        return ListTile(
          title: widget.listApartment[index],
        );
      },
    );
  }
}
