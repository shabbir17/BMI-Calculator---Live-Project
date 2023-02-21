import 'dart:math';
import 'package:calculator_bmi/constants/constant.dart';

class BmiCalculator {
  int? _height;
  int? _weight;
  double? _bmi;

  BmiCalculator(this._height, this._weight);

  String calculateBmi() {
    _bmi = _weight! / pow(_height! / 100, 2);
    return _bmi!.toStringAsFixed(2);
  }

  String message() {
    if (_bmi! <= 18.49) {
      return "you have a lower than normal body weight. You can eat more";
    }else if(_bmi!>=18.5 && _bmi!<=24.99){
      return "you have a normal body.Great job!";
    }else{
      return " You have a higher than normal body weight.try to exercise more";
    }
  }
  String result() {
    if (_bmi! <= 18.49) {
      return underweight;
    }else if(_bmi!>=18.5 && _bmi!<=24.99){
      return normal;
    }else{
      return overweight;
    }
  }

}
