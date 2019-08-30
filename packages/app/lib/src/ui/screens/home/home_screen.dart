import 'package:cyclecheck/src/di/blocs.dart';
import 'package:cyclecheck/src/ui/screens/home/bloc/cyclescore_bloc.dart';
import 'package:cyclecheck/src/ui/screens/home/widget/forecast_list.dart';
import 'package:cyclecheck/src/ui/screens/home/widget/hour_forecast.dart';
import 'package:cyclecheck/src/ui/screens/home/min_max_temp_display.dart';
import 'package:cyclecheck/src/ui/screens/home/widget/score_display.dart';
import 'package:cyclecheck/src/ui/screens/home/widget/weather_details.dart';
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
      // constraints: BoxConstraints(maxWidth: 300),
      providers: [
        BlocProvider.cycleScore(),
      ],
      children: [
        ScoreDisplay(),
        Padding(padding: EdgeInsets.only(bottom: 32)),
        WeatherDetails(),
        ForecastList(),
      ],
    );
  }
}
