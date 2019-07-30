import 'package:cyclecheck/src/ui/widgets/divider_text.dart';
import 'package:flutter/material.dart';

import 'package:cyclecheck/src/ui/widgets/accent_line.dart';

class ScreenHeader extends StatelessWidget {
  final String text;
  final double dividerWidth;
  final List<Widget> children;
  final EdgeInsets bottomPadding;

  const ScreenHeader({
    Key key,
    @required this.text,
    this.dividerWidth = 250.0,
    this.children = const [],
    this.bottomPadding = const EdgeInsets.only(bottom: 32.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DividerText(
          dividerWidth: dividerWidth,
          text: text,
          textStyle: Theme.of(context).textTheme.title,
        ),
        ...children,
        Padding(
          padding: bottomPadding,
        )
      ],
    );
  }
}
