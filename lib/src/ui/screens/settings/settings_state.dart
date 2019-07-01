import 'dart:async';

import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import 'package:cyclecheck_api/cyclecheck_api.dart';

import 'package:cyclecheck/src/data/settings/settings_repository.dart';

class SettingsState {
  final SettingsRepository settingsRepository;

  SettingsState({
    @required this.settingsRepository,
    CycleScoreSettings initialSettings = CycleScoreSettings.defaultSettings,
  }) {
    _settingsController.add(initialSettings);
  }

  final _settingsController = StreamController<CycleScoreSettings>();
  Stream<CycleScoreSettings> get cycleScoreSettingsStream =>
      _settingsController.stream;
}

class ScoreSettingsState extends ChangeNotifier {
  final SettingsRepository _settingsRepository;
  CycleScoreSettings _settings = CycleScoreSettings.defaultSettings;

  ScoreSettingsState(this._settingsRepository) {
    _init();
  }

  CycleScoreSettings get settings => _settings;

  _init() {}
}
