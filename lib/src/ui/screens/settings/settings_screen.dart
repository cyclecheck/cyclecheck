import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cyclecheck/src/config/colors.dart';
import 'package:cyclecheck/src/data/location/location.repository.dart';
import 'package:cyclecheck/src/data/settings/settings_repository.dart';
import 'package:cyclecheck/src/ui/screens/settings/blocs/location_bloc.dart';
import 'package:cyclecheck/src/ui/screens/settings/blocs/settings_bloc.dart';
import 'package:cyclecheck/src/ui/screens/settings/widgets/advanced_settings.dart';
import 'package:cyclecheck/src/ui/screens/settings/widgets/location_settings.dart';
import 'package:cyclecheck/src/ui/screens/settings/widgets/unit_settings.dart';
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
        scrollable: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: LocationSettings(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: UnitSettings(),
          ),
          AdvancedSettings(),
          Padding(padding: const EdgeInsets.only(top: 16.0)),
        ],
      ),
    );
  }
}
