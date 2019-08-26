import 'dart:async';

import 'package:cyclecheck/src/config/constants.dart';
import 'package:cyclecheck/src/data/cyclescore/cyclescore_repository.dart';
import 'package:cyclecheck/src/data/settings/settings_repository.dart';
import 'package:cyclecheck/src/util/debouncer.dart';
import 'package:cyclecheck_api/cyclecheck_api.dart';
import 'package:flutter/material.dart';

class CycleScoreBloc extends ChangeNotifier {
  final CycleScoreRepo _cycleScoreRepo;
  Timer _timer;

  CycleScoreState _state = CycleScoreState();
  CycleScoreState get state => _state;

  CycleScoreBloc(this._cycleScoreRepo) {
    _init();
  }

  _init() {
    _createTimer();
    fetchCycleScore();
  }

  fetchCycleScore() async {
    _state.isLoading = true;
    _timer?.cancel();
    notifyListeners();

    try {
      final score = await _cycleScoreRepo.getScore();
      final forecast = [
        score.weather.current,
        ...score.weather.hourly.sublist(1).take(Constants.hours_of_forecast),
      ];

      _state
        ..score = score
        ..forecast = _filterOutdatedForecast(forecast);

      _createTimer();
    } catch (error) {
      _state.error = "Something went wrong fetching the weather.";
      print(error);
    }

    _state.isLoading = false;
    notifyListeners();
  }

  setSelected(int newIndex) {
    _state.selected = newIndex;
    notifyListeners();
  }

  _createTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(Duration(minutes: 5), (timer) {
      _state.forecast = _filterOutdatedForecast(_state.forecast);
      notifyListeners();
    });
  }

  List<WeatherBlock> _filterOutdatedForecast(List<WeatherBlock> list) => list
      .where((item) => item.forecastedTime.isAfter(DateTime.now()))
      .toList();

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}

class CycleScoreState {
  bool isLoading;
  CycleScore score;
  List<WeatherBlock> forecast;
  String error;
  int selected;

  CycleScoreState({
    this.score,
    this.forecast = const [],
    this.isLoading = false,
    this.error,
    this.selected = 0,
  });

  WeatherBlock get selectedWeather =>
      forecast.isNotEmpty ? forecast[selected] : null;
}
