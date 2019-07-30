import 'package:flutter/material.dart';

import 'package:cyclecheck/src/ui/widgets/accent_line.dart';

class DividerText extends StatelessWidget {
  final double dividerWidth;
  final String text;
  final TextStyle textStyle;

  const DividerText({
    Key key,
    @required this.dividerWidth,
    @required this.text,
    this.textStyle,
  })  : assert(dividerWidth != null && dividerWidth > 0),
        assert(text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme.subtitle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: textStyle != null ? theme.merge(textStyle) : theme,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3.0, bottom: 8),
          child: AccentLine(
            width: dividerWidth,
          ),
        ),
      ],
    );
  }
}
