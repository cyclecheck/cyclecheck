import 'package:flutter/material.dart';

import 'package:cyclecheck/src/ui/screens/settings/widgets/temperature_settings.dart';
import 'package:cyclecheck/src/ui/screens/settings/widgets/windspeed_settings.dart';
import 'package:cyclecheck/src/ui/widgets/divider_text.dart';

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
