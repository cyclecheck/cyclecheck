import 'package:flutter/material.dart';

import 'package:cyclecheck/src/ui/widgets/accent_line.dart';

class ScreenHeader extends StatelessWidget {
  final String text;
  final double dividerWidth;

  const ScreenHeader({
    Key key,
    @required this.text,
    this.dividerWidth = 250.0,
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
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: AccentLine(
            width: dividerWidth,
          ),
        )
      ],
    );
  }
}
