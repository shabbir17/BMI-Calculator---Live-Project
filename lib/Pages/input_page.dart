import 'package:calculator_bmi/constants/constant.dart';
import 'package:calculator_bmi/models/bmi_calculator.dart';
import 'package:calculator_bmi/pages/output_page.dart';
import 'package:calculator_bmi/widgets/cardGender.dart';
import 'package:calculator_bmi/widgets/customButton.dart';
import 'package:calculator_bmi/widgets/reusableCard.dart';
import 'package:calculator_bmi/widgets/roundIconButton.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  static const bottomContainerHeight = 60.0;

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = kInactiveColor;
  Color femaleColor = kInactiveColor;

  Gender? selectedGender;
  int height = 180;
  int weight = 45;
  int age = 20;

/*  void updateColor(Gender gender){
    if(gender==Gender.male){
      setState(() {
        maleColor=kActiveColor;
        femaleColor=kInactiveColor;
      });
    }else{setState(() {
      femaleColor=kActiveColor;
      maleColor=kInactiveColor;
    });}
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu_outlined),
        title: Text("BMI CALCUlator".toUpperCase()),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPressed: () {
                        // updateColor(Gender.male);
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      color: selectedGender == Gender.male
                          ? kActiveColor
                          : kInactiveColor,
                      cardChild: CardGender(
                        icon: Icons.male,
                        text: "male",
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                        onPressed: () {
                          //updateColor(Gender.female);
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        color: selectedGender == Gender.female
                            ? kActiveColor
                            : kInactiveColor,
                        cardChild: CardGender(
                          icon: Icons.female,
                          text: "Female",
                        )),
                  ),
                ],
              ),
            ),
            //Slider
            Expanded(
              child: Container(
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  //Color(0xFF10331E),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "height".toUpperCase(),
                      style: kGenderStyle.copyWith(
                          fontWeight: FontWeight.w400, fontSize: 25),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "$height",
                          style: kGenderStyle,
                        ),
                        Text("cm")
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      activeColor: Colors.white,
                      inactiveColor: Colors.grey,
                      onChanged: (double myNewValue) {
                        print(myNewValue);
                        setState(() {
                          height = myNewValue.toInt();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: ReusableCard(
                        color: kInactiveColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "weight",
                              style: kGenderStyle.copyWith(
                                  fontWeight: FontWeight.w400, fontSize: 25),
                            ),
                            Text(
                              weight.toString(),
                              style: kGenderStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  icon: Icons.remove,
                                ),
                                RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  icon: Icons.add,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                      child: ReusableCard(
                        color: kInactiveColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Age",
                              style: kGenderStyle.copyWith(
                                  fontWeight: FontWeight.w400, fontSize: 25),
                            ),
                            Text(
                              age.toString(),
                              style: kGenderStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  icon: Icons.remove,
                                ),
                                RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  icon: Icons.add,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            CustomButton(
              onPressed: () async {

                BmiCalculator bmiCal=BmiCalculator(height, weight);
                String status = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return OutputPage(
                    bmi:bmiCal.calculateBmi() ,
                    result: bmiCal.result(),
                    message: bmiCal.message(),
                  );
                }));
                if(status=="isBack"){
                  setState(() {
                    height=130;
                    weight=45;
                    age=18;
                  });
                }

              },
              titile: "Calculate bmi".toUpperCase(),
            )
          ],
        ),
      ),
    );
  }
}
