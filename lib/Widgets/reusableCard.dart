import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color? color;
  final Widget? cardChild;
  final Function()? onPressed;

  ReusableCard({this.color, this.cardChild,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: color,
            //Color(0xFF10331E),
            borderRadius: BorderRadius.circular(8)),
        child: cardChild,
      ),
    );
  }
}