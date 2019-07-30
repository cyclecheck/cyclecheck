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
          children: [
            Text("Wind Speed:"),
            Slider(
              value: bloc.settings.maxWind.toDouble(),
              min: 0,
              max: Constants.MAX_VALUE_WIND,
              activeColor: AppColors.accent,
              inactiveColor: AppColors.primaryDark,
              onChanged: (value) => bloc.setWindSpeed(value),
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
