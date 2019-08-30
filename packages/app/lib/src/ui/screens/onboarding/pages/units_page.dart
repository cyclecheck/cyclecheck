import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cyclecheck/src/di/blocs.dart';
import 'package:cyclecheck/src/ui/screens/settings/blocs/settings_bloc.dart';
import 'package:cyclecheck/src/ui/screens/settings/widgets/unit_settings.dart';
import 'package:cyclecheck/src/ui/screens/onboarding/onboarding_screen.dart';
import 'package:cyclecheck/src/ui/widgets/accent_line.dart';

class UnitsPage extends OnboardingPage {
  static const routeName = "units";

  UnitsPage() : super("Preferred units");

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider.settings(),
      ],
      child: Container(
        child: Column(
          children: [
            Text("To get started I need to know which units you prefer."),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: _Units(),
            ),
          ],
        ),
      ),
    );
  }
}

class _Units extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsBloc>(context).settings;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "°${settings.isMetric ? "C" : "F"}",
              style: TextStyle(fontSize: 80),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AccentLine.vertical(height: 100),
            ),
            Text(
              settings.isMetric ? "km/h" : "mph",
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: UnitSelector(),
        ),
      ],
    );
  }
}
