import 'package:flutter/material.dart';
import 'package:ride_share/models/themes.dart';

class Themes {
  // This is the theme class where all the theme colors are defined.
  Themes();

  ThemeModel defaultTheme = ThemeModel(
    white: const Color.fromRGBO(255, 255, 255, 1),
    primaryColor: const Color.fromRGBO(17, 17, 17, 1),
    gray: const Color.fromRGBO(90, 90, 90, 1),
    gray1: const Color.fromRGBO(91, 91, 91, 1),
    gray2: const Color.fromRGBO(121, 121, 121, 1),
    dividerGray: const Color.fromRGBO(237, 237, 237, 1),
    black: const Color.fromRGBO(0, 0, 0, 1),
    goldenYellow: const Color.fromRGBO(255, 190, 22, 1),
  );
}
