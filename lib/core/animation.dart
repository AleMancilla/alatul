import 'package:flutter/material.dart';

PageRouteBuilder<dynamic> animationChangingScreen(Widget otherPage,
    {int durationMilliseconds = 800}) {
  return PageRouteBuilder(
    pageBuilder: (_, __, ___) => otherPage,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    transitionDuration: Duration(milliseconds: durationMilliseconds),
  );
}
