import 'package:flutter/material.dart';

import 'package:cyclecheck/src/config/colors.dart';

class AccentLine extends Container {
  static const double _defaultValue = 1.25;

  final Color color;

  AccentLine({
    Key key,
    @required double width,
    this.color = AppColors.accent,
    double height = _defaultValue,
  })  : assert(width > 0),
        super(
          key: key,
          color: color,
          width: width,
          height: height,
        );

  AccentLine.vertical({
    Key key,
    double width = _defaultValue,
    @required double height,
    this.color = AppColors.accent,
  })  : assert(height > 0),
        super(
          key: key,
          color: color,
          width: width,
          height: height,
        );
}
