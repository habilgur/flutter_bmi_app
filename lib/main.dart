import 'package:flutter/material.dart';
import 'package:flutter_bmi_app/pages/calc_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        /// primarySwatch: İçerisinde primaryColoru barındırır. Swatch tüm renkelrin tonlarını tutar. Colors.pink[500]  vb..
        /// Hex değeri olan #090E21 => # değerini 0xff ile değiştirilir. 0xFF Opaklığı belirtir.
        primaryColor: Color(0xFF090E21),
        scaffoldBackgroundColor: Color(0xFF090E21), //scaffold Arka Plan rengi
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.pink),
        textTheme: TextTheme(
          //Change Primary Font Colors..
          body1: TextStyle(color: Colors.white),
          body2: TextStyle(color: Colors.white),
        ),
      ),

      /// Override existing theme data properties for only change specific one
//      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.pink),

      home: CalculationPage(),
    );
  }
}
