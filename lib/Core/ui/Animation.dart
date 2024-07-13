import 'package:flutter/material.dart';

class FadePageTransition extends PageRouteBuilder {
  final Widget page;
  FadePageTransition({required this.page})
      : super(
          pageBuilder: (context, animation, animatinTwo) => page,
          transitionDuration: const Duration(milliseconds: 240),
          transitionsBuilder: (context, animation, animatinTwo, child) {
            return FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
              child: child,
            );
          },
        );
}

class FadeSlidePageTransition extends PageRouteBuilder {
  final Widget page;
  FadeSlidePageTransition({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var curve = Curves.ease;
            var tween =
                Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
            return FadeTransition(
              opacity: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 300),
        );
}
