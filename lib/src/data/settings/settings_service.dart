import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:cyclecheck_api/cyclecheck_api.dart';

typedef PrefsProvider = Future<SharedPreferences> Function();

class SettingsService {
  PrefsProvider _prefsProvider;

  SettingsService({
    PrefsProvider prefsProvider,
  }) {
    _prefsProvider = prefsProvider ?? () => SharedPreferences.getInstance();
  }

  Future<bool> isFirstRun() async => _bool(
        _Keys.isFirstRun,
        defaultValue: true,
      );

  Future<Unit> getUnit() async {
    try {
      return Unit.from(await _string(_Keys.units));
    } catch (error) {
      return Unit.defaultUnit;
    }
  }

  Future<bool> saveUnit(Unit unit) async {
    final prefs = await _prefsProvider();
    return prefs.setString(_Keys.units, unit.value);
  }

  Future<Place> getPlace() async {
    final string = await _string(_Keys.selectedPlace);

    if (string == null) return null;
    return Place.fromJson(jsonDecode(string));
  }

  Future<bool> savePlace(Place place) async {
    final prefs = await _prefsProvider();
    final jsonString = jsonEncode(place);
    return prefs.setString(_Keys.selectedPlace, jsonString);
  }

  Future<int> getMinTemperature() => _int(
        _Keys.minTemperature,
        defaultValue: CycleScoreSettings.DEFAULT_MIN_TEMP,
      );

  Future<bool> saveMinTemperature(int minTemp) async {
    final prefs = await _prefsProvider();
    return prefs.setInt(_Keys.minTemperature, minTemp);
  }

  Future<int> getMaxTemperature() => _int(
        _Keys.maxTemperature,
        defaultValue: CycleScoreSettings.DEFAULT_MAX_TEMP,
      );

  Future<bool> saveMaxTemperature(int maxTemp) async {
    final prefs = await _prefsProvider();
    return prefs.setInt(_Keys.maxTemperature, maxTemp);
  }

  Future<int> getMaxWindSpeed() => _int(
        _Keys.maxWindSpeed,
        defaultValue: CycleScoreSettings.DEFAULT_MAX_WIND,
      );

  Future<bool> saveMaxWindSpeed(int windSpeed) async {
    final prefs = await _prefsProvider();
    return prefs.setInt(_Keys.maxWindSpeed, windSpeed);
  }

  Future<String> _string(String key, {String defaultValue}) async {
    final prefs = await _prefsProvider();
    return prefs.getString(key) ?? defaultValue;
  }

  Future<bool> _bool(String key, {bool defaultValue}) async {
    final prefs = await _prefsProvider();
    return prefs.getBool(key) ?? defaultValue;
  }

  Future<int> _int(String key, {int defaultValue}) async {
    final prefs = await _prefsProvider();
    return prefs.getInt(key) ?? defaultValue;
  }
}

class _Keys {
  static const String isFirstRun = 'is_first_run';
  static const String units = 'units';
  static const String selectedPlace = 'place';
  static const String minTemperature = 'minimum_temperature';
  static const String maxTemperature = 'maximum_temperature';
  static const String maxWindSpeed = 'max_wind_speed';
}
