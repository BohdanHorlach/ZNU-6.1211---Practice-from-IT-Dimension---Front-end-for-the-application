import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/models/floor/apartment_model.dart';
import 'package:flutter_application_1/domain/models/floor/floor_model.dart';
import '../../sign_up/house_manager/edit_floor.dart';

// ignore: must_be_immutable
class FloorInfo extends StatefulWidget {
  FloorModel floor = FloorModel([
    ApartmentModel('0', '1'),
  ]);
  FloorInfo({super.key});

  @override
  State<FloorInfo> createState() => _FloorInfoState();
}

class _FloorInfoState extends State<FloorInfo> {
  void _changeState(FloorModel object) {
    setState(() {
      widget.floor = object;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(50))),
            height: 50,
            width: 50,
            child: IconButton(
                iconSize: 20,
                onPressed: () async {
                  FloorModel temp = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditFloor(thisFloor: widget.floor),
                    ),
                  );
                  _changeState(temp);
                },
                icon: const Icon(Icons.create, color: Colors.black)),
          ),
          ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            reverse: true,
            itemCount: widget.floor.listApartment.length,
            itemBuilder: (context, index) {
              return Card(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width *
                      (1 / (widget.floor.listApartment.length * 2)),
                  child: Center(
                    child: Text(
                        widget.floor.listApartment[index].numberTheApartment),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
