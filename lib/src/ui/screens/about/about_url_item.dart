import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about_url.dart';

class AboutUrlItem extends StatelessWidget {
  final AboutUrl _url;

  const AboutUrlItem(this._url);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(_url.icon),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(_url.text),
            ),
          ],
        ),
      ),
      onTap: () {
        _launchUrl(_url.url);
      },
    );
  }

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
