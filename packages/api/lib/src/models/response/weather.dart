import 'alert.dart';
import 'precipitation.dart';
import 'weather_block.dart';
import 'wind.dart';

class Weather {
  int maxTemp;
  int minTemp;
  double sunrise;
  double sunset;
  int maxWind;
  int minWind;
  Wind wind;
  Precipitation precipitation;
  WeatherBlock current;
  List<WeatherBlock> hourly;
  List<Alert> alerts;

  Weather({
    this.maxTemp,
    this.minTemp,
    this.sunrise,
    this.sunset,
    this.maxWind,
    this.minWind,
    this.wind,
    this.precipitation,
    this.current,
    this.hourly,
    this.alerts,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    this.maxTemp = json['maxTemp'].round();
    this.minTemp = json['minTemp'].round();
    this.sunrise = json['sunrise'] != null ? json['sunrise'].toDouble() : null;
    this.sunset = json['sunset'] != null ? json['sunset'].toDouble() : null;
    this.maxWind = json['maxWind'].round();
    this.minWind = json['minWind'].round();
    this.wind = new Wind.fromJson(json['wind']);
    this.precipitation = new Precipitation.fromJson(json['precipitation']);
    this.current = WeatherBlock.fromJson(json['current']);
    this.hourly = List<WeatherBlock>.from(
        json['hourly'].map((o) => WeatherBlock.fromJson(o)));
    this.alerts =
        List<Alert>.from(json['alerts'].map((o) => Alert.fromJson(o)));
  }

  Map<String, dynamic> toJson() => {
        'maxTemp': maxTemp,
        'minTemp': minTemp,
        'sunrise': sunrise,
        'sunset': sunset,
        'maxWind': maxWind,
        'minWind': minWind,
        'wind': wind,
        'precipitation': precipitation,
        'current': current,
        'hourly': hourly,
        'alerts': alerts,
      };
}
