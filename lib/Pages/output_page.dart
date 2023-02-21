import 'package:calculator_bmi/constants/constant.dart';
import 'package:calculator_bmi/widgets/customButton.dart';
import 'package:calculator_bmi/widgets/reusableCard.dart';
import 'package:flutter/material.dart';

class OutputPage extends StatelessWidget {


  String? result;
  String? bmi;
  String? message;
  OutputPage({this.result,this.bmi,this.message});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("bmi Result  ".toUpperCase()),
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ReusableCard(
                  color: Colors.blue,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$result',
                        style: kGenderStyle.copyWith(
                            fontWeight: FontWeight.normal,fontSize: 50),
                      ),
                      Text(
                        '$bmi',
                        style: kGenderStyle.copyWith(fontSize: 80),
                      ),
                      Center(
                        child: Text(
                          '$message',
                          textAlign: TextAlign.center,
                          style: kGenderStyle.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(titile: "re-calculate".toUpperCase(),

                onPressed: (){
                  Navigator.pop(context,"isBack");

                },)
            ],
          )),
    );
  }
}
