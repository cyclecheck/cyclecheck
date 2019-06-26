import 'package:flutter/material.dart';

import 'package:cyclecheck/src/ui/screens/screen.dart';
import 'package:cyclecheck/src/ui/nav.dart';

class HomeScreen extends StatelessScreen {
  static const routeName = '/';

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('CycleCheck Home screen'),
            RaisedButton(
              child: Text('Settings'),
              onPressed: () => Nav.toSettings(context),
            ),
            RaisedButton(
              child: Text('About'),
              onPressed: () => Nav.toAbout(context),
            ),
          ],
        ),
      ),
    );
  }
}
