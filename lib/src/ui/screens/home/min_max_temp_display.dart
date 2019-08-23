import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class MinTempDisplay extends _MinMaxTempDisplay {
  const MinTempDisplay({
    Key key,
    @required double value,
  }) : super(
          key: key,
          value: value,
          text: "min",
          icon: WeatherIcons.thermometer_exterior,
        );
}

class MaxTempDisplay extends _MinMaxTempDisplay {
  const MaxTempDisplay({
    Key key,
    @required double value,
  }) : super(
          key: key,
          value: value,
          text: "max",
          icon: WeatherIcons.thermometer,
        );
}

abstract class _MinMaxTempDisplay extends StatelessWidget {
  final IconData icon;
  final String text;
  final double value;

  const _MinMaxTempDisplay({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.value,
  })  : assert(icon != null),
        assert(text != null),
        assert(value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BoxedIcon(icon),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$value°",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(text),
          ],
        ),
      ],
    );
  }
}
