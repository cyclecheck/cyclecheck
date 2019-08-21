import 'package:cyclecheck/src/di/blocs.dart';
import 'package:cyclecheck/src/ui/screens/settings/blocs/settings_bloc.dart';
import 'package:cyclecheck/src/ui/widgets/accent_line.dart';
import 'package:cyclecheck_api/cyclecheck_api.dart';
import 'package:flutter/material.dart';

import 'package:cyclecheck/src/ui/screens/widgets/screen.dart';
import 'package:cyclecheck/src/ui/nav.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Screen(
      scrollable: true,
      appBarActions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () => Nav.toSettings(context),
        ),
      ],
      constraints: BoxConstraints(maxWidth: 300),
      children: [
        Text(
          "Should you bike today?",
          style: Theme.of(context).textTheme.headline,
        ),
        Text("Absolutely,"),
        Text(
          "Yes.",
          style: TextStyle(fontSize: 100),
        ),
        Text(
          "I would recommend that you bike today, the next few hours are ideal.",
        ),
        Padding(padding: EdgeInsets.only(bottom: 32)),
        Text("Details", style: Theme.of(context).textTheme.subtitle),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: AccentLine(width: double.infinity),
        ),
      ],
    );
  }
}
