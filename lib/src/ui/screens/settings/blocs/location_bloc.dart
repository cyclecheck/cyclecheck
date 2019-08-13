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

  Future<List<AutoCompletePlace>> search(String input) {
    return _locationRepository.searchPlace(input);
  }

  setSelectedPlace(String placeId) async {
    _state.loading = true;
    notifyListeners();

    final result = await _locationRepository.getPlaceDetails(placeId);
    await _settingsRepository.savePlace(result);
    _state.place = result;

    notifyListeners();
  }
}

class LocationState {
  Place place;
  bool loading;
  bool currentPlaceSuccess;
  LocationErrors currentPlaceError;
  List<AutoCompletePlace> searchSuggestions;

  LocationState({
    this.place,
    this.loading = false,
    this.currentPlaceSuccess = false,
    this.currentPlaceError,
    this.searchSuggestions = const [],
  });
}

enum LocationErrors {
  PERMISSION_DENIED,
  GENERIC,
}
