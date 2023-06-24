import 'package:flutter/cupertino.dart';

Route createRouteHorizontalSlide(Widget routeTo, {String? routeName}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => routeTo,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
    settings: routeName != null ? RouteSettings(name: routeName) : null,
  );
}
