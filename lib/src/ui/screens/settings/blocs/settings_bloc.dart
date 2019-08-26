import 'package:cyclecheck/src/util/debouncer.dart';
import 'package:flutter/foundation.dart';
import 'package:cyclecheck_api/cyclecheck_api.dart';

import 'package:cyclecheck/src/data/settings/settings_repository.dart';

class SettingsBloc extends ChangeNotifier {
  final SettingsRepo _settingsRepository;
  final Debouncer _debouncer = Debouncer(milliseconds: 300);

  CycleScoreSettings _settings = CycleScoreSettings.defaultSettings;
  CycleScoreSettings get settings => _settings;

  SettingsBloc(this._settingsRepository) {
    _init();
  }

  _init() async {
    _settings = await _settingsRepository.getCycleScoreSettings();
    notifyListeners();
  }

  _save(CycleScoreSettings settings) async {
    await _settingsRepository.saveCycleScoreSettings(settings);
    _settings = settings;
    notifyListeners();
  }

  setUnit(Unit unit) {
    _save(_settings.merge(CycleScoreSettings(units: unit)));
  }

  setTemperatures(int min, int max) {
    final settings = _settings.merge(
      CycleScoreSettings(minTemp: min, maxTemp: max),
    );

    _debouncer.run(() => _save(_settings));
    _settings = settings;
    notifyListeners();
  }

  setWindSpeed(int speed) {
    final settings = _settings.merge(CycleScoreSettings(maxWind: speed));

    _save(settings);
  }
}
