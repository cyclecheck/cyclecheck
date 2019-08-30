import 'package:flutter/material.dart';

import 'package:cyclecheck/src/config/colors.dart';
import 'package:cyclecheck/src/config/dimens.dart';

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
      child: child,
      highlightedBorderColor: AppColors.accent,
      highlightColor: AppColors.accent,
      borderSide: BorderSide(
        color: AppColors.accent,
        width: 2.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.circle_radius),
      ),
      onPressed: onPressed,
    );
  }
}

class AccentToggleButton extends StatelessWidget {
  final bool isToggled;
  final Function onPressed;
  final Widget child;

  const AccentToggleButton({
    Key key,
    @required this.isToggled,
    @required this.onPressed,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isToggled
        ? FlatButton(
            child: child,
            onPressed: () {},
            textColor: AppColors.textColor,
            color: AppColors.accent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.circle_radius),
            ),
          )
        : AccentOutlineButton(
            child: child,
            onPressed: onPressed,
          );
  }
}
