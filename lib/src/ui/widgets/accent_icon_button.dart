import 'package:flutter/material.dart';

import 'package:cyclecheck/src/ui/widgets/accent_outline_button.dart';

class AccentIconButton extends StatelessWidget {
  final String text;
  final Icon leading;
  final Icon trailing;
  final double padding;
  final VoidCallback onPressed;

  const AccentIconButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.leading,
      this.trailing,
      this.padding = 8.0})
      : assert(text != null && onPressed != null),
        assert(leading != null || trailing != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AccentOutlineButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) leading,
          Padding(
            padding: _buildPadding(),
            child: Text(text),
          ),
          if (trailing != null) trailing,
        ],
      ),
      onPressed: onPressed,
    );
  }

  EdgeInsets _buildPadding() {
    if (leading != null && trailing != null)
      return EdgeInsets.symmetric(horizontal: padding);
    else if (leading != null)
      return EdgeInsets.only(left: padding);
    else if (trailing != null) return EdgeInsets.only(right: padding);

    return null;
  }
}
