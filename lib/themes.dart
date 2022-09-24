import 'package:flutter/material.dart';
import 'package:queen_slim/utils/index.dart';

final baseLightTheme = ThemeData.light();
final baseDarkTheme = ThemeData.dark();

MaterialColor lightPrimarySwatch = createMaterialColor(const Color(0xFF2196f3));
MaterialColor darkPrimarySwatch = createMaterialColor(const Color(0xFFffffff));

final lightTheme = ThemeData(
  primarySwatch: lightPrimarySwatch,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFFEFEFE),
  primaryColor: const Color(0xFF3D70F6),
  disabledColor: const Color(0xFFF5F5F5),
  fontFamily: 'GoogleSans',
  textTheme: baseLightTheme.textTheme,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: const Color(0xFF202020),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(),
  ),
)..extend(QueenTheme(color: QueenColor(), layout: QueenLayout(), style: QueenStyle()));

final darkTheme = ThemeData(
  primarySwatch: darkPrimarySwatch,
  brightness: Brightness.dark,
  backgroundColor: Colors.black,
  textTheme: baseDarkTheme.textTheme,
)..extend(QueenTheme(color: QueenColor(), layout: QueenLayout(), style: QueenStyle()));
