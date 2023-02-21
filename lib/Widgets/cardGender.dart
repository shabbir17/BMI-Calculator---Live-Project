import 'package:calculator_bmi/constants/constant.dart';
import 'package:flutter/material.dart';

class CardGender extends StatelessWidget {
  final IconData? icon;
  final String? text;
  CardGender({
    this.icon,this.text
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 100,
          color: Colors.white,
        ),
        Text(
            text!,
            style: kGenderStyle
        )
      ],
    );
  }
}