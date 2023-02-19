import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  textTheme: TextTheme(
    labelLarge: labelLarge,
    labelMedium: labelMedium,
    labelSmall: labelSmall,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: buttonStyle,
  ),
);

TextStyle labelLarge = TextStyle(
  color: lightColor,
  fontWeight: FontWeight.bold,
  fontSize: 40.0,
);

TextStyle labelMedium = TextStyle(
  color: lightColor,
  fontWeight: FontWeight.bold,
  fontSize: 30.0,
);

TextStyle labelSmall = TextStyle(
  color: lightColor,
  fontWeight: FontWeight.bold,
  fontSize: 20.0,
);

ButtonStyle buttonStyle = ElevatedButton.styleFrom(
  backgroundColor: primaryColor,
  minimumSize: const Size.fromHeight(50.0),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(50.0),
  ),
);
