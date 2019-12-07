class CalculationManager {
  CalculationManager(this.height, this.weight);

  int height;
  int weight;

  double bmi() {
    return weight / (height * height) * 10000;
  }

  String message(double bmi) {
    if (bmi < 18.5)
      return "You have a lower than normal body weight. You can eat a bit more";
    else if (bmi > 18.5 && bmi <= 25)
      return "You have a normal body weight. Good job!";
    else
      return "'You have a higher than normal body weight. Try to exercise more.";
  }
}
