import 'package:cyclecheck_api/src/models/models.dart';

double convertTemperature(double value, Unit unit) {
  return unit == Unit.IMPERIAL ? celciusToFarenheit(value) : value;
}

double celciusToFarenheit(double value) {
  return (value * 9 / 5) + 32;
}

double farenheitToCelcius(double value) {
  return (value - 32) * 5 / 9;
}

double kphToMph(double kph) {
  return kph / 1.60934;
}

double mphToKph(double mph) {
  return mph * 1.60934;
}
