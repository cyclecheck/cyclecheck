import 'package:cyclecheck/src/ui/widgets/accent_outline_button.dart';
import 'package:flutter/material.dart';

import 'package:cyclecheck/src/ui/screens/screen.dart';
import 'package:cyclecheck/src/ui/widgets/accent_line.dart';
import 'package:cyclecheck/src/ui/nav.dart';

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
            Flexible(
              flex: 9,
              child: _welcomeSettings(context),
            ),
            Flexible(
              flex: 1,
              child: _buildFooter(context),
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

  Widget _buildFooter(BuildContext context) {
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
