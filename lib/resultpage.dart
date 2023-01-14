import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'card.dart';
import 'constants.dart';

class result extends StatelessWidget {
  final String bmi;
  final String esult;
  final String interpertation;
  result({this.bmi = "", this.esult = "", this.interpertation = ""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Text(
                "Your Result",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: card(
              widget: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      esult,
                      style: TextStyle(fontSize: 22, color: Colors.green),
                    ),

                    Text(
                      bmi,
                      style: TextStyle(
                          fontSize: 100,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    Text(
                      interpertation,
                      style: TextStyle(fontSize: 19, color: Color(0xFF8D8E98)),
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, "/");
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Center(
                  child: Text(
                    "RE-CALCULATE",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              color: calcultae_button_color,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80,
            ),
          )
        ],
      ),
    );
  }
}
