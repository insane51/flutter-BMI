import 'dart:async';

import 'package:_bmi/main.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => MyHomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0x32323200),
          Color(0x3F3F3F00),
          Color(0x1C1C1C00),
        ])),
        // child: Text('BMI Calculator',),
        child: Text(
          'BMI Calcuator',
          style: TextStyle(
              color: Colors.blue,
              fontSize: 31,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none),
        ),
      ),
    );
  }
}
