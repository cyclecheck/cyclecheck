import 'package:cyclecheck/src/ui/screens/about/about_url_item.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

import 'package:cyclecheck/src/config/assets.dart';
import 'package:cyclecheck/src/ui/screens/about/about_url.dart';
import 'package:cyclecheck/src/ui/screens/widgets/screen.dart';
import 'package:cyclecheck/src/ui/widgets/empty.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = '/about';

  final Future<PackageInfo> _packageInfo = PackageInfo.fromPlatform();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Screen(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
        AboutUrlItem(
          AboutUrl("About", Icons.help, null),
          onTap: () => showAboutDialog(context: context),
        )
      ],
    );
  }

  Future<String> _getVersionAndBuildNumber() async {
    final info = await _packageInfo;
    return 'Version: ${info.version} (${info.buildNumber})';
  }
}
