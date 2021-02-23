import 'package:cyclecheck/src/config/dimens.dart';
import 'package:flutter/material.dart';

import 'package:cyclecheck/src/ui/screens/onboarding/buttons.dart';
import 'package:cyclecheck/src/ui/screens/widgets/screen.dart';
import 'package:cyclecheck/src/ui/screens/widgets/screen_header.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = "onboarding";

  final OnboardingPage page;
  final VoidCallback onNext;

  OnboardingScreen({
    Key key,
    @required this.page,
    @required this.onNext,
  })  : assert(page != null),
        assert(onNext != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Screen(
      header: ScreenHeader(
        text: page.title,
        dividerWidth: 300,
      ),
      constraints: Dimens.onboarding_page_width,
      children: [
        Expanded(child: page),
        OnboardingContinueButton(onNext),
      ],
    );
  }
}

abstract class OnboardingPage extends StatelessWidget {
  final String title;

  OnboardingPage(
    this.title, {
    Key key,
  })  : assert(title != null),
        super(key: key);
}

class OnboardingContinueButton extends StatelessWidget {
  final VoidCallback onNext;
  final Widget continueButton;

  OnboardingContinueButton(
    this.onNext, {
    Key key,
    this.continueButton,
  })  : assert(onNext != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: continueButton ?? ContinueButton(onPressed: onNext),
      ),
    );
  }
}
