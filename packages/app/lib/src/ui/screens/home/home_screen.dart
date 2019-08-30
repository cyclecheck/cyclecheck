import 'package:cyclecheck/src/di/blocs.dart';
import 'package:cyclecheck/src/ui/screens/home/bloc/cyclescore_bloc.dart';
import 'package:cyclecheck/src/ui/screens/home/widget/forecast_list.dart';
import 'package:cyclecheck/src/ui/screens/home/widget/hour_forecast.dart';
import 'package:cyclecheck/src/ui/screens/home/widget/min_max_temp_display.dart';
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
    return _alt(context);
    // return Screen(
    //   scrollable: true,
    //   appBarActions: [
    //     IconButton(
    //       icon: Icon(Icons.settings),
    //       onPressed: () => Nav.toSettings(context),
    //     ),
    //   ],
    //   // constraints: BoxConstraints(maxWidth: 300),
    //   providers: [
    //     BlocProvider.cycleScore(),
    //   ],
    //   children: [
    //     ScoreDisplay(),
    //     Padding(padding: EdgeInsets.only(bottom: 32)),
    //     WeatherDetails(),
    //     ForecastList(),
    //   ],
    // );
  }

  Widget _alt(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: MultiProvider(
        providers: [
          BlocProvider.cycleScore(),
        ],
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 32.0, top: 10.0),
                      child: Column(
                        children: [
                          ScoreDisplay(),
                          Padding(padding: const EdgeInsets.only(bottom: 32)),
                          WeatherDetails(),
                        ],
                      ),
                    ),
                    ForecastList(),
                  ],
                ),
              ),
              Positioned(
                top: 0.0,
                left: 0.0,
                right: 0.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () => Nav.toSettings(context),
                    ),
                    Consumer<CycleScoreBloc>(
                      builder: (context, bloc, child) {
                        return IconButton(
                          icon: Icon(Icons.refresh),
                          onPressed: () => bloc.fetchCycleScore(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
