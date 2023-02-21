

import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final Function()? onPressed;
  final IconData? icon;
  RoundIconButton({this.onPressed,this.icon});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(height: 50,width: 50),
      shape:CircleBorder(),
      fillColor: Colors.grey,
      child: Icon(icon),
    );
  }
}