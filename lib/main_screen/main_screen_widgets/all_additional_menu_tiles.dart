import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../assets_path.dart';
import 'additional_menu_tile.dart';

class MainTile extends StatelessWidget {
  const MainTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuTile(icon: Icon(Icons.home_outlined), title: 'Main');
  }
}

class MyPropertiesTile extends StatelessWidget {
  const MyPropertiesTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuTile(
        icon: Icon(Icons.home_work_outlined), title: 'My Properties');
  }
}

class BuildingDataTile extends StatelessWidget {
  const BuildingDataTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuTile(
        icon: SvgPicture.asset(clockArrowGearIcon), title: 'Building Data');
  }
}

class InstructionsTile extends StatelessWidget {
  const InstructionsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuTile(
        icon: Icon(Icons.list_alt_outlined), title: 'Instructions');
  }
}

class ContactUsTile extends StatelessWidget {
  const ContactUsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuTile(
        icon: SvgPicture.asset(questionCircleIcon), title: 'Contact Us');
  }
}

class WhatsAppTile extends StatelessWidget {
  const WhatsAppTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuTile(icon: SvgPicture.asset(phoneCircleIcon), title: 'WhatsApp');
  }
}
