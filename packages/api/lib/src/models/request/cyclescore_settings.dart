import 'package:cyclecheck_api/src/models/models.dart';
import 'package:cyclecheck_api/src/util/converter.dart';
import 'package:equatable/equatable.dart';

class CycleScoreSettings extends Equatable {
  final int minTemp;
  final int maxTemp;
  final int maxWind;
  final Unit units;

  CycleScoreSettings({
    this.minTemp,
    this.maxTemp,
    this.maxWind,
    this.units,
  }) : super([minTemp, maxTemp, maxWind, units]);

  bool get isMetric => units == Unit.METRIC;

  bool get isImperial => units == Unit.IMPERIAL;

  String get windValue {
    final speed =
        isImperial ? kphToMph(maxWind.toDouble()) : maxWind.toDouble();
    return "${speed.round()} $windUnit";
  }

  String get windUnit => isMetric ? "km/h" : "mph";

  String get tempUnit => "°${isMetric ? "C" : "F"}";

  String degrees(double value) =>
      "${convertTemperature(value, units).round()}$tempUnit";

  /// The default value for the acceptable minimum temperature, in celcius.
  static const DEFAULT_MIN_TEMP = 5;

  /// The default value for an acceptable max temperature, in celcius.
  static const DEFAULT_MAX_TEMP = 40;

  /// The default value for an acceptable amount of wind speed, in km/h.
  static const DEFAULT_MAX_WIND = 30;

  static final defaultSettings = CycleScoreSettings(
    minTemp: DEFAULT_MIN_TEMP,
    maxTemp: DEFAULT_MAX_TEMP,
    maxWind: DEFAULT_MAX_WIND,
    units: Unit.defaultUnit,
  );

  static CycleScoreSettings fromJson(Map<String, dynamic> json) =>
      CycleScoreSettings(
        minTemp: json['minTemp'] ?? DEFAULT_MAX_TEMP,
        maxTemp: json['maxTemp'] ?? DEFAULT_MIN_TEMP,
        maxWind: json['maxWind'] ?? DEFAULT_MAX_WIND,
        units: Unit.from(json['units']) ?? Unit.defaultUnit,
      );

  CycleScoreSettings merge(CycleScoreSettings other) {
    if (other == null) return this;

    return CycleScoreSettings(
      minTemp: other.minTemp ?? minTemp,
      maxTemp: other.maxTemp ?? maxTemp,
      maxWind: other.maxWind ?? maxWind,
      units: other.units ?? units,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'maxTemp': maxTemp,
      'minTemp': minTemp,
      'maxWind': maxWind,
      'units': units.toJson(),
    };

    json.removeWhere((key, value) => key == null);

    return json;
  }
}
