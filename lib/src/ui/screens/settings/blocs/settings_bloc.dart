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

  save(CycleScoreSettings settings) async {
    await _settingsRepository.saveCycleScoreSettings(settings);
    _settings = settings;
    notifyListeners();
  }

  setUnit(Unit unit) {
    save(_settings.merge(CycleScoreSettings(units: unit)));
  }

  setTemperatures(double min, double max) {
    final settings = _settings.merge(
      CycleScoreSettings(minTemp: min.round(), maxTemp: max.round()),
    );

    _debouncer.run(() => save(_settings));
    _settings = settings;
    notifyListeners();
  }

  setWindSpeed(double speed) {
    final settings = _settings.merge(
      CycleScoreSettings(maxWind: speed.round()),
    );

    save(settings);
  }
}
