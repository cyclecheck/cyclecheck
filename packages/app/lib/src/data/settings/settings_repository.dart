import 'package:cyclecheck/src/config/constants.dart';
import 'package:cyclecheck_api/cyclecheck_api.dart';

import 'package:cyclecheck/src/data/settings/settings_service.dart';

class SettingsRepo {
  SettingsService _settingsService;
  CycleScoreSettings _cachedSettings;

  bool get _emptyCache => _cachedSettings == null;

  SettingsRepo({
    SettingsService service,
  }) {
    _settingsService = service ?? SettingsService();
  }

  Future<bool> isDeveloperMode() async {
    final count = await _settingsService.devModeCount();
    return count >= Constants.count_for_dev_mode;
  }

  Future<void> resetDeveloperMode() =>
      _settingsService.saveDevModeCount(count: 0);

  Future<void> incrementDevModeCount() => _settingsService.saveDevModeCount();

  Future<bool> hasCompletedOnboarding() =>
      _settingsService.completedOnboarding();

  Future<bool> toggleOnboardingFlag() async {
    final value = !(await hasCompletedOnboarding());
    _settingsService.saveCompletedOnboarding(value);

    return value;
  }

  Future<CycleScoreSettings> getCycleScoreSettings() async {
    final values = await Future.wait([
      _settingsService.getMinTemperature(),
      _settingsService.getMaxTemperature(),
      _settingsService.getMaxWindSpeed()
    ]);

    final settings = CycleScoreSettings(
      units: await _settingsService.getUnit(),
      minTemp: values[0],
      maxTemp: values[1],
      maxWind: values[2],
    );

    _cachedSettings = settings;

    return settings;
  }

  Future<bool> saveCycleScoreSettings(CycleScoreSettings settings) async {
    final List<Future<bool>> futures = [];

    if (_emptyCache || settings.units != _cachedSettings.units) {
      futures.add(_settingsService.saveUnit(settings.units));
    }

    if (_emptyCache || settings.minTemp != _cachedSettings.minTemp) {
      futures.add(_settingsService.saveMinTemperature(settings.minTemp));
    }

    if (_emptyCache || settings.maxTemp != _cachedSettings.maxTemp) {
      futures.add(_settingsService.saveMaxTemperature(settings.maxTemp));
    }

    if (_emptyCache || settings.maxWind != _cachedSettings.maxWind) {
      futures.add(_settingsService.saveMaxWindSpeed(settings.maxWind));
    }

    if (futures.isEmpty) return true;

    final results = await Future.wait(futures);
    final result = results.every((wasSuccess) => wasSuccess);
    if (result) _cachedSettings = settings;

    return result;
  }

  /// Get the saved Google Place for use with the weather service.
  Future<Place> getSavedPlace() => _settingsService.getPlace();

  Future<String> getSavedPlaceId() async => (await getSavedPlace()).id;

  /// Save the selected Place.
  savePlace(Place place) {
    _settingsService.savePlace(place);
  }
}
