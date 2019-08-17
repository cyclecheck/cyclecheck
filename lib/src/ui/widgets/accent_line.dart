import 'package:flutter/material.dart';

import 'package:cyclecheck/src/config/colors.dart';

class AccentLine extends Container {
  static const double _defaultValue = 1.25;

  AccentLine({
    Key key,
    @required double width,
    double height = _defaultValue,
  })  : assert(width > 0),
        super(
          key: key,
          color: AppColors.accent,
          width: width,
          height: height,
        );

  AccentLine.vertical({
    Key key,
    double width = _defaultValue,
    @required double height,
  })  : assert(height > 0),
        super(
          key: key,
          color: AppColors.accent,
          width: width,
          height: height,
        );
}
