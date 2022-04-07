import 'package:flutter/material.dart';

String priceSign = "\u20A6";

// colors
const burntOrange = Color(0xFFCC5500);
const textColor = Colors.black;
const Color subHeadColor = Color(0xFF444251);
const darkGrey = Color(0xFF696969);

// theme
var appTheme = ThemeData(
    appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white),
    iconTheme: const IconThemeData(color: textColor, size: 25),
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
        headline1: TextStyle(
            fontWeight: FontWeight.w800, fontSize: 22, color: textColor),
        headline2: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 18, color: textColor),
        headline3: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 19, color: textColor),
        headline4: TextStyle(
            fontWeight: FontWeight.w800, fontSize: 15, color: subHeadColor),
        subtitle1: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w500, color: darkGrey),
        subtitle2: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w500, color: darkGrey),
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
