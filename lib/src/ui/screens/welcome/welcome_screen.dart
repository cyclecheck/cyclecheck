import 'package:flutter/material.dart';

import 'package:cyclecheck/src/ui/nav.dart';
import 'package:cyclecheck/src/ui/widgets/accent_line.dart';
import 'package:cyclecheck/src/ui/widgets/accent_outline_button.dart';
import 'package:cyclecheck/src/ui/screens/screen.dart';

class WelcomeScreen extends StatelessScreen {
  static const routeName = 'welcome';

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _welcomeSettings(context),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ContinueButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _welcomeSettings(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome',
          style: theme.textTheme.title,
        ),
        AccentLine(width: 200),
      ],
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AccentOutlineButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Continue'),
              Icon(Icons.chevron_right),
            ],
          ),
          onPressed: () => Nav.toHome(context),
        ),
      ],
    );
  }
}
