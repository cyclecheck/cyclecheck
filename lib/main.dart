import 'package:flutter/material.dart';

import 'package:cyclecheck/src/data/settings/settings_service.dart';
import 'package:cyclecheck/src/data/settings/settings_repository.dart';
import 'package:cyclecheck/src/config/colors.dart';
import 'package:cyclecheck/src/ui/nav.dart';
import 'package:provider/provider.dart';

void main() => runApp(CycleCheck());

class CycleCheck extends StatelessWidget {
  final _settingsRepository = SettingsRepository();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SettingsRepository>.value(value: _settingsRepository),
      ],
      child: MaterialApp(
        title: 'CycleCheck',
        theme: _buildTheme(),
        initialRoute: Nav.initialRoute(context),
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
        headline: TextStyle(fontSize: 60.0, color: AppColors.textColor),
        title: TextStyle(fontSize: 35, color: AppColors.textColor),
        subtitle: TextStyle(fontSize: 20, color: AppColors.textColor),
        body1: TextStyle(fontSize: 15, color: AppColors.textColor),
        body2: TextStyle(fontSize: 12, color: AppColors.textColor),
      ),
    );
  }
}
