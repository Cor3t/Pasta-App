import 'package:flutter/material.dart';

String priceSign = "\u20A6";

// colors
const burntOrange = Color(0xFFCC5500);
const textColor = Color(0xFF444251);
const subHeadColor = Colors.grey;

// theme
var appTheme = ThemeData(
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white),
    iconTheme: const IconThemeData(color: textColor, size: 25),
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
        headline1: TextStyle(
            fontWeight: FontWeight.w800, fontSize: 25, color: textColor),
        headline2: TextStyle(
            fontWeight: FontWeight.w800, fontSize: 20, color: textColor),
        headline3: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 16,
            color: Color(0xFF444343)),
        headline4: TextStyle(
            fontWeight: FontWeight.w800, fontSize: 15, color: subHeadColor),
        subtitle1: TextStyle(fontSize: 15, color: subHeadColor),
        bodyText2: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 16,
            color: Color(0xFF444343)),
        caption: TextStyle(
          color: burntOrange,
          fontWeight: FontWeight.w800,
          fontSize: 12,
        )));

var buttonTextStyle1 = const TextStyle(
  fontWeight: FontWeight.w400,
  color: Colors.white,
);

var buttonTextStyle2 = const TextStyle(
  fontWeight: FontWeight.w800,
  color: Colors.white,
);

var cartBadgeTextStyle = const TextStyle(color: Colors.white, fontSize: 14);

double pcent(double size, double p) {
  double result = (size / 100) * p;
  return result;
}
