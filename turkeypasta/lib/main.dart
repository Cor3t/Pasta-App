import 'package:flutter/material.dart';
import 'package:turkeypasta/config/template.dart';
import 'package:turkeypasta/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Turkey Pasta',
      theme: appTheme,
      home: HomePage(key: key),
    );
  }
}
