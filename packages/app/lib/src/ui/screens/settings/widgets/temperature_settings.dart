import 'package:cyclecheck_api/cyclecheck_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cyclecheck/src/config/colors.dart';
import 'package:cyclecheck/src/config/constants.dart';
import 'package:cyclecheck/src/ui/screens/settings/blocs/settings_bloc.dart';

class TemperatureSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<SettingsBloc>(context);
    final values = RangeValues(
      bloc.settings.minTemp.toDouble(),
      bloc.settings.maxTemp.toDouble(),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Temps:"),
            RangeSlider(
              values: values,
              min: Constants.MAX_VALUE_MIN_TEMP,
              max: Constants.MAX_VALUE_MAX_TEMP,
              activeColor: AppColors.accent,
              inactiveColor: AppColors.primaryDark,
              onChanged: (values) {
                bloc.setTemperatures(values.start.round(), values.end.round());
              },
            ),
            IconButton(
              icon: Icon(Icons.restore, size: 22),
              onPressed: () => bloc.setTemperatures(
                CycleScoreSettings.DEFAULT_MIN_TEMP,
                CycleScoreSettings.DEFAULT_MAX_TEMP,
              ),
            ),
          ],
        ),
        Text(
          "Your ideal temperature is between ${bloc.settings.degrees(values.start)} and ${bloc.settings.degrees(values.end)}.",
        )
      ],
    );
  }
}
