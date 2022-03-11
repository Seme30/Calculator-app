import 'package:flutter/material.dart';

import './screen/calculator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        appBarTheme: AppBarTheme(
          color: Colors.green,
        ),
        buttonTheme: ButtonThemeData(
          minWidth: 30,
          buttonColor: Colors.amber,
        ),
      ),
      home: CalculatorScreen(),
    );
  }
}
