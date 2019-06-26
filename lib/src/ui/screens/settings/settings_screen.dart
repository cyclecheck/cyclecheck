import 'package:flutter/material.dart';

import 'package:cyclecheck/src/ui/screens/screen.dart';

class SettingsScreen extends StatelessScreen {
  static const routeName = '/settings';

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Text('Settings'),
        ],
      ),
    );
  }
}
