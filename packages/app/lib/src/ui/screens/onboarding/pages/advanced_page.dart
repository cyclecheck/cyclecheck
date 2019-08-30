import 'package:flutter/material.dart';

import 'package:cyclecheck/src/ui/screens/onboarding/onboarding_screen.dart';

class AdvancedPage extends OnboardingPage {
  static const routeName = "advanced";

  AdvancedPage() : super("Advanced settings");

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.red,
    );
  }
}
