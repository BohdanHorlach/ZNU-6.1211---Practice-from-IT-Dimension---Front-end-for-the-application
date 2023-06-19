import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../app_screens/route.dart';

class MenuOption extends StatelessWidget {
  const MenuOption(
      {required this.title,
      required this.iconRoute,
      required this.borderColor,
      required this.nextScreen,
      this.height,
      this.width,
      super.key});

  final Color borderColor;
  final String iconRoute;
  final String title;
  final double? width;
  final double? height;
  final Widget nextScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).push(createRoute(nextScreen));
          },
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            fixedSize: Size(width ?? 100, height ?? 100),
            side: BorderSide(width: 3, color: borderColor),
            backgroundColor: const Color.fromRGBO(216, 226, 255, 1),
            //foregroundColor: const Color.fromRGBO(0, 26, 65, 0.12),
          ),
          child: SvgPicture.asset(iconRoute),
        ),
        SizedBox(
          height: 40,
          width: width ?? 100,
          child: Center(
            child: Text(
              title,
              softWrap: true,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
