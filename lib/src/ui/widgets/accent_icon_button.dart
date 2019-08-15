import 'package:flutter/material.dart';

import 'package:cyclecheck/src/ui/widgets/accent_outline_button.dart';

class AccentIconButton extends StatelessWidget {
  final String text;
  final IconData leading;
  final IconData trailing;
  final VoidCallback onPressed;

  const AccentIconButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.leading,
    this.trailing,
  })  : assert(text != null && onPressed != null),
        assert(leading != null || trailing != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AccentOutlineButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) Icon(leading),
          Text(text),
          if (trailing != null) Icon(trailing),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
