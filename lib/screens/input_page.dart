import 'package:bmi_app/screens/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_app/calculator_brain.dart';
import '../components/bottom_button.dart';
import '../components/icon_content.dart';
import '../components/re_usable_card.dart';
import '../components/round_button.dart';
import '../constants.dart';

//can not be implemented in class
enum Genders {
  male,
  female,
}

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color maleCardColor = inActiveColor;
  // Color femaleCardColor = inActiveColor;

  // void updateColor(Genders gender) {
  //   if (gender == Genders.male) {
  //     if (maleCardColor == inActiveColor) {
  //       maleCardColor = ActiveColor;
  //       femaleCardColor = inActiveColor;
  //     } else {
  //       maleCardColor = inActiveColor;
  //     }
  //   }
  //   if (gender == Genders.female) {
  //     if (femaleCardColor == inActiveColor) {
  //       femaleCardColor = ActiveColor;
  //       maleCardColor = inActiveColor;
  //     } else {
  //       femaleCardColor = inActiveColor;
  //     }
  //   }
  // }

  Genders? selectedGender;
  int height = 180;
  int weight = 50;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Genders.male;
                      });
                      print('Male card is tapped');
                    },
                    child: ReUseableCard(
                      colour: selectedGender == Genders.male
                          ? kActiveColor
                          : kInActiveColor,
                      cardChild: IconContent(
                          logo: FontAwesomeIcons.mars, name: 'MALE'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Genders.female;
                      });
                    },
                    child: ReUseableCard(
                      colour: selectedGender == Genders.female
                          ? kActiveColor
                          : kInActiveColor,
                      cardChild: IconContent(
                        logo: FontAwesomeIcons.venus,
                        name: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReUseableCard(
              colour: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLableTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      Text(
                        'cm',
                        style: kLableTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xff8d8e98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xffeb1555),
                      overlayColor: Color(0x29eb1555),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReUseableCard(
                    colour: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLableTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // FloatingActionButton(
                            //   onPressed: () {},
                            //   child: Icon(
                            //     Icons.add,
                            //     color: Color(0xFF4C4F5E),
                            //   ),
                            // ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            // FloatingActionButton(
                            //   onPressed: () {},
                            //   child: Icon(
                            //     Icons.add,
                            //     color: Color(0xFF4C4F5E),
                            //   ),
                            // ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReUseableCard(
                    colour: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLableTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResults(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
