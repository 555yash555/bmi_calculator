import 'dart:math';

class calculator {
  calculator({this.height = 0, this.weight = 0});
  final int height;
  final int weight;
  late double _bmi;
  String bmi() {
    _bmi = weight / pow(height / 100, 2);
    return (_bmi.toStringAsFixed(1));
  }

  String result() {
    if (_bmi >= 25) {
      return ("OVERWEIGHT");
    }
    if (_bmi > 18.5) {
      return ("NORMAL");
    } else {
      return ("UNDERWEIGHT");
    }
  }

  String interpretation() {
    if (_bmi >= 25) {
      return ("loose some weight man");
    }
    if (_bmi > 18.5) {
      return ("enjoy ur life man");
    } else {
      return ("put on some weight man");
    }
  }
}
