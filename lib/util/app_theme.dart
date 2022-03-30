import 'package:flutter/material.dart';

import 'color.dart';

final ThemeData themeData = ThemeData(
  primaryColor: loginColor,
  scaffoldBackgroundColor: page,
  splashColor: Colors.transparent,  //取消水波纹效果
  highlightColor: Colors.transparent, //取消水波纹效果
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: nav,
    selectedItemColor: loginColor,
    selectedIconTheme: IconThemeData(
      size: 28,
    ),
    unselectedIconTheme: IconThemeData(
      size: 24,
    ),
    unselectedItemColor: unactive,
    selectedLabelStyle: TextStyle(
      fontSize: 14,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 12,
    ),
  ),
    tabBarTheme : const TabBarTheme(
        labelColor: loginColor,
        unselectedLabelColor: un3active

    )
);
