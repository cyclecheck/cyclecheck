import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

import 'package:cyclecheck/src/ui/screens/onboarding/onboarding_screen.dart';

class StartPage extends OnboardingPage {
  static const routeName = "start";

  final double _iconSize = 38.0;
  final double _spacerSize = 24.0;

  StartPage() : super("Let's get started");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Welcome to CycleCheck, the best tool a cyclist can have in their pocket.",
            style: TextStyle(fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Using a highly sophisticated algorithm, our scientists have invented a way to inform users of the ability to ride their bike.",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Row(
              children: [
                Icon(Icons.location_on, size: _iconSize),
                Icon(Icons.add, size: _spacerSize),
                BoxedIcon(WeatherIcons.rain, size: _iconSize),
                Icon(Icons.add, size: _spacerSize),
                BoxedIcon(WeatherIcons.thermometer, size: _iconSize),
                Text("=", style: TextStyle(fontSize: _iconSize)),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.directions_bike, size: _iconSize),
                ),
              ],
            ),
          ),
          Text(
            "In order for CycleCheck to work, we will need some basic information from you.  Press continue below to get started!",
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
