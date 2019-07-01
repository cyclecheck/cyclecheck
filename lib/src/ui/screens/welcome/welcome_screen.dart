import 'package:flutter/material.dart';

import 'package:cyclecheck/src/ui/nav.dart';
import 'package:cyclecheck/src/ui/screens/widgets/screen.dart';
import 'package:cyclecheck/src/ui/widgets/accent_outline_button.dart';
import 'package:cyclecheck/src/ui/screens/widgets/screen_header.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = 'welcome';

  @override
  Widget build(BuildContext context) {
    return Screen(
      header: ScreenHeader(
        text: 'Welcome',
        children: [
          Container(
            width: 200,
            child: Text('To get started I need some information from you.'),
          ),
        ],
      ),
      children: [
        Expanded(
          child: Container(
            child: Text('Units:'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ContinueButton(),
        ),
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
