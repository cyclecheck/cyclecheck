import 'package:flutter/material.dart';

import 'package:cyclecheck/src/ui/screens/onboarding/buttons.dart';
import 'package:cyclecheck/src/ui/screens/widgets/screen.dart';
import 'package:cyclecheck/src/ui/screens/widgets/screen_header.dart';

class OnboardingScreen extends StatelessWidget {
  static const routeName = 'welcome';

  final OnboardingPage page;
  final bool showPrevious;
  final VoidCallback onNext;

  OnboardingScreen({
    Key key,
    @required this.page,
    @required this.onNext,
    this.showPrevious = false,
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
      constraints: BoxConstraints(maxWidth: 330),
      children: [
        Expanded(child: page),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (page.showPrevious) PreviousButton(),
              ContinueButton(onPressed: onNext)
            ],
          ),
        ),
      ],
    );
  }
}

abstract class OnboardingPage extends StatelessWidget {
  final String title;
  final bool showPrevious;

  OnboardingPage(
    this.title, {
    Key key,
    this.showPrevious,
  })  : assert(title != null),
        super(key: key);
}
