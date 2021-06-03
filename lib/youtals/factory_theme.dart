import 'package:flutter/material.dart';

class Factory {
  //المثواد الخاصة لتغير والتحكم بالوان البرنامج
  static ThemeData light() {
    var buttonThemeData = ButtonThemeData(buttonColor: Colors.purple);
    return ThemeData(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        accentColor: Colors.purpleAccent,
        primaryColor: Colors.purple,
        primarySwatch: Colors.purple,
        buttonTheme: buttonThemeData);
  }

  static ThemeData dark() {
    var buttonThemeData = ButtonThemeData(buttonColor: Colors.red);
    return ThemeData(
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
        accentColor: Colors.redAccent,
        primaryColor: Colors.red,
        primarySwatch: Colors.red,
        buttonTheme: buttonThemeData);
  }
}
