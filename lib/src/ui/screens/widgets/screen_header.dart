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
        Text(
          text,
          style: Theme.of(context).textTheme.title,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2.0, bottom: 8),
          child: AccentLine(
            width: dividerWidth,
          ),
        ),
        ...children,
        Padding(
          padding: bottomPadding,
        )
      ],
    );
  }
}
