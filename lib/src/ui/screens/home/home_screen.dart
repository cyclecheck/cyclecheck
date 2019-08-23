import 'package:cyclecheck/src/di/blocs.dart';
import 'package:cyclecheck/src/ui/screens/home/hour_forecast.dart';
import 'package:cyclecheck/src/ui/screens/home/min_max_temp_display.dart';
import 'package:cyclecheck/src/ui/screens/settings/blocs/settings_bloc.dart';
import 'package:cyclecheck/src/ui/widgets/accent_line.dart';
import 'package:cyclecheck_api/cyclecheck_api.dart';
import 'package:flutter/material.dart';

import 'package:cyclecheck/src/ui/screens/widgets/screen.dart';
import 'package:cyclecheck/src/ui/nav.dart';
import 'package:provider/provider.dart';
import 'package:weather_icons/weather_icons.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Screen(
      scrollable: true,
      appBarActions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () => Nav.toSettings(context),
        ),
      ],
      constraints: BoxConstraints(maxWidth: 300),
      children: [
        Text(
          "Should you bike today?",
          style: Theme.of(context).textTheme.headline,
        ),
        Text("Absolutely,"),
        Text(
          "Yes.",
          style: TextStyle(fontSize: 100),
        ),
        Text(
          "I would recommend that you bike today, the next few hours are ideal.",
        ),
        Padding(padding: EdgeInsets.only(bottom: 32)),
        Text("Details", style: Theme.of(context).textTheme.subtitle),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: AccentLine(width: double.infinity),
        ),
        Text("Last updated 20 minutes ago.", style: TextStyle(fontSize: 11)),
        Padding(padding: EdgeInsets.only(bottom: 16)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    MinTempDisplay(value: 18),
                    Padding(padding: EdgeInsets.only(right: 4)),
                    MaxTempDisplay(value: 28),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 16)),
                Text("12-14 km/h"),
                Row(
                  children: [
                    Text("northwest"),
                    WindIcon(degree: 32, size: 18),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BoxedIcon(WeatherIcons.fire, size: 51),
                Text("mostly cloudy"),
              ],
            ),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 16)),
        Row(
          children: <Widget>[
            HourForecast(block: _block),
            HourForecast(block: _block),
            HourForecast(block: _block),
            HourForecast(block: _block),
          ],
        ),
      ],
    );
  }

  final WeatherBlock _block = WeatherBlock(
    forecastedTime: DateTime.now(),
    temperature: 25,
    apparentTemperature: 29,
    cloudPercent: .4,
    humidity: .2,
    uvIndex: 8,
    wind: Wind(degree: 170, gust: 20, speed: 17, label: "NW"),
    precipitation: Precipitation(intensity: .4, probability: .6),
    weatherType: "wi-day-sunny-overcast",
    score: Score(reasons: [], warnings: [], value: 1),
  );
}
