import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

import 'package:cyclecheck/src/config/assets.dart';
import 'package:cyclecheck/src/ui/screens/about/about_url.dart';
import 'package:cyclecheck/src/ui/screens/screen.dart';
import 'package:cyclecheck/src/ui/widgets/empty.dart';

class AboutScreen extends StatelessScreen {
  static const routeName = '/about';

  final Future<PackageInfo> _packageInfo = PackageInfo.fromPlatform();

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildAboutWidgets(context),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildAboutWidgets(BuildContext context) {
    final theme = Theme.of(context);
    return [
      InkWell(
        child: Image.asset(
          Assets.ic_logo,
          width: 100,
          height: 100,
        ),
      ),
      Text(
        'CycleCheck',
        style: theme.textTheme.title,
      ),
      FutureBuilder<String>(
        future: _getVersionAndBuildNumber(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return snapshot.hasData
              ? Text(snapshot.data, style: theme.textTheme.subtitle)
              : Empty.min();
        },
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
      ),
      ...AboutUrl.items,
    ];
  }

  Future<String> _getVersionAndBuildNumber() async {
    final info = await _packageInfo;
    return 'Version: ${info.version} (${info.buildNumber})';
  }
}
