import 'package:flutter/material.dart';

class CardLayout extends StatelessWidget {
  CardLayout({@required this.color, this.cardChild, this.cardAction});

  final Color color;
  final Widget cardChild;
  final Function cardAction;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cardAction,
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10.0)),
        margin: EdgeInsets.all(10.0),
      ),
    );
  }
}