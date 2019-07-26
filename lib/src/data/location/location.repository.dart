import 'package:cyclecheck_api/cyclecheck_api.dart';

import 'package:cyclecheck/src/data/location/location_service.dart';

class LocationRepository {
  LocationService _locationService;

  LocationRepository({
    LocationService locationService,
  }) {
    _locationService = locationService ?? LocationService();
  }

  Future<Place> getCurrentPlace() async {
    final position = await _locationService.getCurrentPosition();
    final place = await _locationService.getPlaceFromPosition(position);

    return place;
  }

  Future<List<AutoCompletePlace>> searchPlace(String input) =>
      _locationService.searchPlace(input);

  Future<Place> getPlaceDetails(String placeId) =>
      _locationService.placeDetails(placeId);
}
