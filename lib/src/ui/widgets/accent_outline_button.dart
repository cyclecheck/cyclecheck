import 'package:cyclecheck/src/config/colors.dart';
import 'package:cyclecheck/src/config/dimens.dart';

import 'package:flutter/material.dart';

class AccentOutlineButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const AccentOutlineButton({
    Key key,
    @required this.child,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: this.child,
      highlightedBorderColor: AppColors.accent,
      borderSide: BorderSide(
        color: AppColors.accent,
        width: 2.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.circle_radius),
      ),
      onPressed: this.onPressed,
    );
  }
}
