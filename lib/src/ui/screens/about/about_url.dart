import 'package:flutter/material.dart';

import 'about_url_item.dart';

class AboutUrl {
  final String text;
  final IconData icon;
  final String url;

  const AboutUrl(this.text, this.icon, this.url);

  static const List<AboutUrl> _all = [
    AboutUrl(
      'Learn more',
      Icons.web,
      'https://cyclecheck.app',
    ),
    AboutUrl(
      'View source',
      Icons.code,
      'https://github.com/cyclecheck/cyclecheck',
    ),
    AboutUrl(
      'By Jordon de Hoog (jordond)',
      Icons.person,
      'https://github.com/jordond',
    ),
    AboutUrl(
      'Powered by Dark Sky',
      Icons.cloud,
      'https://darksky.net/poweredby/',
    ),
  ];

  static final List<AboutUrlItem> items =
      _all.map((current) => AboutUrlItem(current)).toList();
}
