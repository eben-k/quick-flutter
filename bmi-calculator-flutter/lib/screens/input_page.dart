import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/card_layout.dart';
import '../components/resuable_card_child.dart';
import '../constants.dart';
import '../components/reusable_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender activeGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CardLayout(
                      cardAction: () {
                        setState(() {
                          activeGender = Gender.male;
                        });
                      },
                      color: activeGender == Gender.male
                          ? kCardColor
                          : kInactiveCardColor,
                      cardChild: ReusableCardChild(
                        cardIcon: FontAwesomeIcons.mars,
                        cardText: 'male',
                      ),
                    ),
                  ),
                  Expanded(
                    child: CardLayout(
                      cardAction: () {
                        setState(() {
                          activeGender = Gender.female;
                        });
                      },
                      color: activeGender == Gender.female
                          ? kCardColor
                          : kInactiveCardColor,
                      cardChild: ReusableCardChild(
                        cardIcon: FontAwesomeIcons.venus,
                        cardText: 'female',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CardLayout(
                color: kCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'height'.toUpperCase(),
                      style: kCardTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(), style: kNumberTextStyle),
                        Text(
                          'cm',
                          style: kCardTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 230.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CardLayout(
                      color: kCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'weight'.toUpperCase(),
                            style: kCardTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                changeWeight: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                changeWeight: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CardLayout(
                      color: kCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'age'.toUpperCase(),
                            style: kCardTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                changeWeight: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                changeWeight: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ReusableButton(
              onPress: () {
                CalculatorBrain calculate =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calculate.calculateBMI(),
                      resultText: calculate.getResult(),
                      interpretation: calculate.getInterpretation(),
                    ),
                  ),
                );
              },
              buttonText: 'calculate',
            )
          ],
        ),
      ),
    );
  }
}
