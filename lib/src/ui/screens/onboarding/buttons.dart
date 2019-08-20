import 'package:flutter/material.dart';

import 'package:cyclecheck/src/ui/widgets/accent_icon_button.dart';

class PreviousButton extends StatelessWidget {
  final VoidCallback onPressed;

  PreviousButton({
    Key key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AccentIconButton(
      text: "Previous",
      leading: Icon(Icons.arrow_back),
      onPressed: onPressed ?? Navigator.of(context).pop(),
    );
  }
}

class ContinueButton extends StatelessWidget {
  final VoidCallback onPressed;

  ContinueButton({
    Key key,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AccentIconButton(
      text: "Continue",
      trailing: Icon(Icons.arrow_forward),
      onPressed: onPressed,
    );
  }
}
