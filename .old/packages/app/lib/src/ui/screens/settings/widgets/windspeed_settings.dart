import 'package:cyclecheck_api/cyclecheck_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cyclecheck/src/config/colors.dart';
import 'package:cyclecheck/src/config/constants.dart';
import 'package:cyclecheck/src/ui/screens/settings/blocs/settings_bloc.dart';

class WindSpeedSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<SettingsBloc>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Wind Speed:"),
            Slider(
              value: bloc.settings.maxWind.toDouble(),
              min: 0,
              max: Constants.MAX_VALUE_WIND,
              activeColor: AppColors.accent,
              inactiveColor: AppColors.primaryDark,
              onChanged: (value) => bloc.setWindSpeed(value.round()),
            ),
            IconButton(
              icon: Icon(Icons.restore, size: 22),
              onPressed: () => bloc.setWindSpeed(
                CycleScoreSettings.DEFAULT_MAX_WIND,
              ),
            ),
          ],
        ),
        Text(
          "Your ideal wind speed is less than ${bloc.settings.windValue}.",
        )
      ],
    );
  }
}
