import 'package:calculator_bmi/constants/constant.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String? titile;

  CustomButton({this.onPressed, this.titile});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.red),
        margin: EdgeInsets.symmetric(horizontal: 16),
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            titile! ,
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
