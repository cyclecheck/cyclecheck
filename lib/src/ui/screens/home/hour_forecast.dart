import 'package:cyclecheck/src/config/colors.dart';
import 'package:cyclecheck/src/ui/widgets/accent_line.dart';
import 'package:cyclecheck_api/cyclecheck_api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';

class HourForecast extends StatelessWidget {
  final WeatherBlock block;

  const HourForecast({
    Key key,
    @required this.block,
  })  : assert(block != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    String format = DateFormat("h aa").format(block.forecastedTime);
    return Container(
      width: 50,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(format.toLowerCase()),
          AccentLine(width: double.infinity, color: Colors.grey),
          Text("${block.temperature.round()}°"),
          BoxedIcon(WeatherIcons.fromString(block.weatherType)),
          Text(
            "-- --",
            style: TextStyle(
              color: AppColors.accent,
            ),
          ),
          Text(block.wind.speed.round().toString()),
          Text("km/h", style: TextStyle(fontSize: 11)),
          WindIcon(degree: block.wind.degree),
        ],
      ),
    );
  }
}
