import 'package:flutter/foundation.dart';

import 'package:cyclecheck_api/src/models/models.dart';

class WeatherBlock {
  DateTime forecastedTime;
  double temperature;
  double apparentTemperature;
  double cloudPercent;
  double humidity;
  int uvIndex;
  Wind wind;
  Precipitation precipitation;
  String weatherType;
  String weatherSummary;
  Score score;

  WeatherBlock({
    @required this.forecastedTime,
    @required this.temperature,
    @required this.apparentTemperature,
    @required this.cloudPercent,
    @required this.humidity,
    @required this.uvIndex,
    @required this.wind,
    @required this.precipitation,
    @required this.weatherType,
    @required this.weatherSummary,
    @required this.score,
  });

  WeatherBlock.fromJson(Map<String, dynamic> json) {
    forecastedTime =
        DateTime.fromMillisecondsSinceEpoch(json['forecastedTime'] * 1000);
    temperature = json['temperature'].toDouble();
    apparentTemperature = json['apparentTemperature'].toDouble();
    cloudPercent = json['cloudPercent'].toDouble();
    humidity = json['humidity'].toDouble();
    uvIndex = json['uvIndex'];
    wind = Wind.fromJson(json['wind']);
    precipitation = Precipitation.fromJson(json['precipitation']);
    weatherType = json['weatherType'];
    weatherSummary = (json['weatherSummary'] ?? "").toString().toLowerCase();
    score = Score.fromJson(json['score']);
  }

  Map<String, dynamic> toJson() => {
        'forecastedTime': forecastedTime.toUtc().millisecondsSinceEpoch / 1000,
        'temperature': temperature,
        'apparentTemperature': apparentTemperature,
        'cloudPercent': cloudPercent,
        'humidity': humidity,
        'uvIndex': uvIndex,
        'wind': wind,
        'precipitation': precipitation,
        'weatherType': weatherType,
        'weatherSummary': weatherSummary,
        'score': score,
      };
}
