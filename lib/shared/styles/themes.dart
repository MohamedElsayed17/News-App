import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    headline6: TextStyle(
      color: Colors.black,
    ),
    subtitle1: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    subtitle2: TextStyle(
      color: Colors.grey[500],
    ),
  ),
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    backgroundColor: Colors.white,
    titleSpacing: 8.0,
    iconTheme: IconThemeData(color: Colors.black),
    brightness: Brightness.dark,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
  ),
);

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: Colors.grey[900],
  textTheme: TextTheme(
    headline6: TextStyle(
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    subtitle2: TextStyle(
      color: Colors.grey[500],
    ),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    backgroundColor: Colors.grey[900],
    titleSpacing: 8.0,
    iconTheme: IconThemeData(color: Colors.white),
    brightness: Brightness.dark,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.grey[900],
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey[900],
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
  ),
);
