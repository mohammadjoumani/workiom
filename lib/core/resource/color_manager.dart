import 'package:flutter/material.dart';

class ColorManager {
  static const Color colorPrimary = Color(0xff4E86F7);

  static const Color colorSecondary = Color(0XFFF7A61E);

  static const Color colorDisable = Color(0XFFB5B5B5);

  static const Color colorBackground = Color(0XFFFFFFFF);

  // Color White
  static const Color colorWhite1 = Color(0XFFFFFFFF);
  static const Color colorWhite2 = Color(0XFFF4F4F4);

  // Color Grey
  static const Color colorGrey1 = Color(0XFFB8B8B8);
  static const Color colorGrey2 = Color(0XFF838589);
  static const Color colorGrey3 = Color(0XFFEDEDED);
  static const Color colorGrey4 = Color(0XFFC4C5C4);

  // Color Black
  static const Color colorBlack1 = Color(0XFF0E0F12); //UI/Typography/Primary
  static const Color colorBlack2 = Color(0XFF555555); //UI/Typography/Secondary

  static const Color colorRed = Color(0xffff0000);

  static const genericBoxShadow = BoxShadow(
    color: Color(0x14000000),
    blurRadius: 10,
    offset: Offset(0, 2),
    spreadRadius: 0,
  );

  static BoxShadow customShadow(double blurRadius) {
    return BoxShadow(
      color: const Color(0x14000000),
      blurRadius: blurRadius,
      offset: const Offset(0, 2),
      spreadRadius: 0,
    );
  }

// static const MaterialColor primarySwatch = MaterialColor(
//   0xFFffffff,
//   <int, Color>{
//     50: Color(0xFFffffff),
//     100: Color(0xFFffffff),
//     200: Color(0xFFffffff),
//     300: Color(0xFFffffff),
//     400: Color(0xFFffffff),
//     500: Color(0xFFffffff),
//     600: Color(0xFFffffff),
//     700: Color(0xFFffffff),
//     800: Color(0xFFffffff),
//     900: Color(0xFFffffff),
//   },
// );
}
