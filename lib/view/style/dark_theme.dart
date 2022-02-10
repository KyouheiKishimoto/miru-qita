import 'package:flutter/material.dart';

/// ダークテーマ設定
final darkTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.grey[800],
  androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
  chipTheme: ChipThemeData(
    backgroundColor: Colors.grey,
    selectedColor: Colors.green[300]!,
    brightness: Brightness.dark,
    labelStyle: TextStyle(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    padding: EdgeInsets.symmetric(horizontal: 4),
    secondarySelectedColor: Colors.green[300]!,
    secondaryLabelStyle: TextStyle(
      fontSize: 14,
      color: Colors.white,
    ),
    disabledColor: Colors.grey,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.green[300],
    selectedLabelStyle: TextStyle(color: Colors.green[300]),
  ),
);
