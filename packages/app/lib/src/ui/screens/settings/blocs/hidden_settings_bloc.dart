import 'package:flutter/material.dart';

import 'package:cyclecheck/src/data/settings/settings_repository.dart';

class HiddenSettingsBloc extends ChangeNotifier {
  final SettingsRepo _repo;

  HiddenSettingsBloc(this._repo) {
    _init();
  }

  HiddenSettingsState _state = HiddenSettingsState();
  HiddenSettingsState get state => _state;

  _init() async {
    _state
      ..showOnboarding = await _repo.hasCompletedOnboarding()
      ..isDeveloperMode = await _repo.isDeveloperMode();

    notifyListeners();
  }

  incrementDevModeCount() async {
    await _repo.incrementDevModeCount();
    await _updateIsDevMode();
  }

  toggleDevMode() async {
    _state.isDeveloperMode
        ? await _repo.resetDeveloperMode()
        : await _repo.incrementDevModeCount();

    await _updateIsDevMode();
  }

  toggleOnboardingFlag() async {
    _state.showOnboarding = await _repo.toggleOnboardingFlag();
    notifyListeners();
  }

  _updateIsDevMode() async {
    _state.isDeveloperMode = await _repo.isDeveloperMode();
    notifyListeners();
  }
}

class HiddenSettingsState {
  bool isDeveloperMode = false;
  bool showOnboarding = false;
}
