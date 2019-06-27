import 'package:flutter/material.dart';

import 'package:cyclecheck/src/config/colors.dart';

class AccentLine extends Container {
  AccentLine({
    Key key,
    @required double width,
    double height = 1.25,
  })  : assert(width > 0),
        super(
          key: key,
          color: AppColors.accent,
          width: width,
          height: height,
        );
}
