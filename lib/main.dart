import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //Hex değeri olan #090E21 => # değerini 0xff ile değiştirilir. 0xFF Opaklığı belirtir.
        primaryColor: Color(0xFF090E21),
      ),
      home: CalculationPage(),
    );
  }
}

class CalculationPage extends StatefulWidget {
  @override
  _CalculationPageState createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
