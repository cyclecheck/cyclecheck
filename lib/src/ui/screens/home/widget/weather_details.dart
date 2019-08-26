import 'package:cyclecheck_api/cyclecheck_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_icons/weather_icons.dart';

import 'package:cyclecheck/src/config/dimens.dart';
import 'package:cyclecheck/src/ui/screens/home/bloc/cyclescore_bloc.dart';
import 'package:cyclecheck/src/ui/screens/home/min_max_temp_display.dart';
import 'package:cyclecheck/src/ui/screens/home/widget/details_header.dart';
import 'package:cyclecheck/src/ui/widgets/empty.dart';

// TODO: Pass in the settings, so you can get the units
class WeatherDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CycleScoreBloc>(context).state;
    return state.score == null
        ? Empty.fill() // TODO: Empty state
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailsHeader(
                forecastedTime: state.score.weather.current.forecastedTime,
              ),
              Padding(padding: EdgeInsets.only(bottom: 16)),
              ..._buildDetails(state.score.weather, state.selectedWeather),
              Padding(padding: EdgeInsets.only(bottom: 8)),
            ],
          );
  }

  List<Widget> _buildDetails(Weather weather, WeatherBlock selected) {
    return [
      Container(
        constraints: BoxConstraints(maxWidth: Dimens.max_width_screen),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    MinTempDisplay(value: weather.minTemp),
                    Padding(padding: EdgeInsets.only(right: 4)),
                    MaxTempDisplay(value: weather.maxTemp),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 16)),
                Text("${weather.minWind}-${weather.maxWind} km/h"),
                Row(
                  children: [
                    Text(weather.wind.name.toLowerCase()),
                    WindIcon(degree: weather.wind.degree, size: 22),
                  ],
                ),
              ],
            ),
            if (selected != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  BoxedIcon(
                    WeatherIcons.fromString(selected.weatherType),
                    size: 51,
                  ),
                  Text(selected.weatherSummary),
                ],
              ),
          ],
        ),
      ),
    ];
  }
}