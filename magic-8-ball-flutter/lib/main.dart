import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text(
          'Ask Me Anything',
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.normal),
        ),
      ),
      body: Ball(
      ),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: FlatButton(onPressed: () {
          setState(() {
            ballNumber = Random().nextInt(5) + 1;
          });
        }, child: Image.asset('images/ball$ballNumber.png')),
      ),
    );
  }
}
