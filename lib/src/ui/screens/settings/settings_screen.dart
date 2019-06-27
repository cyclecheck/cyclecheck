import 'package:flutter/material.dart';

import 'package:cyclecheck/src/ui/screens/widgets/screen_header.dart';
import 'package:cyclecheck/src/ui/screens/widgets/screen.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Screen(
      header: ScreenHeader(text: 'Settings'),
      children: [],
    );
  }
}
