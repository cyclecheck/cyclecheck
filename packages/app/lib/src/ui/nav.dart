import 'package:cyclecheck/src/ui/screens/onboarding/pages/final_page.dart';
import 'package:flutter/material.dart';

import 'package:cyclecheck/src/ui/screens/about/about_screen.dart';
import 'package:cyclecheck/src/ui/screens/home/home_screen.dart';
import 'package:cyclecheck/src/ui/screens/onboarding/pages/location_page.dart';
import 'package:cyclecheck/src/ui/screens/onboarding/pages/units_page.dart';
import 'package:cyclecheck/src/ui/screens/settings/settings_screen.dart';
import 'package:cyclecheck/src/ui/screens/splash/splash_screen.dart';
import 'package:cyclecheck/src/ui/screens/onboarding/pages/start_page.dart';
import 'package:cyclecheck/src/ui/screens/onboarding/onboarding_screen.dart';

class Nav {
  static const String _onboardingRoute = "onboarding";

  static String get initialRoute => SplashScreen.routeName;

  static Map<String, WidgetBuilder> buildRoutes(BuildContext context) {
    return {
      SplashScreen.routeName: (context) => SplashScreen(),
      HomeScreen.routeName: (context) => HomeScreen(),
      SettingsScreen.routeName: (context) => SettingsScreen(),
      AboutScreen.routeName: (context) => AboutScreen(),
    }..addAll(_onboardingRoutes);
  }

  static final Map<String, WidgetBuilder> _onboardingRoutes = {
    OnboardingScreen.routeName: (context) => OnboardingScreen(
          page: StartPage(),
          onNext: () => _navigate(context, UnitsPage.routeName),
        ),
    UnitsPage.routeName: (context) => OnboardingScreen(
          page: UnitsPage(),
          onNext: () => _navigate(context, LocationPage.routeName),
        ),
    LocationPage.routeName: (context) => LocationPage(
          onNext: () => _navigate(context, FinalPage.routeName),
        ),
    FinalPage.routeName: (context) => FinalPage(onNext: () => toHome(context)),
  };

  static toSplash(BuildContext context) {
    _navigate(context, SplashScreen.routeName, clear: true);
  }

  static toOnboarding(BuildContext context) {
    _navigate(context, _onboardingRoute, clear: true);
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
    final nav = Navigator.of(context);

    clear
        ? nav.pushNamedAndRemoveUntil(destination, (_) => false)
        : nav.pushNamed(destination);
  }
}
