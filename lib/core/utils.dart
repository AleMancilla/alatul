import 'package:flutter/material.dart';

Color getColorById(int i) {
  switch (i) {
    case 1:
      return const Color.fromARGB(255, 51, 133, 255);
    case 2:
      return const Color.fromARGB(255, 255, 235, 51);
    case 3:
      return const Color.fromARGB(255, 255, 51, 167);
    case 4:
      return const Color.fromARGB(255, 51, 255, 116);
    case 5:
      return const Color.fromARGB(255, 177, 132, 55);
    case 6:
      return const Color.fromARGB(255, 255, 51, 51);
    case 7:
      return const Color.fromARGB(255, 51, 184, 255);
    case 8:
      return const Color.fromARGB(255, 51, 224, 255);
    case 9:
      return const Color.fromARGB(255, 255, 146, 51);
    case 10:
      return const Color(0xFF3366FF);
    default:
      return const Color(0xFF3366FF);
  }
}
