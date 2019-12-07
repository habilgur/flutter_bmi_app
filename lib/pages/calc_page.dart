import 'package:flutter/material.dart';
import 'package:flutter_bmi_app/calc_manager.dart';
import 'package:flutter_bmi_app/pages/result_page.dart';

const Color activeColor = Colors.pink;
const Color inActiveColor = Colors.white30;

class CalculationPage extends StatefulWidget {
  @override
  _CalculationPageState createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {
  Color maleCardColor = inActiveColor;
  Color femaleCardColor = activeColor;

  double _height = 150;
  int _weight = 50;
  int _age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Row(
                  children: <Widget>[
                    smallCard(
                        "assets/female.png", CardLabel.Female, femaleCardColor),
                    smallCard("assets/men.png", CardLabel.Male, maleCardColor),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: <Widget>[
                    sliderCard(),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  children: <Widget>[
                    smallCardBottom(CardLabel.Weight, _weight),
                    smallCardBottom(CardLabel.Age, _age),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: <Widget>[
                    calcButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget smallCard(String url, CardLabel cardLabel, Color color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            setState(() {
              upDateColor(cardLabel);
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(image: AssetImage(url)),
            ),
          ),
        ),
      ),
    );
  }

  void upDateColor(cardLabel) {
    if (cardLabel == CardLabel.Female) {
      maleCardColor = inActiveColor;
      femaleCardColor = activeColor;
    } else {
      maleCardColor = activeColor;
      femaleCardColor = inActiveColor;
    }
  }

  Widget sliderCard() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Height",
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "${_height.toInt()} cm",
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Slider(
                  activeColor: Colors.black,
                  label: "Choose",
                  value: _height,
                  max: 250,
                  min: 50,
                  onChanged: (value) {
                    setState(() {
                      _height = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget smallCardBottom(CardLabel cardLabel, int input) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      cardLabel == CardLabel.Weight ? "Weight" : "Age",
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      cardLabel == CardLabel.Weight ? "$input kg" : "$input",
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    iconSize: 45,
                    icon: Icon(
                      Icons.do_not_disturb_on,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        decreaseInputs(cardLabel);
                      });
                    },
                  ),
                  IconButton(
                    iconSize: 45,
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        increaseInputs(cardLabel);
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget calcButton() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.orange,
          child: FlatButton(
            child: Text(
              "Calculate",
              style: TextStyle(color: Colors.white, fontSize: 33),
            ),
            onPressed: () {
              var cal = CalculationManager(_height.toInt(), _weight);
              double bmi = cal.bmi();
              String msg = cal.message(bmi);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: bmi,
                    message: msg,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void increaseInputs(CardLabel type) {
    type == CardLabel.Weight ? _weight++ : _age++;
  }

  void decreaseInputs(CardLabel type) {
    type == CardLabel.Weight ? _weight-- : _age--;
  }
}

enum CardLabel { Weight, Age, Female, Male }
