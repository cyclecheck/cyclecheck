import 'package:flutter/material.dart';

import 'package:cyclecheck/src/ui/screens/onboarding/onboarding_screen.dart';

class FinalPage extends OnboardingPage {
  static const routeName = "final";

  FinalPage() : super("Ready to go!");

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.pink,
    );
  }
}
