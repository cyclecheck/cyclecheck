import 'package:flutter/material.dart';

import 'package:cyclecheck/src/ui/screens/widgets/screen.dart';
import 'package:cyclecheck/src/ui/nav.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Screen(
      children: [
        Text('CycleCheck Home screen'),
        RaisedButton(
          child: Text('Welcome'),
          onPressed: () => Nav.toOnboarding(context),
        ),
        RaisedButton(
          child: Text('Settings'),
          onPressed: () => Nav.toSettings(context),
        ),
        RaisedButton(
          child: Text('About'),
          onPressed: () => Nav.toAbout(context),
        ),
      ],
    );
  }
}
