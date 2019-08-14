import 'package:cyclecheck/src/ui/screens/settings/blocs/hidden_settings_bloc.dart';
import 'package:flutter/material.dart';

import 'package:cyclecheck/src/ui/screens/settings/widgets/temperature_settings.dart';
import 'package:cyclecheck/src/ui/screens/settings/widgets/windspeed_settings.dart';
import 'package:cyclecheck/src/ui/widgets/divider_text.dart';
import 'package:provider/provider.dart';

class AdvancedSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DividerText(
          text: "Advanced Settings",
          dividerWidth: 175,
        ),
        Container(
          width: 250,
          child: Text(
            "Set your desired ideal temperature and wind speed for cycling.  These settings will affect the CycleScore™",
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: TemperatureSettings(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: WindSpeedSettings(),
        ),
      ],
    );
  }
}

class HiddenSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HiddenSettingsBloc>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DividerText(
          text: "Hidden Settings",
          dividerWidth: 175,
        ),
        Container(
          width: 300,
          child:
              Text("Here be some secret settings, continue at your own risk!"),
        ),
        Row(
          children: [
            Text("Developer mode"),
            Switch(
              value: bloc.state.isDeveloperMode,
              onChanged: (value) => bloc.toggleDevMode(),
            ),
          ],
        ),
      ],
    );
  }
}
