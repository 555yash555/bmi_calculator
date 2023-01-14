import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'inputpage.dart';
import 'resultpage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: screenbackground_color,
          primaryColor: screenbackground_color,
          appBarTheme: AppBarTheme(
            color: screenbackground_color,
          )),
      initialRoute: "/",
      routes: {
        "/": (context) => InputPage(),
        "/result": (context) => result(),
      },
    );
  }
}
