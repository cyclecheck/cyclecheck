import 'package:flutter/material.dart';

import 'package:cyclecheck/src/ui/screens/about/about_screen.dart';
import 'package:cyclecheck/src/ui/screens/home/home_screen.dart';
import 'package:cyclecheck/src/ui/screens/settings/settings_screen.dart';
import 'package:cyclecheck/src/ui/screens/splash/splash_screen.dart';
import 'package:cyclecheck/src/ui/screens/onboarding/pages/start_page.dart';
import 'package:cyclecheck/src/ui/screens/onboarding/onboarding_screen.dart';

class Nav {
  static String get initialRoute => SplashScreen.routeName;

  static Map<String, WidgetBuilder> buildRoutes(BuildContext context) {
    return {
      SplashScreen.routeName: (context) => SplashScreen(),
      OnboardingScreen.routeName: (context) => OnboardingScreen(
            page: StartPage(),
            onNext: () {},
          ),
      HomeScreen.routeName: (context) => HomeScreen(),
      SettingsScreen.routeName: (context) => SettingsScreen(),
      AboutScreen.routeName: (context) => AboutScreen(),
    };
  }

  static toSplash(BuildContext context) {
    _navigate(context, SplashScreen.routeName, clear: true);
  }

  static toOnboarding(BuildContext context) {
    _navigate(context, OnboardingScreen.routeName, clear: true);
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
