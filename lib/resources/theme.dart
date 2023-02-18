import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  textTheme: TextTheme(
    labelLarge: labelLarge,
    labelMedium: labelMedium,
    labelSmall: labelSmall,
  ),
);

TextStyle labelLarge = const TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 50.0,
);

TextStyle labelMedium = const TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 40.0,
);

TextStyle labelSmall = const TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 30.0,
);
