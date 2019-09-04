import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cyclecheck/src/config/dimens.dart';
import 'package:cyclecheck/src/ui/screens/home/bloc/cyclescore_bloc.dart';
import 'package:cyclecheck/src/ui/widgets/empty.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScoreDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CycleScoreBloc>(context).state;
    final selected = state.selected;

    return Container(
      constraints: BoxConstraints(maxWidth: Dimens.max_width_screen),
      child: selected == null
          ? Empty.fill() // TODO: Empty state
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  child: Text(
                    "Should you bike ${_getHourText(state)}?",
                    style: Theme.of(context).textTheme.headline,
                  ),
                ),
                SizedBox(
                  width: Dimens.max_width_screen,
                  height: 100,
                  child: AutoSizeText(
                    _getAnswerText(selected.score.value),
                    style: TextStyle(fontSize: 90),
                    maxLines: 1,
                  ),
                ),
                Text("${(selected.score.value * 100).round()}%"),
                // TODO
                Text(
                  "I would recommend that you bike today, the next few hours are ideal.",
                ),
              ],
            ),
    );
  }

  String _getAnswerText(double score) {
    if (score >= 0.85)
      return "Yes.";
    else if (score >= 0.5)
      return "Maybe...";
    else
      return "No.";
  }

  String _getHourText(CycleScoreState state) {
    if (state.selectedIndex == 0) return "now";

    return timeago.format(
      state.selected.forecastedTime,
      allowFromNow: true,
    );
  }
}
