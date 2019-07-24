import 'package:cyclecheck/src/data/settings/settings_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cyclecheck/src/ui/screens/settings/settings_state.dart';
import 'package:cyclecheck/src/ui/widgets/accent_outline_button.dart';
import 'package:cyclecheck/src/ui/screens/widgets/screen_header.dart';
import 'package:cyclecheck/src/ui/screens/widgets/screen.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    final _settingsRepository = Provider.of<SettingsRepository>(context);
    return ChangeNotifierProvider(
      builder: (_) => SettingsState(_settingsRepository),
      child: Screen(
        header: ScreenHeader(text: 'Settings'),
        children: [
          Text('Units:'),
          Row(
            children: [
              AccentOutlineButton(
                child: Text('Metric'),
                onPressed: () {},
              ),
              AccentOutlineButton(
                child: Text('Imperial'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}

class UnitSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsState>(
      builder: (context, value, child) {
        final isMetric = value.settings.isMetric;
      },
    );
  }
}
