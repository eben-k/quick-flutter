import 'package:flutter/material.dart';
import '../constants.dart';

class ReusableButton extends StatelessWidget {
  ReusableButton({@required this.onPress, @required this.buttonText});

  final Function onPress;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        child: Center(child: Text(buttonText.toUpperCase(), style: kCalculateButtonStyle,)),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        height: kBottomContainerHeight,
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 15.0),
      ),
    );
  }
}