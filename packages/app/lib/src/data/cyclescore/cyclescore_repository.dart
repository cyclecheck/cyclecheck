import 'dart:async';

import 'package:cyclecheck/src/data/settings/settings_repository.dart';
import 'package:cyclecheck_api/cyclecheck_api.dart';

class CycleScoreRepo {
  /// Have a function to get the cyclescore
  /// Probably return a stream
  /// First check the database for a previous result
  /// If it is younger than 10 mins, return
  /// if it is older, go to the api
  /// save to database
  /// return

  SettingsRepo _settingsRepo;
  CycleCheck _cycleCheck;

  CycleScoreRepo({
    CycleCheck cycleCheck,
    SettingsRepo settingsRepo,
  }) {
    _cycleCheck = cycleCheck ?? CycleCheck();
    _settingsRepo = settingsRepo ?? SettingsRepo();
  }

  Future<CycleScore> getScore() async {
    final placeId = await _settingsRepo.getSavedPlaceId();
    final settings = await _settingsRepo.getCycleScoreSettings();

    // TODO: check for previous results
    // Saving new settings will have to invalidate the cached weather response

    return _cycleCheck.cycleScore(placeId, settings: settings);
  }
}
