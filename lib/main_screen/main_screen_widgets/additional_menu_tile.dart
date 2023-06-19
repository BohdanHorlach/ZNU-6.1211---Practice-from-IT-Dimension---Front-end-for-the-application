import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {
  const MenuTile({required this.icon, required this.title, super.key});

  static const color = Color.fromRGBO(241, 242, 252, 1);
  static const selectedColor = Color.fromRGBO(219, 226, 249, 1);

  final String title;
  final Widget icon;

  //TODO on tap

  @override
  Widget build(BuildContext context) {
    //return

    //   Column(
    //   children: [
    //     TextButton(
    //       style: TextButton.styleFrom(
    //         shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(30)),
    //         backgroundColor: color,
    //       ),
    //       onPressed: () {
    //         debugPrint("test");
    //       },
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           icon,
    //           Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
    //           const Icon(Icons.arrow_forward),
    //         ],
    //       ),
    //     ),
    //     const SizedBox(
    //       height: 10,
    //     ),
    //   ],
    // );
    //TODO sep
    return Column(
      children: [
        ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          leading: icon,
          title:
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            debugPrint("test");
          },
          //splashColor: selectedColor,
          tileColor: selectedColor,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
