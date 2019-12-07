import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.bmiResult, this.message});

  final double bmiResult;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.orange,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Your BMI Index",
              style: TextStyle(fontSize: 35),
            ),
            SizedBox(height: 30),
            Text(
              " ${bmiResult.toStringAsFixed(1)}",
              style: TextStyle(fontSize: 80),
            ),
            SizedBox(height: 30),
            Text(
              " $message",
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            FlatButton(
              child: Text(
                "Try Again",
                style: TextStyle(fontSize: 25),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    ));
  }
}
