import 'package:flutter/foundation.dart';
import 'package:cyclecheck_api/cyclecheck_api.dart';

import 'package:cyclecheck/src/data/settings/settings_repository.dart';

class SettingsState extends ChangeNotifier {
  final SettingsRepository _settingsRepository;

  CycleScoreSettings _settings = CycleScoreSettings.defaultSettings;
  CycleScoreSettings get settings => _settings;

  SettingsState(this._settingsRepository) {
    _init();
  }

  _init() async {
    _settings = await _settingsRepository.getCycleScoreSettings();
    notifyListeners();
  }

  save(CycleScoreSettings settings) {
    _settingsRepository.saveCycleScoreSettings(settings);
    _settings = settings;
    notifyListeners()
  }
}
