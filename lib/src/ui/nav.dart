import 'package:flutter/material.dart';

import 'package:cyclecheck/src/ui/screens/welcome/welcome_screen.dart';
import 'package:cyclecheck/src/ui/screens/about/about_screen.dart';
import 'package:cyclecheck/src/ui/screens/home/home_screen.dart';
import 'package:cyclecheck/src/ui/screens/settings/settings_screen.dart';

class Nav {
  static String initialRoute(BuildContext context) {
    // TODO: Get the value from the sharedpreferences
    bool isFirstRun = true;
    return isFirstRun ? WelcomeScreen.routeName : HomeScreen.routeName;
  }

  static Map<String, WidgetBuilder> buildRoutes(BuildContext context) {
    return {
      WelcomeScreen.routeName: (context) => WelcomeScreen(),
      HomeScreen.routeName: (context) => HomeScreen(),
      SettingsScreen.routeName: (context) => SettingsScreen(),
      AboutScreen.routeName: (context) => AboutScreen(),
    };
  }

  static toWelcome(BuildContext context) {
    _navigate(context, WelcomeScreen.routeName, clear: true);
  }

  static toHome(BuildContext context) {
    _navigate(context, HomeScreen.routeName, clear: true);
  }

  static toSettings(BuildContext context) {
    _navigate(context, SettingsScreen.routeName);
  }

  static toAbout(BuildContext context) {
    _navigate(context, AboutScreen.routeName);
  }

  static _navigate(
    BuildContext context,
    String destination, {
    bool clear = false,
  }) {
    final navMethod =
        clear ? Navigator.pushReplacementNamed : Navigator.pushNamed;
    navMethod(context, destination);
  }
}
