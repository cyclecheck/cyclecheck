import 'package:cyclecheck_api/cyclecheck_api.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Geolocator _geolocator;
  CycleCheck _cycleCheck;

  LocationService({
    Geolocator geolocator,
    CycleCheck cycleCheck,
  }) {
    _geolocator = geolocator ?? Geolocator();
    _cycleCheck = cycleCheck ?? CycleCheck();
  }

  Future<Position> getCurrentPosition() {
    return _geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    );
  }

  Future<Place> getPlaceFromPosition(Position position) {
    return _cycleCheck.fromLatLng(position.latitude, position.longitude);
  }

  Future<List<AutoCompletePlace>> searchPlace(String input) {
    return _cycleCheck.search(input);
  }

  Future<Place> placeDetails(String placeId) {
    return _cycleCheck.placeDetails(placeId);
  }
}
