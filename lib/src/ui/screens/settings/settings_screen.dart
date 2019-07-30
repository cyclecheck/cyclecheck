import 'package:cyclecheck/src/config/colors.dart';
import 'package:cyclecheck/src/ui/widgets/accent_line.dart';
import 'package:cyclecheck/src/ui/widgets/divider_text.dart';
import 'package:cyclecheck_api/cyclecheck_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cyclecheck/src/data/location/location.repository.dart';
import 'package:cyclecheck/src/data/settings/settings_repository.dart';
import 'package:cyclecheck/src/ui/screens/settings/blocs/location_bloc.dart';
import 'package:cyclecheck/src/ui/screens/settings/widgets/location_settings.dart';
import 'package:cyclecheck/src/ui/screens/settings/widgets/unit_settings.dart';
import 'package:cyclecheck/src/ui/screens/settings/blocs/settings_bloc.dart';
import 'package:cyclecheck/src/ui/screens/widgets/screen_header.dart';
import 'package:cyclecheck/src/ui/screens/widgets/screen.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    final _settingsRepository = Provider.of<SettingsRepository>(context);
    final _locationRepository = Provider.of<LocationRepository>(context);
    final providers = [
      ChangeNotifierProvider(
        builder: (_) => SettingsBloc(_settingsRepository),
      ),
      ChangeNotifierProvider(
        builder: (_) => LocationBloc(_settingsRepository, _locationRepository),
      ),
    ];

    return MultiProvider(
      providers: providers,
      child: Screen(
        titleText: Text("Settings"),
        titleColor: AppColors.primary,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: LocationSettings(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: UnitSettings(),
          ),
          DividerText(
            text: "Advanced Settings",
            dividerWidth: 175,
          ),
          Container(
            width: 250,
            child: Text(
                "Set your desired ideal temperature and wind speed for cycling."),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TemperatureSettings(),
          ),
        ],
      ),
    );
  }
}

class TemperatureSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<SettingsBloc>(context);
    final test = RangeValues(
      bloc.settings.minTemp.toDouble(),
      bloc.settings.maxTemp.toDouble(),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("Temperature:"),
            RangeSlider(
              values: test,
              min: -30,
              max: 50,
              activeColor: AppColors.accent,
              inactiveColor: AppColors.primaryDark,
              onChanged: (values) {
                bloc.setTemperatures(values.start, values.end);
              },
            ),
          ],
        ),
        Text(
          "Your ideal temperature ${bloc.settings.degrees(test.start)} and ${bloc.settings.degrees(test.end)}.",
        )
      ],
    );
  }
}
