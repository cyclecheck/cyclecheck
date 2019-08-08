import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:cyclecheck_api/cyclecheck_api.dart';

import 'package:cyclecheck/src/data/location/location.repository.dart';
import 'package:cyclecheck/src/data/settings/settings_repository.dart';

class LocationBloc extends ChangeNotifier {
  final SettingsRepo _settingsRepository;
  final LocationRepo _locationRepository;

  LocationState _state = LocationState();
  LocationState get state => _state;

  LocationBloc(this._settingsRepository, this._locationRepository) {
    _init();
  }

  _init() async {
    _state.place = await _settingsRepository.getSavedPlace();
    notifyListeners();
  }

  getCurrentLocation() async {
    _state.loading = true;
    notifyListeners();

    try {
      final place = await _locationRepository.getCurrentPlace();
      await _settingsRepository.savePlace(place);
      _state
        ..currentPlaceSuccess = true
        ..place = place;
    } on PlatformException {
      _state.currentPlaceError = LocationErrors.PERMISSION_DENIED;
    } catch (error) {
      _state.currentPlaceError = LocationErrors.GENERIC;
    }

    _state.loading = false;
    notifyListeners();
  }
}

class LocationState {
  Place place;
  bool loading;
  bool currentPlaceSuccess;
  LocationErrors currentPlaceError;

  LocationState({
    this.place,
    this.loading = false,
    this.currentPlaceSuccess = false,
    this.currentPlaceError,
  });
}

enum LocationErrors {
  PERMISSION_DENIED,
  GENERIC,
}
