import 'dart:math';

import 'package:cyclecheck/src/config/colors.dart';
import 'package:cyclecheck/src/config/dimens.dart';
import 'package:cyclecheck/src/ui/widgets/accent_line.dart';
import 'package:cyclecheck/src/util/datetime.dart';
import 'package:cyclecheck_api/cyclecheck_api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';

class HourForecast extends StatelessWidget {
  final WeatherBlock block;
  final bool selected;
  final Duration animateDuration;

  const HourForecast({
    Key key,
    @required this.block,
    this.selected = false,
    this.animateDuration = const Duration(milliseconds: 800),
  })  : assert(block != null),
        super(key: key);

  static const double ITEM_WIDTH = 80.0;

  @override
  Widget build(BuildContext context) {
    String format = DateFormat("h aa").format(block.forecastedTime);
    return AnimatedContainer(
      width: ITEM_WIDTH,
      padding: EdgeInsets.only(left: 12, right: 12, top: 8),
      duration: animateDuration,
      decoration: !selected
          ? null
          : BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.border_radius),
              color: selected ? AppColors.primaryDark : Colors.transparent,
            ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(padding: EdgeInsets.only(top: 4)),
          Text(
            isCurrentHour(block.forecastedTime) ? "now" : format.toLowerCase(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          AccentLine(width: 40, color: Colors.grey),
          Text("${block.temperature.round()}°"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: BoxedIcon(
              WeatherIcons.fromString(block.weatherType),
              size: 18,
            ),
          ),
          Text(
            "- - - - -",
            style: TextStyle(
              color: AppColors.accent,
            ),
          ),
          Text(
            block.wind.speed.round().toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text("km/h", style: TextStyle(fontSize: 11)),
          WindIcon(degree: block.wind.degree)
        ],
      ),
    );
  }
}
