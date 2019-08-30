import 'package:dio/dio.dart';

import 'package:cyclecheck_api/cyclecheck_api.dart';

class Client {
  final Dio _dio = Dio();

  static const String DEFAULT_BASE_URL = 'https://api.cyclecheck.app';
  static const String API_CHECK = '/weather';
  static const String API_LATLNG = '/location/latlng';
  static const String API_PLACES_SEARCH = '/location/search';
  static const String API_PLACE_DETAILS = '/location/place';
  static const String REQUIRED_HEADER_SESSION = 'session';

  Client(
    String sessionKey, {
    String baseUrl,
  }) {
    _dio.options = new BaseOptions(
      baseUrl: baseUrl == null ? Client.DEFAULT_BASE_URL : baseUrl,
      headers: {
        Client.REQUIRED_HEADER_SESSION: sessionKey,
      },
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
  }

  Future<List<AutoCompletePlace>> search(String input) async {
    Response response = await _dio.get(
      Client.API_PLACES_SEARCH,
      queryParameters: {
        'input': input,
      },
    );

    return AutoCompletePlace.fromList(response.data['data']);
  }

  Future<Place> fromLatLng(double lat, double lng) async {
    Response response = await _dio.get(
      Client.API_LATLNG,
      queryParameters: {
        'lat': lat,
        'lng': lng,
      },
    );

    return Place.fromJson(response.data['data']);
  }

  Future<Place> placeDetails(String placeId) async {
    Response response = await _dio.get("${Client.API_PLACE_DETAILS}/$placeId");

    return Place.fromJson(response.data['data']);
  }

  Future<CycleScore> cycleScore(
    String placeId, {
    CycleScoreSettings settings,
  }) async {
    Map<String, dynamic> params = settings == null ? {} : settings.toJson();
    Response response = await _dio.get(
      "${Client.API_CHECK}/$placeId",
      queryParameters: params,
    );

    return CycleScore.fromJson(response.data['data']);
  }
}
