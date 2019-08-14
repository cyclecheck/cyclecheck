import 'package:cyclecheck/src/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cyclecheck/src/config/assets.dart';
import 'package:cyclecheck/src/ui/nav.dart';
import 'package:cyclecheck/src/data/settings/settings_repository.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = 'splash';

  const SplashScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _determineStart(context);

    return Scaffold(
      body: Center(
        child: InkWell(
          child: Image.asset(
            Assets.ic_logo,
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }

  _determineStart(BuildContext context) async {
    final settingsRepo = Provider.of<SettingsRepo>(context);

    if (Constants.DELAY_SPLASH_SCREEN > 0) {
      await Future.delayed(
        Duration(milliseconds: Constants.DELAY_SPLASH_SCREEN),
      );
    }

    await settingsRepo.hasCompletedOnboarding()
        ? Nav.toHome(context)
        : Nav.toWelcome(context);
  }
}
