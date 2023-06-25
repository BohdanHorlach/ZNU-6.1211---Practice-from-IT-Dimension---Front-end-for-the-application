import 'package:flutter/material.dart';
import 'package:znu_flutter_it_dimension/domain/user/user_data.dart';
import 'package:znu_flutter_it_dimension/presentation/main_menu/additional_menu/widgets/all_additional_menu_tiles.dart';

List<Widget> managerAdditionalMenuTiles = [
  const MainTile(),
  const MyPropertiesTile(),
  const BuildingDataTile(),
  const InstructionsTile(),
  const ContactUsTile(),
  const WhatsAppTile(),
];

List<Widget> tenantAdditionalMenuTiles = [
  const MainTile(),
  const MyPropertiesTile(),
  const InstructionsTile(),
  const ContactUsTile(),
  const WhatsAppTile(),
];

List<Widget> workerAdditionalMenuTiles = [
  const MainTile(),
  const InstructionsTile(),
  const ContactUsTile(),
  const WhatsAppTile(),
];

class AdditionalMenu extends StatelessWidget {
  const AdditionalMenu({required this.userType, super.key});

  final UserType userType;

  static const mainColor = Color.fromRGBO(241, 242, 252, 1);

  @override
  Widget build(BuildContext context) {
    final List<Widget> menuTiles;
    if (userType == UserType.houseManager || userType == UserType.company) {
      menuTiles = managerAdditionalMenuTiles;
    } else if (userType == UserType.resident) {
      menuTiles = tenantAdditionalMenuTiles;
    } else {
      menuTiles = workerAdditionalMenuTiles;
    }
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        toolbarHeight: 80,
        leadingWidth: 70,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: ListView(
          children: menuTiles,
        ),
      ),
    );
  }
}

