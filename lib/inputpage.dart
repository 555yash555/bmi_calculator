import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card.dart';
import 'genderbutton.dart';
import 'constants.dart';
import 'resultpage.dart';
import 'brain.dart';

void donothing() {}

enum Gender { male, female }

enum Property { weight, age }

int weight = 60;
int age = 19;

void toggle_gender_button(Gender gender) {
  male_button =
      gender == Gender.male ? active_button_color : inactive_button_color;
  female_buttonb =
      gender == Gender.female ? active_button_color : inactive_button_color;
}

// const Color active_button_color=

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 120;
  int weight = 60;
  int age = 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: card(
                    onpress: (() {
                      setState(() {
                        toggle_gender_button(Gender.male);
                      });
                    }),
                    color: male_button,
                    widget: genderbutton("MALE", FontAwesomeIcons.mars),
                  ),
                ),
                Expanded(
                  child: card(
                    onpress: (() {
                      setState(() {
                        toggle_gender_button(Gender.female);
                      });
                    }),
                    color: female_buttonb,
                    widget: genderbutton("FEMALE", FontAwesomeIcons.venus),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: card(
              color: active_button_color,
              widget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: smalltextstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: bigtextstyle,
                        ),
                        Text(
                          "cm",
                          style: smalltextstyle,
                        ),
                      ],
                    ),
                    Slider(
                        value: height.toDouble(),
                        activeColor: Colors.white,
                        inactiveColor: Colors.grey,
                        min: 110,
                        max: 220,
                        onChanged: (double updatedvalue) {
                          setState(() {
                            height = updatedvalue.round();
                          });
                        }),
                  ]),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: card(
                    color: active_button_color,
                    widget: btncard(
                      property: "WEIGHT",
                      value: weight,
                      Function2: () {
                        setState(() {
                          weight++;
                        });
                      },
                      Function1: () {
                        setState(() {
                          weight--;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: card(
                    color: active_button_color,
                    widget: btncard(
                      property: "AGE",
                      value: age,
                      Function2: () {
                        setState(() {
                          age++;
                        });
                      },
                      Function1: () {
                        setState(() {
                          age--;
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          // TextButton(onPressed: onPressed, child: child)
          GestureDetector(
            onTap: () {
              calculator calc = calculator(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => result(
                    bmi: calc.bmi(),
                    esult: calc.result(),
                    interpertation: calc.interpretation(),
                  ),
                ),
              );
            },
            child: Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    "CALCULATE",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                color: calcultae_button_color,
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 65,
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class btncard extends StatelessWidget {
  btncard(
      {this.property = "none",
      this.Function1 = donothing,
      this.value = 60,
      this.Function2 = donothing});
  final String property;
  final int value;
  final VoidCallback Function1;
  final VoidCallback Function2;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              property,
              style: smalltextstyle,
            ),
            Text(
              (value).toString(),
              style: bigtextstyle,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  roundiconbutton(
                    icon: FontAwesomeIcons.minus,
                    function: Function1,
                  ),
                  SizedBox(width: 10.0),
                  roundiconbutton(
                    icon: FontAwesomeIcons.plus,
                    function: Function2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}

class roundiconbutton extends StatelessWidget {
  final IconData icon;
  final VoidCallback function;
  // final VoidCallback function2;

  roundiconbutton({
    this.icon = FontAwesomeIcons.arrowsRotate,
    this.function = donothing,
  });
  // this.function2 = donothing});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      onPressed: function,
      onLongPress: function,
      fillColor: active_button_color,
      child: Icon(icon),
      elevation: 6.0,
      constraints: const BoxConstraints(minWidth: 56.0, minHeight: 56.0),
    );
  }
}
