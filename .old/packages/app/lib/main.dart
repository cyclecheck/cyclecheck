import 'package:cyclecheck/src/ui/screens/settings/blocs/location_bloc.dart';
import 'package:flutter/material.dart';

import 'package:cyclecheck/src/config/colors.dart';
import 'package:cyclecheck/src/data/cyclescore/cyclescore_repository.dart';
import 'package:cyclecheck/src/data/location/location.repository.dart';
import 'package:cyclecheck/src/data/settings/settings_repository.dart';
import 'package:cyclecheck/src/ui/nav.dart';
import 'package:cyclecheck/src/ui/screens/settings/blocs/hidden_settings_bloc.dart';
import 'package:cyclecheck/src/ui/screens/settings/blocs/settings_bloc.dart';
import 'package:provider/provider.dart';

void main() => runApp(CycleCheck());

class CycleCheck extends StatelessWidget {
  final _settingsRepo = SettingsRepo();
  final _locationRepo = LocationRepo();
  final _cycleScoreRepo = CycleScoreRepo();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SettingsRepo>.value(value: _settingsRepo),
        Provider<LocationRepo>.value(value: _locationRepo),
        Provider<CycleScoreRepo>.value(value: _cycleScoreRepo),
        ChangeNotifierProvider<SettingsBloc>.value(
          value: SettingsBloc(_settingsRepo),
        ),
        ChangeNotifierProvider<HiddenSettingsBloc>.value(
          value: HiddenSettingsBloc(_settingsRepo),
        ),
        ChangeNotifierProvider<LocationBloc>.value(
          value: LocationBloc(_settingsRepo, _locationRepo),
        ),
      ],
      child: MaterialApp(
        title: 'CycleCheck',
        theme: _buildTheme(),
        initialRoute: Nav.initialRoute,
        routes: Nav.buildRoutes(context),
      ),
    );
  }

  ThemeData _buildTheme() {
    final base = ThemeData.dark();
    return base.copyWith(
      primaryColor: AppColors.primary,
      accentColor: AppColors.accent,
      buttonColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.primary,
      textTheme: base.textTheme.copyWith(
        // headline: TextStyle(fontSize: 60.0, color: AppColors.textColor),
        title: TextStyle(fontSize: 35, color: AppColors.textColor),
        subtitle: TextStyle(fontSize: 18, color: AppColors.textColor),
        body1: TextStyle(fontSize: 15, color: AppColors.textColor),
        body2: TextStyle(fontSize: 12, color: AppColors.textColor),
      ),
    );
  }
}
