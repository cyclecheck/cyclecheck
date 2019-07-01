import 'package:shared_preferences/shared_preferences.dart';
import 'package:cyclecheck_api/cyclecheck_api.dart';

typedef PrefsProvider = Future<SharedPreferences> Function();

class SettingsService {
  PrefsProvider _prefsProvider = () => SharedPreferences.getInstance();

  SettingsService({
    PrefsProvider prefsProvider,
  });

  Future<Unit> getUnit() async {
    try {
      return Unit.from(await _string(_SettingsKeys.units));
    } catch (error) {
      return Unit.defaultUnit;
    }
  }

  Future<bool> saveUnit(Unit unit) async {
    final prefs = await _prefsProvider();
    return prefs.setString(_SettingsKeys.units, unit.value);
  }

  Future<String> getPlaceId() {
    return _string(_SettingsKeys.selectedPlaceId);
  }

  Future<bool> savePlaceId(String placeId) async {
    final prefs = await _prefsProvider();
    return prefs.setString(_SettingsKeys.selectedPlaceId, placeId);
  }

  Future<int> getMinTemperature() {
    return _int(_SettingsKeys.minTemperature);
  }

  Future<bool> saveMinTemperature(int minTemp) async {
    final prefs = await _prefsProvider();
    return prefs.setInt(_SettingsKeys.minTemperature, minTemp);
  }

  Future<int> getMaxTemperature() {
    return _int(_SettingsKeys.maxTemperature);
  }

  Future<bool> saveMaxTemperature(int maxTemp) async {
    final prefs = await _prefsProvider();
    return prefs.setInt(_SettingsKeys.maxTemperature, maxTemp);
  }

  Future<int> getMaxWindSpeed() {
    return _int(_SettingsKeys.maxWindSpeed);
  }

  Future<bool> saveMaxWindSpeed(int windSpeed) async {
    final prefs = await _prefsProvider();
    return prefs.setInt(_SettingsKeys.maxWindSpeed, windSpeed);
  }

  Future<String> _string(String key) async {
    final prefs = await _prefsProvider();
    return prefs.getString(key);
  }

  Future<int> _int(String key) async {
    final prefs = await _prefsProvider();
    return prefs.getInt(key);
  }
}

class _SettingsKeys {
  static const String units = 'units';
  static const String selectedPlaceId = 'place_id';
  static const String minTemperature = 'minimum_temperature';
  static const String maxTemperature = 'maximum_temperature';
  static const String maxWindSpeed = 'max_wind_speed';
}
