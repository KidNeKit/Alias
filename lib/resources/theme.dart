import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
  backgroundColor: lightGrey,
  primaryColor: deepGrey,
  cardColor: sandColor,
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
  color: goldColor,
  fontWeight: FontWeight.bold,
  fontSize: 40.0,
  fontFamily: 'Signika_Negative',
);

TextStyle labelMedium = TextStyle(
  color: goldColor,
  fontWeight: FontWeight.bold,
  fontSize: 30.0,
  fontFamily: 'Signika_Negative',
);

TextStyle labelSmall = TextStyle(
  color: goldColor,
  fontWeight: FontWeight.bold,
  fontSize: 20.0,
  fontFamily: 'Signika_Negative',
);

ButtonStyle buttonStyle = ElevatedButton.styleFrom(
  backgroundColor: deepGrey,
  minimumSize: const Size.fromHeight(50.0),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(50.0),
  ),
);
