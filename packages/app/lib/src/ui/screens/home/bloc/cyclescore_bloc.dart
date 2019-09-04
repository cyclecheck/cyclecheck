import 'dart:async';
import 'package:cyclecheck/src/util/datetime.dart';
import 'package:cyclecheck_api/cyclecheck_api.dart';
import 'package:flutter/material.dart';

import 'package:cyclecheck/src/config/constants.dart';
import 'package:cyclecheck/src/data/cyclescore/cyclescore_repository.dart';

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
      _state.setWeather(score);

      _createTimer();
    } catch (error) {
      _state.error = "Something went wrong fetching the weather.";
      print(error);
    }

    _state.isLoading = false;
    notifyListeners();
  }

  void setSelected(int newIndex) {
    _state.selectedIndex = newIndex;
    notifyListeners();
  }

  _createTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(Constants.stale_forecast_duration, (timer) {
      if (_state.filterForecast()) {
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

class CycleScoreState {
  bool isLoading;
  CycleScore score;
  List<WeatherBlock> forecast;
  String error;
  int selectedIndex;

  setWeather(CycleScore value) {
    score = value;
    forecast = _filterOutdatedForecast(
      value.weather.hourly.take(Constants.hours_of_forecast).toList(),
    );
  }

  bool filterForecast() {
    final filtered = _filterOutdatedForecast(forecast);
    final diff = forecast.length - filtered.length;
    if (diff > 0) {
      forecast = filtered;
      return true;
    }

    return false;
  }

  CycleScoreState({
    this.score,
    this.forecast = const [],
    this.isLoading = false,
    this.error,
    this.selectedIndex = 0,
  });

  WeatherBlock get selected =>
      forecast.isNotEmpty ? forecast[selectedIndex] : null;

  List<WeatherBlock> _filterOutdatedForecast(List<WeatherBlock> list) =>
      list.where((item) => isCurrentHourOrFuture(item.forecastedTime)).toList();
}
