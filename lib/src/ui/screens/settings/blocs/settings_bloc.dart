import 'package:flutter/foundation.dart';
import 'package:cyclecheck_api/cyclecheck_api.dart';

import 'package:cyclecheck/src/data/settings/settings_repository.dart';

class SettingsBloc extends ChangeNotifier {
  final SettingsRepository _settingsRepository;

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

    save(settings);
  }
}
