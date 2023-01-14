import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class genderbutton extends StatelessWidget {
  String gender;
  IconData icon;
  genderbutton(this.gender, this.icon);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.only(top: 30),
        child: Icon(
          icon,
          size: size_of_icon,
        ),
      ),
      SizedBox(
        height: size_ofsizzedbox_ingenderbutton,
      ),
      Text(
        gender,
        style: TextStyle(
          fontSize: font_size,
          color: font_color,
        ),
      )
    ]);
  }
}
