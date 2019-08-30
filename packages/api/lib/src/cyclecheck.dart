import 'package:cyclecheck_api/src/models/models.dart';
import 'package:cyclecheck_api/src/util/client.dart';
import 'package:cyclecheck_api/src/util/key_generator.dart';

class CycleCheck {
  final KeyGenerator _keygen = KeyGenerator();
  String _baseUrl;

  Future<String> _sessionKey;
  Client _client;

  CycleCheck({
    String baseUrl,
  }) {
    _sessionKey = _keygen.gen();
    _baseUrl = baseUrl;
  }

  Future<List<AutoCompletePlace>> search(String input) async {
    return (await _getClient()).search(input);
  }

  Future<Place> fromLatLng(double latitude, double longitude) async {
    return (await _getClient()).fromLatLng(latitude, longitude);
  }

  Future<Place> placeDetails(String placeId) async {
    return (await _getClient()).placeDetails(placeId);
  }

  Future<CycleScore> cycleScore(
    String placeId, {
    CycleScoreSettings settings,
  }) async {
    return (await _getClient()).cycleScore(placeId, settings: settings);
  }

  Future<Client> _getClient() async {
    if (_client == null) {
      _client = Client(
        await _sessionKey,
        baseUrl: _baseUrl,
      );
    }

    return _client;
  }
}
