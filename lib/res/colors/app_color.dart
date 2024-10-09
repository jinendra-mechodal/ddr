import 'dart:ui';

import 'package:flutter/material.dart';

class AppColor {
  static const Color blackColor = Color(0xff000000);
  static const Color whiteColor = Color(0xffffffff);

  // New colors
  static const Color color1 = Color(0xff928FA6); // #928FA6
  static const Color color2 = Color(0xff4B5768); // #4B5768
  static const Color color4 = Color(0xff928FA6); // #928FA6
  static const Color color3 = Color(0xff45484D); // #45484D
  static const Color color5 = Color(0xffFFEAFB);
  static const Color color6 = Color(0xff293646);
  static const Color gradientStart = Color(0xff6C266E); // #6C266E
  static const Color gradientMiddle = Color(0xffB34C9D); // #B34C9D
  static const Color gradientEnd = Color(0xffB24D9B); // #B24D9B

  // Linear Gradient
  static LinearGradient get linearGradient => LinearGradient(
    colors: [
      gradientStart.withOpacity(1.0),
      gradientMiddle.withOpacity(1.0),
      gradientEnd.withOpacity(1.0),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
