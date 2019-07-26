import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cyclecheck_api/cyclecheck_api.dart';

import 'package:cyclecheck/src/config/styles.dart';
import 'package:cyclecheck/src/ui/screens/settings/blocs/settings_bloc.dart';
import 'package:cyclecheck/src/ui/widgets/accent_outline_button.dart';

class UnitSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Units:',
          style: Styles.txt_setting_title,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: UnitSelector(),
        ),
      ],
    );
  }
}

class UnitSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsBloc>(
      builder: (context, value, child) {
        final isMetric = value.settings.isMetric;
        final metric = Text('Metric');
        final imperial = Text('Imperial');

        return Row(
          children: [
            AccentToggleButton(
              child: metric,
              isToggled: isMetric,
              onPressed: () {
                if (!isMetric) value.setUnit(Unit.METRIC);
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
            ),
            AccentToggleButton(
              child: imperial,
              isToggled: !isMetric,
              onPressed: () {
                if (isMetric) value.setUnit(Unit.IMPERIAL);
              },
            )
          ],
        );
      },
    );
  }
}
