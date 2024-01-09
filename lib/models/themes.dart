import 'dart:ui';

class ThemeModel {
  // This is the theme class where all the theme colors are defined.
  ThemeModel(
      {required this.white,
      required this.primaryColor,
      required this.gray,
      required this.black,
      required this.gray1,
      required this.dividerGray,
      required this.gray2,
      required this.goldenYellow});

  Color white;
  Color primaryColor;
  Color gray;
  Color gray1;
  Color black;
  Color dividerGray;
  Color gray2;
  Color goldenYellow;
}
