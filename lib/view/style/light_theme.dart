import 'package:flutter/material.dart';

/// ライトテーマ設定
final liteTheme = ThemeData.light().copyWith(
  primaryColor: Colors.green[300],
  colorScheme: ColorScheme.light(primary: Colors.green[300]!,secondary: Colors.green[500]!,background: Colors.white70),
  appBarTheme: AppBarTheme(backgroundColor: Colors.green[300]),
  chipTheme: ChipThemeData(
    backgroundColor: Colors.grey[100]!,
    selectedColor: Colors.blue[700]!,
    brightness: Brightness.light,
    labelStyle: TextStyle(
      fontSize: 14,
      color: Colors.green[500],
      fontWeight: FontWeight.bold,
    ),
    padding: EdgeInsets.symmetric(horizontal: 4),
    secondarySelectedColor: Colors.green[500]!,
    secondaryLabelStyle: TextStyle(fontSize: 14,
      color: Colors.white,),
    disabledColor: Colors.grey,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.green[300],
    selectedItemColor: Colors.white,
    selectedIconTheme: IconThemeData(
      color: Colors.white,
    ),
    unselectedItemColor: Colors.white70,
    unselectedIconTheme: IconThemeData(
      color: Colors.white70,
    ),
  ),
);
