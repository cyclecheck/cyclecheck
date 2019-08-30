import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cyclecheck/src/config/dimens.dart';
import 'package:cyclecheck/src/ui/screens/home/bloc/cyclescore_bloc.dart';
import 'package:cyclecheck/src/ui/widgets/empty.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScoreDisplay extends StatelessWidget {
  final SubTitles _subTitles = SubTitles();

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CycleScoreBloc>(context).state;
    final selected = state.selectedWeather;
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
                    maxLines: 1,
                  ),
                ),
                Text("${_subTitles.get(selected.score.value)},"), // TODO
                SizedBox(
                  width: Dimens.max_width_screen,
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
    if (state.selected == 0) return "now";

    return timeago.format(
      state.selectedWeather.forecastedTime,
      allowFromNow: true,
    );
  }
}

class SubTitles with RandomText {
  static const List<String> _absoluteList = [
    "Absolutely",
    "For sure",
  ];

  String get _absolute => randomize(_absoluteList);

  static const List<String> _maybeList = [
    "Probably",
  ];

  String get _maybe => randomize(_maybeList);

  static const List<String> _riskyList = [
    "I wouldn't but",
  ];

  String get _risky => randomize(_riskyList);

  String get(double score) {
    if (score >= 0.95)
      return _absolute;
    else if (score >= 0.5)
      return _maybe;
    else
      return _risky;
  }
}

mixin RandomText {
  final _random = Random();

  String randomize(List<String> texts) => texts[_randomIndex(texts.length)];

  int _randomIndex(int length) => _random.nextInt(length);
}
