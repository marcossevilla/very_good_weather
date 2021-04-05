extension TemperatureX on double {
  double get fahrenheit => (this * 9 / 5) + 32;
  double get celsius => (this - 32) * 5 / 9;
}
