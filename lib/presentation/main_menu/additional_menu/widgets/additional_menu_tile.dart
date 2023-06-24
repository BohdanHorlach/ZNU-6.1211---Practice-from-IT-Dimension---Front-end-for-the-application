import 'package:flutter/material.dart';


class MenuTile extends StatefulWidget{
  const MenuTile({required this.icon, required this.title, this.isActive = false, super.key});

  final String title;
  final Widget icon;
  final bool isActive;

  @override
  State<MenuTile> createState() =>
      MenuTileState();
}

class MenuTileState extends State<MenuTile> {
  //const MenuTile({required this.icon, required this.title, super.key});

  static const color = Color.fromRGBO(241, 242, 252, 1);
  static const selectedColor = Color.fromRGBO(219, 226, 249, 1);
  late bool isActive;
  late bool isEnable;

  @override
  void initState() {
    isActive = widget.isActive;
    super.initState();
  }



  //TODO on tap

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          selected: isActive,
          selectedTileColor: selectedColor,
          selectedColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          leading: widget.icon,
          title:
              Text(widget.title, style: const TextStyle(fontWeight: FontWeight.w600)),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            debugPrint("test");
            setState(() {
              isActive=true;
            });
          },
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
