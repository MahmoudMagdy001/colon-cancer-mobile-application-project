import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../styles/colors.dart';

final lightmode = ThemeData(
  primarySwatch: primaryColor,
  scaffoldBackgroundColor: backGroundColor,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    toolbarHeight: 65,
    titleSpacing: 20.0,
    backgroundColor: Colors.white,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: allColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: allColor,
    unselectedItemColor: Colors.black54,
    elevation: 30.0,
    backgroundColor: Colors.white,
  ),
);
