import 'package:flutter/material.dart';

var lightThemeData = ThemeData(
  useMaterial3: true,
  cardColor: Colors.blueGrey[50],
  primaryTextTheme: TextTheme(
    labelLarge: TextStyle(
      color: Colors.blueGrey,
      decorationColor: Colors.blueGrey[300],
    ),
    titleSmall: TextStyle(
      color: Colors.blueGrey[900],
    ),
    titleMedium: const TextStyle(
      color: Colors.black,
    ),
    displayLarge: TextStyle(color: Colors.blueGrey[800]),
  ),
  iconTheme: const IconThemeData(color: Colors.blueGrey),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey).copyWith(
    background: Colors.white,
    brightness: Brightness.light,
  ),
  bottomAppBarTheme: BottomAppBarTheme(color: Colors.blueGrey[900]),
);

var darkThemeData = ThemeData(
  useMaterial3: true,
  cardColor: Colors.black,
  primaryTextTheme: TextTheme(
    labelLarge: TextStyle(
      color: Colors.blueGrey[200],
      decorationColor: Colors.blueGrey[50],
    ),
    titleSmall: const TextStyle(
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      color: Colors.blueGrey[300],
    ),
    displayLarge: const TextStyle(
      color: Colors.white70,
    ),
  ),
  iconTheme: IconThemeData(color: Colors.blueGrey[200]),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey).copyWith(
    background: Colors.blueGrey[900],
    brightness: Brightness.dark,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Colors.black,
  ),
);
